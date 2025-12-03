
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:preload_page_view/preload_page_view.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final PreloadPageController _pageController = PreloadPageController();

  final List<Map<String, dynamic>> videos = [
    {
      "url": "https://www.pexels.com/download/video/4058071/",
      "username": "@foodlover",
      "caption": "Spicy Masala Noodles🔥",
      "tags": "#food #noodles #recipe",
      "likes": 4567,
      "comments": 139,
      "profile": "assets/profile2.png",
    },
    {
      "url": "https://www.pexels.com/download/video/3298011/",
      "username": "@chef_Ali",
      "caption": "Sushi Plater Recipe 🍱",
      "tags": "#healthy #foodlover #sea food",
      "likes": 4251,
      "comments": 230,
      "profile": "assets/profile.png",
    },
    {
      "url": "https://www.pexels.com/download/video/2961911/",
      "username": "@foodexplorer",
      "caption": "Crispy Chicken Tikka Kabab🔥",
      "tags": "#food #chicken #recipe",
      "likes": 2112,
      "comments": 143,
      "profile": "assets/profile2.png",
    },
    {
      "url": "https://www.pexels.com/download/video/854082/",
      "username": "@chef_danish",
      "caption": "Fruit Salad Recipe 🥭🍉",
      "tags": "#healthy #foodlover",
      "likes": 5321,
      "comments": 211,
      "profile": "assets/profile.png",
    },
    {
      "url": "https://www.pexels.com/download/video/3944332/",
      "username": "@streetfoodlover",
      "caption": "Best Pizza in Town 🍕🔥",
      "tags": "#pizza #streetfood",
      "likes": 7891,
      "comments": 398,
      "profile": "assets/profile2.png",
    },
    {
      "url": "https://www.pexels.com/download/video/855128/",
      "username": "@chef_faiza",
      "caption": "Stawberry IceCream🍧🍓🍨",
      "tags": "#healthy #foodlover",
      "likes": 5325,
      "comments": 322,
      "profile": "assets/profile.png",
    },
      {
      "url": "https://www.pexels.com/download/video/3195650/",
      "username": "@chef_danish",
      "caption": "Vegetables Salad🫑🥒🌽",
      "tags": "#healthy #foodlover",
      "likes": 5321,
      "comments": 211,
      "profile": "assets/profile.png",
    },
    {
      "url": "https://www.pexels.com/download/video/3304275/",
      "username": "@chef_danish",
      "caption": "Crispy Bake Peas",
      "tags": "#healthy #foodlover",
      "likes": 5321,
      "comments": 211,
      "profile": "assets/profile.png",
    },
    {
      "url": "https://www.pexels.com/download/video/854216/",
      "username": "@chef_Usman",
      "caption": "Mix Vegies Salan",
      "tags": "#healthy #foodlover",
      "likes": 5321,
      "comments": 211,
      "profile": "assets/profile2.png",
    },
     {
      "url": "https://www.pexels.com/download/video/5866268/",
      "username": "@chef_Usman",
      "caption": "Fruits Salad",
      "tags": "#healthy #foodlover",
      "likes": 5321,
      "comments": 211,
      "profile": "assets/profile2.png",
    },
    {
      "url": "https://www.pexels.com/download/video/856573/",
      "username": "@chef_Usman",
      "caption":"Tikka Masala",
      "tags": "#healthy #foodlover",
      "likes": 5321,
      "comments": 211,
      "profile": "assets/profile2.png",
    },
    {
      "url": "https://www.pexels.com/download/video/854089/",
      "username": "@chef_Usman",
      "caption":"Sandwich",
      "tags": "#healthy #foodlover",
      "likes": 5321,
      "comments": 211,
      "profile": "assets/profile2.png",
    },
  ];

  late List<VideoPlayerController?> videoControllers;
  late List<VoidCallback?> _listeners;
  late List<int> likes;
  late List<bool> isLiked;
  late List<bool> _userPaused;

  int currentIndex = 0;
  late AnimationController _rotationController;
  bool _appActive = true;
  final Set<int> _initializingIndices = <int>{};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    videoControllers = List.generate(videos.length, (_) => null);
    _listeners = List.generate(videos.length, (_) => null);
    likes = videos.map((v) => v['likes'] as int).toList();
    isLiked = List.generate(videos.length, (_) => false);
    _userPaused = List.generate(videos.length, (_) => false);

    _rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _initializeInitialControllers();
  }

  void _disposeController(int index) {
    if (index < 0 || index >= videos.length) return;
    try {
      _listeners[index]?.call();
    } catch (_) {}
    _listeners[index] = null;

    videoControllers[index]?.dispose();
    videoControllers[index] = null;
  }

  void _disposeFarControllers(int center) {
    for (int i = 0; i < videoControllers.length; i++) {
      if ((i - center).abs() > 2) {
        _disposeController(i);
      }
    }
  }

  void _preloadAround(int center) {
    for (final offset in [1, -1, 2, -2]) {
      final target = center + offset;
      if (target >= 0 && target < videos.length) {
        _createController(target);
      }
    }
  }

  Future<void> _initializeInitialControllers() async {
    await _createController(0);
    if (mounted) {
      await _playAtIndex(0);
    }
    _preloadAround(0);
  }

  Future<void> _createController(int index) async {
    if (index < 0 || index >= videos.length) return;
    if (videoControllers[index] != null) return;
    if (_initializingIndices.contains(index)) return;

    _initializingIndices.add(index);

    VideoPlayerController? controller;
    try {
      controller = VideoPlayerController.network(
        videos[index]['url'],
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: true,
          allowBackgroundPlayback: false,
        ),
      );

      await controller.initialize().timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw TimeoutException('Video initialization timeout at index $index');
        },
      );

      if (!controller.value.isInitialized) {
        throw Exception('Video controller not initialized at index $index');
      }

      controller.setLooping(true);

      VoidCallback listener = () {
        if (mounted && index == currentIndex) {
          setState(() {});
          if (controller!.value.isPlaying) {
            if (!_rotationController.isAnimating) _rotationController.repeat();
          } else {
            if (_rotationController.isAnimating) _rotationController.stop();
          }
        }
      };

      controller.addListener(listener);

      videoControllers[index] = controller;
      final savedController = controller;
      _listeners[index] = () {
        try {
          savedController.removeListener(listener);
        } catch (_) {}
      };

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      debugPrint('Video init error at $index: $e');

      try {
        await controller?.dispose();
      } catch (_) {}
      controller = null;

      if (mounted && videoControllers[index] == null) {
        Future.delayed(Duration(seconds: 2), () {
          if (mounted && videoControllers[index] == null) {
            _createController(index);
          }
        });
      }
    } finally {
      _initializingIndices.remove(index);
    }
  }

  Future<void> _playAtIndex(int index) async {
    if (index < 0 || index >= videos.length) return;
    if (!mounted) return;
    if (index != currentIndex) return;

    // Ensure controller exists
    var controller = videoControllers[index];
    if (controller == null || !controller.value.isInitialized) {
      await _createController(index);
      controller = videoControllers[index];
    }

    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (index != currentIndex) {
      return;
    }

    // Pause all other videos (non-blocking for fast scrolling)
    for (int i = 0; i < videoControllers.length; i++) {
      if (i != index) {
        final c = videoControllers[i];
        if (c != null && c.value.isPlaying) {
          // Don't await, let it pause in background
          c.pause().catchError((_) {});
        }
      }
    }

    try {
      if (!controller.value.isPlaying) {
        await controller.play().timeout(
          const Duration(seconds: 5),
          onTimeout: () {
            debugPrint('Play timeout at $index');
          },
        );
      }
      if (mounted && index == currentIndex) {
        _rotationController.repeat();
        setState(() {
          _userPaused[index] = false;
        });
      }
    } catch (e) {
      debugPrint('Play error at $index: $e');
      if (mounted && index == currentIndex) {
        Future.delayed(const Duration(milliseconds: 500), () async {
          if (!mounted || index != currentIndex) return;
          final retryController = videoControllers[index];
          if (retryController != null && retryController.value.isInitialized) {
            try {
              await retryController.play();
              if (mounted && index == currentIndex) {
                _rotationController.repeat();
              }
            } catch (err) {
              debugPrint('Retry play error at $index: $err');
            }
          }
        });
      }
    }
  }

  Future<void> _pauseAll() async {
    for (var c in videoControllers) {
      if (c != null && c.value.isPlaying) {
        await c.pause();
      }
    }
    _rotationController.stop();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    for (int i = 0; i < videoControllers.length; i++) {
      _listeners[i]?.call();
      videoControllers[i]?.dispose();
    }

    _rotationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final wasActive = _appActive;
    _appActive = state == AppLifecycleState.resumed;

    if (!_appActive && wasActive) {
      _pauseAll();
    } else if (_appActive && !wasActive) {
      _playAtIndex(currentIndex);
    }
    super.didChangeAppLifecycleState(state);
  }

  void _onPageChanged(int idx) {
    if (idx < 0 || idx >= videos.length) return;

    setState(() {
      currentIndex = idx;
      _userPaused[idx] = false;
    });

    _playAtIndex(idx);
    _preloadAround(idx);
    _disposeFarControllers(idx);
  }

  // ✅ FIXED: Aspect Ratio Correct
  Widget _buildVideoPlayer(int index) {
    final controller = videoControllers[index];
    if (controller == null || !controller.value.isInitialized) {
      // Show black background instead of loading indicator to avoid buffering appearance
      return Container(color: Colors.black);
    }

    return Center(
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      ),
    );
  }

  bool _shouldShowPlayOverlay(int index) {
    if (index != currentIndex) return false;
    if (index < 0 || index >= _userPaused.length) return false;
    return _userPaused[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PreloadPageView.builder(
        controller: _pageController,
        preloadPagesCount: 2,
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              final vc = videoControllers[index];
              if (vc != null && vc.value.isInitialized) {
                if (vc.value.isPlaying) {
                  vc.pause();
                  _rotationController.stop();
                  setState(() {
                    _userPaused[index] = true;
                  });
                } else {
                  _playAtIndex(index);
                  setState(() {
                    _userPaused[index] = false;
                  });
                }
              }
            },
            child: Stack(
              children: [
                Positioned.fill(child: _buildVideoPlayer(index)),
                if (_shouldShowPlayOverlay(index))
                  Positioned.fill(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.35),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 56,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Image.asset('assets/dine.png', height: 36),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: Image.asset('assets/notification.png', height: 32),
                ),
                Positioned(
                  right: 15,
                  bottom: 30,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(videos[index]['profile']),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!isLiked[index]) {
                              likes[index]++;
                              isLiked[index] = true;
                            } else {
                              likes[index]--;
                              isLiked[index] = false;
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Icon(Icons.favorite,
                                color: isLiked[index] ? Colors.red : Colors.white,
                                size: 32),
                            const SizedBox(height: 5),
                            Text("${likes[index]}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 11)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          const Icon(Icons.chat_bubble_outline,
                              color: Colors.white, size: 32),
                          const SizedBox(height: 5),
                          Text("${videos[index]['comments']}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 11)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: const [
                          Icon(Icons.share, color: Colors.white, size: 32),
                          SizedBox(height: 5),
                          Text("Share",
                              style: TextStyle(color: Colors.white, fontSize: 11)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      RotationTransition(
                        turns: _rotationController,
                        child: Image.asset(
                          'assets/Disc.png',
                          height: 36,
                          width: 36,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(videos[index]['username'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 5),
                      Text(videos[index]['tags'],
                          style: const TextStyle(color: Colors.white, fontSize: 14)),
                      const SizedBox(height: 5),
                      Text(videos[index]['caption'],
                          style: const TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
