
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:dealdine_application/widgets/left_sidebar.dart';
import 'package:dealdine_application/widgets/top_navbar.dart';
import 'package:dealdine_application/widgets/mobile_appbar.dart';
import 'package:dealdine_application/device/video/video_helper.dart';

// -------------------- DATA MODELS --------------------
class WebVideoData {
  final String name;
  final Uint8List bytes;
  WebVideoData({required this.name, required this.bytes});
}

class LocalVideoData {
  final File file;
  final Uint8List thumbnail;
  LocalVideoData({required this.file, required this.thumbnail});
}

// -------------------- MAIN SCREEN --------------------
class RestaurantUploadVideoScreen extends StatefulWidget {
  const RestaurantUploadVideoScreen({super.key});

  @override
  State<RestaurantUploadVideoScreen> createState() =>
      _RestaurantUploadVideoScreenState();
}

class _RestaurantUploadVideoScreenState
    extends State<RestaurantUploadVideoScreen> {
  List<dynamic> uploadedVideos = [];
  final Map<String, VideoPlayerController> _mobileControllers = {};
  final Set<String> _initializingControllers = {};

  @override
  void dispose() {
    for (final controller in _mobileControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  // -------------------- PICK VIDEO --------------------
  Future<void> pickVideo() async {
    if (kIsWeb) {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['mp4', 'mov', 'avi'],
        withData: true,
      );

      if (result == null) return;

      final bytes = result.files.single.bytes;
      final name = result.files.single.name;
      if (bytes != null) {
        setState(() {
          uploadedVideos.add(WebVideoData(name: name, bytes: bytes));
        });
      }
      return;
    }

    // Mobile: show bottom sheet for Gallery / Camera
    final picker = ImagePicker();
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    final pickedFile =
        await picker.pickVideo(source: source, maxDuration: const Duration(minutes: 10));
    if (pickedFile == null) return;

    final file = await _persistVideoFile(pickedFile);
    final thumbnail = await VideoThumbnail.thumbnailData(
      video: file.path,
      imageFormat: ImageFormat.PNG,
      maxHeight: 300,
      quality: 75,
    );

    final videoData = LocalVideoData(
      file: file,
      thumbnail: thumbnail ?? Uint8List(0),
    );

    setState(() {
      uploadedVideos.add(videoData);
    });

    unawaited(_prepareMobileController(videoData));
  }

  Future<File> _persistVideoFile(XFile pickedFile) async {
    final tempDir = await getTemporaryDirectory();
    final uploadsDir = Directory('${tempDir.path}/uploaded_videos');
    if (!await uploadsDir.exists()) {
      await uploadsDir.create(recursive: true);
    }

    final originalName = pickedFile.name.isNotEmpty
        ? pickedFile.name
        : pickedFile.path.split('/').last;
    final sanitizedName =
        originalName.isNotEmpty ? originalName : 'video.mp4';
    final targetPath =
        '${uploadsDir.path}/${DateTime.now().millisecondsSinceEpoch}_$sanitizedName';
    final targetFile = File(targetPath);

    await pickedFile.saveTo(targetFile.path);
    return targetFile;
  }

  Future<void> _prepareMobileController(LocalVideoData video) async {
    final key = video.file.path;
    if (_mobileControllers.containsKey(key) ||
        _initializingControllers.contains(key)) {
      return;
    }

    _initializingControllers.add(key);
    try {
      final controller = VideoPlayerController.file(video.file);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      _mobileControllers[key] = controller;
    } catch (err) {
      debugPrint('Failed to init controller for ${video.file.path}: $err');
    } finally {
      _initializingControllers.remove(key);
      if (mounted) setState(() {});
    }
  }

  void _openWebFullScreen(WebVideoData video) {
    if (!kIsWeb || uploadedVideos.isEmpty) return;
    final webVideos = uploadedVideos.whereType<WebVideoData>().toList();
    if (webVideos.isEmpty) return;

    final startIndex = webVideos.indexOf(video);
    if (startIndex == -1) return;

    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black.withOpacity(0.9),
        barrierDismissible: true,
        barrierLabel: 'Close video',
        pageBuilder: (_, __, ___) => WebFullScreenVideoPlayer(
          videos: webVideos,
          initialIndex: startIndex,
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
      ),
    );
  }

  // -------------------- BUILD VIDEO ITEM --------------------
  Widget buildVideoItem(dynamic video, int index) {
    if (kIsWeb && video is WebVideoData) {
      return WebVideoPlayerItem(
        video: video,
        onOpenFullscreen: () => _openWebFullScreen(video),
      );
    } else if (!kIsWeb && video is LocalVideoData) {
      final key = video.file.path;
      return MobileVideoPlayerItem(
        video: video,
        controller: _mobileControllers[key],
        isInitializing: _initializingControllers.contains(key),
        onRetryInit: () => _prepareMobileController(video),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWeb = width >= 1000;
    final isTablet = width >= 600 && width < 1000;
    final isMobile = !isWeb && !isTablet;

    return Scaffold(
      backgroundColor: const Color(0xFFdee2e6),
      appBar: isMobile ? const MobileAppBar() : null,
      drawer:
          isMobile ? Drawer(child: LeftSidebar(width: 220, showLabels: true)) : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isWeb || isTablet)
              LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMobile)
                    const SizedBox(
                      height: 70,
                      child: TopNavBar(isWeb: true),
                    ),
                  if (isMobile)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search videos...',
                          prefixIcon: const Icon(Icons.search),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Video Upload & Management",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(
                        40,
                        0,
                        40,
                        MediaQuery.of(context).viewInsets.bottom + 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(22),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Upload New Video",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 16),
                                GestureDetector(
                                  onTap: pickVideo,
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.videocam_outlined,
                                              size: 40,
                                              color: Color(0xFF6B7180)),
                                          SizedBox(height: 10),
                                          Text(
                                            "Drag and drop your video here, or click to browse",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF6B7180)),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "MP4, MOV, AVI up to 500MB",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF9DA6B0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Your Videos",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              if (constraints.maxWidth < 600) {
                                return Column(
                                  children: List.generate(
                                    uploadedVideos.length,
                                    (index) => Padding(
                                      padding: EdgeInsets.only(
                                        bottom: index ==
                                                uploadedVideos.length - 1
                                            ? 0
                                            : 20,
                                      ),
                                      child: buildVideoItem(
                                          uploadedVideos[index], index),
                                    ),
                                  ),
                                );
                              }
                              int crossAxisCount = 3;
                              if (constraints.maxWidth < 900) crossAxisCount = 2;
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: uploadedVideos.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  childAspectRatio: 0.8,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                ),
                                itemBuilder: (context, index) => buildVideoItem(
                                    uploadedVideos[index], index),
                              );
                            },
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// -------------------- WEB VIDEO PLAYER --------------------
class WebVideoPlayerItem extends StatefulWidget {
  final WebVideoData video;
  final VoidCallback? onOpenFullscreen;
  const WebVideoPlayerItem(
      {super.key, required this.video, this.onOpenFullscreen});

  @override
  State<WebVideoPlayerItem> createState() => _WebVideoPlayerItemState();
}

class _WebVideoPlayerItemState extends State<WebVideoPlayerItem>
    with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _controller;

  void _handlePlaybackUpdates() {
    final value = _controller.value;
    if (!value.isInitialized) return;
    if (value.duration == Duration.zero) return;
    if (!value.isPlaying && value.position >= value.duration) {
      _controller.seekTo(Duration.zero);
      _controller.play();
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initWebVideo();
  }

  Future<void> _initWebVideo() async {
    _controller = await VideoHelper.fromBytes(widget.video.bytes);
    _controller.addListener(_handlePlaybackUpdates);
    await _controller.setLooping(true);
    await _controller.play();
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_handlePlaybackUpdates);
    _controller.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {});
  }

  void rewind10() {
    final pos = _controller.value.position - const Duration(seconds: 10);
    _controller.seekTo(pos >= Duration.zero ? pos : Duration.zero);
  }

  void forward10() {
    final pos = _controller.value.position + const Duration(seconds: 10);
    final duration = _controller.value.duration;
    _controller.seekTo(pos <= duration ? pos : duration);
  }

  String formatDuration(Duration d) {
    return "${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:${d.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double videoHeight = _controller.value.isInitialized
        ? 200 * _controller.value.size.height / _controller.value.size.width
        : 200;

    return Container(
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.onOpenFullscreen ?? togglePlayPause,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: _controller.value.isInitialized
                      ? SizedBox(
                          height: videoHeight,
                          width: double.infinity,
                          child: VideoPlayer(_controller),
                        )
                      : Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: const Center(
                              child: Icon(Icons.videocam,
                                  size: 40, color: Colors.white70)),
                        ),
                ),
                const Positioned.fill(
                  child: Center(
                    child: Icon(
                      Icons.play_circle_outline,
                      size: 50,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
          VideoControls(controller: _controller, rewind: rewind10, forward: forward10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(widget.video.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                if (_controller.value.isInitialized)
                  Text(formatDuration(_controller.value.duration),
                      style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text("238K views",
                style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
          ),
        ],
      ),
    );
  }
}

// -------------------- MOBILE VIDEO PLAYER --------------------
class MobileVideoPlayerItem extends StatefulWidget {
  final LocalVideoData video;
  final VideoPlayerController? controller;
  final bool isInitializing;
  final Future<void> Function()? onRetryInit;

  const MobileVideoPlayerItem({
    super.key,
    required this.video,
    required this.controller,
    required this.isInitializing,
    this.onRetryInit,
  });

  @override
  State<MobileVideoPlayerItem> createState() => _MobileVideoPlayerItemState();
}

class _MobileVideoPlayerItemState extends State<MobileVideoPlayerItem>
    with AutomaticKeepAliveClientMixin {
  VideoPlayerController? _controller;
  VideoPlayerValue? _lastValue;

  @override
  void initState() {
    super.initState();
    _syncController();
  }

  @override
  void didUpdateWidget(covariant MobileVideoPlayerItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_controllerListener);
      _syncController();
      setState(() {});
    }
  }

  void _syncController() {
    _controller = widget.controller;
    _lastValue = _controller?.value;
    _controller?.addListener(_controllerListener);
  }

  void _controllerListener() {
    final controller = _controller;
    if (controller == null) return;
    _handlePlaybackUpdates(controller);
    final value = controller.value;
    if (_lastValue == null ||
        _lastValue!.isPlaying != value.isPlaying ||
        _lastValue!.isInitialized != value.isInitialized ||
        _lastValue!.hasError != value.hasError) {
      _lastValue = value;
      if (mounted) setState(() {});
    }
  }

  void _handlePlaybackUpdates(VideoPlayerController controller) {
    final value = controller.value;
    if (!value.isInitialized) return;
    if (value.duration == Duration.zero) return;
    if (!value.isPlaying && value.position >= value.duration) {
      controller.seekTo(Duration.zero);
      controller.play();
    }
  }

  void togglePlayPause() {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    setState(() {});
  }

  void rewind10() {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    final pos = controller.value.position - const Duration(seconds: 10);
    controller.seekTo(pos >= Duration.zero ? pos : Duration.zero);
  }

  void forward10() {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    final pos = controller.value.position + const Duration(seconds: 10);
    final duration = controller.value.duration;
    controller.seekTo(pos <= duration ? pos : duration);
  }

  String formatDuration(Duration d) {
    return "${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:${d.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _controller?.removeListener(_controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controllerReady =
        _controller != null && _controller!.value.isInitialized;
    final controllerHasError =
        _controller != null && _controller!.value.hasError;
    final videoHeight = controllerReady
        ? 200.0 *
            _controller!.value.size.height /
            _controller!.value.size.width
        : 200.0;

    return Container(
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: controllerReady ? togglePlayPause : null,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: controllerReady
                      ? SizedBox(
                          height: videoHeight,
                          width: double.infinity,
                          child: VideoPlayer(_controller!),
                        )
                      : Image.memory(
                          widget.video.thumbnail,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
                if (widget.isInitializing)
                  const Positioned.fill(
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                else if (controllerHasError)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black45,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.error_outline,
                              color: Colors.white, size: 32),
                          const SizedBox(height: 8),
                          Text(
                            _controller?.value.errorDescription ??
                                'Playback error',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                          if (widget.onRetryInit != null)
                            TextButton(
                              onPressed: widget.onRetryInit,
                              child: const Text('Retry',
                                  style: TextStyle(color: Colors.white)),
                            ),
                        ],
                      ),
                    ),
                  )
                else if (!controllerReady)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: widget.onRetryInit,
                          icon: const Icon(Icons.refresh, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                else
                  Positioned.fill(
                    child: _controller!.value.isPlaying
                        ? const SizedBox()
                        : const Center(
                            child: Icon(Icons.play_circle_outline,
                                size: 50, color: Colors.white70)),
                  ),
              ],
            ),
          ),
          if (controllerReady)
            VideoControls(
                controller: _controller!,
                rewind: rewind10,
                forward: forward10)
          else
            const SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(widget.video.file.path.split('/').last,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                if (controllerReady)
                  Text(formatDuration(_controller!.value.duration),
                      style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text("238K views",
                style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// -------------------- VIDEO CONTROLS --------------------
class VideoControls extends StatefulWidget {
  final VideoPlayerController controller;
  final VoidCallback rewind;
  final VoidCallback forward;

  const VideoControls(
      {super.key,
      required this.controller,
      required this.rewind,
      required this.forward});

  @override
  State<VideoControls> createState() => _VideoControlsState();
}

// -------------------- WEB FULL SCREEN PLAYER --------------------
class WebFullScreenVideoPlayer extends StatefulWidget {
  final List<WebVideoData> videos;
  final int initialIndex;

  const WebFullScreenVideoPlayer(
      {super.key, required this.videos, required this.initialIndex});

  @override
  State<WebFullScreenVideoPlayer> createState() =>
      _WebFullScreenVideoPlayerState();
}

class _WebFullScreenVideoPlayerState extends State<WebFullScreenVideoPlayer> {
  VideoPlayerController? _controller;
  int _currentIndex = 0;
  bool _isLoading = true;
  String? _error;

  WebVideoData get _currentVideo => widget.videos[_currentIndex];

  @override
  void initState() {
    super.initState();
    _currentIndex =
        widget.initialIndex.clamp(0, widget.videos.length - 1);
    _loadController();
  }

  Future<void> _loadController() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    await _controller?.dispose();
    try {
      final controller = await VideoHelper.fromBytes(_currentVideo.bytes);
      await controller.setLooping(true);
      await controller.play();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() {
        _controller = controller;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _showNext() {
    if (_currentIndex + 1 >= widget.videos.length) return;
    setState(() {
      _currentIndex++;
    });
    _loadController();
  }

  void _showPrevious() {
    if (_currentIndex == 0) return;
    setState(() {
      _currentIndex--;
    });
    _loadController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllerReady =
        _controller != null && _controller!.value.isInitialized;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : _error != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.error_outline,
                                  color: Colors.white, size: 48),
                              const SizedBox(height: 12),
                              Text(
                                _error!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: _loadController,
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            if (!controllerReady) return;
                            setState(() {
                              if (_controller!.value.isPlaying) {
                                _controller!.pause();
                              } else {
                                _controller!.play();
                              }
                            });
                          },
                          child: AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: VideoPlayer(_controller!),
                                ),
                                Positioned.fill(
                                  child: Center(
                                    child: Icon(
                                      _controller!.value.isPlaying
                                          ? Icons.pause_circle_outline
                                          : Icons.play_circle_outline,
                                      size: 64,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 28),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Text(
                _currentVideo.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 30,
              child: IconButton(
                onPressed: _currentIndex == 0 ? null : _showPrevious,
                icon: Icon(Icons.skip_previous,
                    size: 40,
                    color: _currentIndex == 0
                        ? Colors.white30
                        : Colors.white),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 30,
              child: IconButton(
                onPressed: _currentIndex + 1 >= widget.videos.length
                    ? null
                    : _showNext,
                icon: Icon(Icons.skip_next,
                    size: 40,
                    color: _currentIndex + 1 >= widget.videos.length
                        ? Colors.white30
                        : Colors.white),
              ),
            ),
            if (controllerReady)
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    VideoProgressIndicator(_controller!,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(
                            playedColor: Colors.redAccent)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed:
                              _currentIndex == 0 ? null : _showPrevious,
                          icon: const Icon(Icons.fast_rewind,
                              color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (_controller!.value.isPlaying) {
                                _controller!.pause();
                              } else {
                                _controller!.play();
                              }
                            });
                          },
                          icon: Icon(
                            _controller!.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        IconButton(
                          onPressed: _currentIndex + 1 >= widget.videos.length
                              ? null
                              : _showNext,
                          icon: const Icon(Icons.fast_forward,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _VideoControlsState extends State<VideoControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoProgressIndicator(widget.controller,
            allowScrubbing: true,
            padding: const EdgeInsets.symmetric(horizontal: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: widget.rewind, icon: const Icon(Icons.replay_10)),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.controller.value.isPlaying) {
                      widget.controller.pause();
                    } else {
                      widget.controller.play();
                    }
                  });
                },
                icon: Icon(
                    widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow)),
            IconButton(onPressed: widget.forward, icon: const Icon(Icons.forward_10)),
          ],
        ),
      ],
    );
  }
}
