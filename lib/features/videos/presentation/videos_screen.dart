import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _HybridReelsSafeState();
}

class _HybridReelsSafeState extends State<VideosScreen> with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController(
    viewportFraction: 1.0,
    keepPage: true,
  );

  final DefaultCacheManager _cacheManager = DefaultCacheManager();

  final List<String> _videoUrls = [
    'https://www.pexels.com/download/video/3196175/',
    'https://www.pexels.com/download/video/4474373/',
    'https://www.pexels.com/download/video/853816/',
    'https://www.pexels.com/download/video/854082/',
    'https://www.pexels.com/download/video/2832316/',
    'https://www.pexels.com/download/video/3378581/',
    'https://www.pexels.com/download/video/1111421/',
    'https://www.pexels.com/download/video/854216/',
    'https://www.pexels.com/download/video/855128/',
  ];

  static const int _preloadRange = 1;
  static const int _keepAliveRange = 1;

  final Map<int, VideoPlayerController> _controllers = {};
  final Map<int, bool> _loadFailed = {};
  final Map<int, bool> _isInitializing = {};
  final Map<int, String> _cachedFilePaths = {};

  late final List<int> _likes;
  late final List<bool> _isLiked;

  bool _isDisposed = false;
  int _currentIndex = 0;
  int? _lastPreloadIndex;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _likes = List.generate(_videoUrls.length, (i) => 1000 + i * 10);
    _isLiked = List.generate(_videoUrls.length, (i) => false);

    _pageController.addListener(_handleScroll);

    _ensureFirstVideoReady().then((_) {
      if (!_isDisposed && mounted) setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadVideosAround(0);
    });
  }

  void _handleScroll() {
    final page = _pageController.hasClients ? _pageController.page : null;
    if (page == null) return;
    final closest = page.round();
    if (_lastPreloadIndex == closest) return;
    _lastPreloadIndex = closest;
    _preloadVideosAround(closest);
  }

  Future<void> _ensureFirstVideoReady() async {
    if (_videoUrls.isEmpty) return;

    final rawUrl = _videoUrls.first;

    try {
      final fileInfo = await _cacheManager.getFileFromCache(rawUrl);
      if (fileInfo != null && fileInfo.file.existsSync()) {
        _cachedFilePaths[0] = fileInfo.file.path;
        await _initControllerAt(0);
        return;
      }

      final file = await _cacheManager.getSingleFile(rawUrl);
      _cachedFilePaths[0] = file.path;
      if (!_isDisposed) await _initControllerAt(0);
    } catch (_) {
      if (!_isDisposed) await _initControllerAt(0);
    }
  }

  Future<void> _preloadVideoFile(int index) async {
    if (index < 0 || index >= _videoUrls.length) return;
    if (_cachedFilePaths.containsKey(index)) return;

    final rawUrl = _videoUrls[index];
    try {
      _cacheManager.getSingleFile(rawUrl).then((file) {
        if (!_isDisposed && mounted) _cachedFilePaths[index] = file.path;
      }).catchError((_) {});
    } catch (_) {}
  }

  void _preloadVideosAround(int centerIndex) {
    for (int offset = 0; offset <= _preloadRange; offset++) {
      final forward = centerIndex + offset;
      final backward = centerIndex - offset;

      if (forward >= 0 && forward < _videoUrls.length) {
        if (!_cachedFilePaths.containsKey(forward)) _preloadVideoFile(forward);
        if (!_controllers.containsKey(forward) &&
            !(_isInitializing[forward] ?? false) &&
            !(_loadFailed[forward] ?? false)) {
          _initControllerAt(forward);
        }
      }

      if (backward >= 0 &&
          backward < _videoUrls.length &&
          backward != forward) {
        if (!_cachedFilePaths.containsKey(backward)) _preloadVideoFile(backward);
        if (!_controllers.containsKey(backward) &&
            !(_isInitializing[backward] ?? false) &&
            !(_loadFailed[backward] ?? false)) {
          _initControllerAt(backward);
        }
      }
    }
  }

  Future<void> _initControllerAt(int index) async {
    if (index < 0 || index >= _videoUrls.length) return;
    if (_controllers.containsKey(index) || (_loadFailed[index] ?? false)) return;
    if (_isInitializing[index] ?? false) return;

    _isInitializing[index] = true;
    final rawUrl = _videoUrls[index];

    try {
      final source = await _resolveVideoSource(index, rawUrl);
      if (_isDisposed) {
        _isInitializing[index] = false;
        return;
      }

      final controller = source.startsWith('http')
          ? VideoPlayerController.networkUrl(
              Uri.parse(source),
              videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
            )
          : VideoPlayerController.file(
              File(source),
              videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
            );

      _controllers[index] = controller;

      await controller.initialize();
      controller.setLooping(true);
      controller.setVolume(1.0);

      if (index == 0 && !_isDisposed && mounted) {
        Future.microtask(() {
          if (_currentIndex == 0) _playAt(0);
        });
      }

      if (mounted && !_isDisposed) {
        Future.microtask(() => setState(() {}));
      }
    } catch (_) {
      _loadFailed[index] = true;
      final controller = _controllers.remove(index);
      if (controller != null) {
        try {
          await controller.dispose();
        } catch (_) {}
      }
      if (mounted && !_isDisposed) setState(() {});
    } finally {
      _isInitializing[index] = false;
    }
  }

  Future<String> _resolveVideoSource(int index, String rawUrl) async {
    if (_cachedFilePaths.containsKey(index)) {
      return _cachedFilePaths[index]!;
    }

    try {
      final fileInfo = await _cacheManager.getFileFromCache(rawUrl);
      if (fileInfo != null && fileInfo.file.existsSync()) {
        _cachedFilePaths[index] = fileInfo.file.path;
        return fileInfo.file.path;
      }
    } catch (_) {}

    try {
      final file = await _cacheManager.getSingleFile(rawUrl).timeout(
            const Duration(seconds: 4),
            onTimeout: () => throw TimeoutException('cache timeout'),
          );
      _cachedFilePaths[index] = file.path;
      return file.path;
    } catch (_) {
      _preloadVideoFile(index);
      return rawUrl;
    }
  }

  Future<void> _disposeControllerAt(int index) async {
    final controller = _controllers.remove(index);
    if (controller != null) {
      try {
        await controller.pause();
        await controller.dispose();
      } catch (_) {}
    }
  }

  void _playAt(int index) {
    final controller = _controllers[index];
    if (controller != null && controller.value.isInitialized) {
      controller.play();
    }
  }

  void _pauseAt(int index) {
    final controller = _controllers[index];
    if (controller != null && controller.value.isInitialized) {
      controller.pause();
    }
  }

  void _onPageChanged(int page) {
    if (_isDisposed || page == _currentIndex) return;

    final previous = _currentIndex;
    _currentIndex = page;
    _pauseAt(previous);

    if (_controllers.containsKey(page) && _controllers[page]!.value.isInitialized) {
      _playAt(page);
    } else {
      _initControllerAt(page).then((_) {
        if (!_isDisposed && _currentIndex == page) _playAt(page);
      });
    }

    Future.microtask(() {
      if (mounted) setState(() {});
      _handlePreloadingAndCleanup(page);
    });
  }

  void _handlePreloadingAndCleanup(int page) {
    if (_isDisposed) return;

    _preloadVideosAround(page);

    final keep = <int>{};
    for (int offset = -_keepAliveRange; offset <= _keepAliveRange; offset++) {
      final idx = page + offset;
      if (idx >= 0 && idx < _videoUrls.length) keep.add(idx);
    }

    final toDispose = _controllers.keys.where((idx) => !keep.contains(idx)).toList();
    for (final idx in toDispose) {
      _disposeControllerAt(idx);
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _pageController.removeListener(_handleScroll);
    for (final controller in _controllers.values) {
      try {
        controller.pause();
        controller.dispose();
      } catch (_) {}
    }
    _controllers.clear();
    _isInitializing.clear();
    _cachedFilePaths.clear();
    _pageController.dispose();
    _cacheManager.dispose();
    super.dispose();
  }

  Widget _buildVideoPage(int index) {
    final controller = _controllers[index];
    final failed = _loadFailed[index] ?? false;
    final isFirst = index == 0;

    Widget content;

    if (failed) {
      content = const Center(
        child: Text(
          'Video not available',
          style: TextStyle(color: Colors.white),
        ),
      );
    } else if (controller == null || !controller.value.isInitialized) {
      content = isFirst
          ? const SizedBox.shrink()
          : const Center(child: CircularProgressIndicator());
    } else {
      content = RepaintBoundary(
        child: GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
            setState(() {});
          },
          onDoubleTap: () {
            _isLiked[index] = !_isLiked[index];
            _likes[index] += _isLiked[index] ? 1 : -1;
            setState(() {});
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                ),
              ),
              if (!controller.value.isPlaying)
                const Center(
                  child: Icon(Icons.play_arrow, size: 90, color: Colors.white70),
                ),
            ],
          ),
        ),
      );
    }

    final rightActions = Positioned(
      right: 12,
      bottom: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(radius: 22, backgroundImage: AssetImage('assets/profile.png')),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () {
              setState(() {
                _isLiked[index] = !_isLiked[index];
                _likes[index] += _isLiked[index] ? 1 : -1;
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.favorite,
                  color: _isLiked[index] ? Colors.red : Colors.white,
                  size: 34,
                ),
                const SizedBox(height: 6),
                Text(
                  '${_likes[index]}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () => _showComments(index),
            child: const Column(
              children: [
                Icon(Icons.chat_bubble_outline, color: Colors.white, size: 34),
                SizedBox(height: 6),
                Text('Comments', style: TextStyle(color: Colors.white, fontSize: 10)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () => _shareVideo(index),
            child: const Column(
              children: [
                Icon(Icons.share, color: Colors.white, size: 34),
                SizedBox(height: 6),
                Text('Share', style: TextStyle(color: Colors.white, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );

    final leftCaption = Positioned(
      left: 16,
      bottom: 24,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.62,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@chef_${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Delicious recipe part ${index + 1} 🔥😋',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: Colors.black, child: content),
        rightActions,
        leftCaption,
      ],
    );
  }

  void _showComments(int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return SizedBox(
          height: 360,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(height: 4, width: 48, color: Colors.grey[300]),
              const SizedBox(height: 12),
              const Text('Comments', style: TextStyle(fontWeight: FontWeight.bold)),
              const Divider(),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: CircleAvatar(child: Text('U${i + 1}')),
                      title: Text('User ${i + 1}'),
                      subtitle: Text('Nice recipe! ${i + 1}'),
                    );
                  },
                  separatorBuilder: (context, i) => const Divider(),
                  itemCount: 8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Add a comment...'),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _shareVideo(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Share video ${index + 1}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        allowImplicitScrolling: true,
        scrollDirection: Axis.vertical,
        itemCount: _videoUrls.length,
        onPageChanged: _onPageChanged,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index) {
          return RepaintBoundary(
            key: ValueKey(index),
            child: _buildVideoPage(index),
          );
        },
      ),
    );
  }
}

