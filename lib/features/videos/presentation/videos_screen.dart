import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> videos = [
    {
      "url": "https://www.pexels.com/download/video/3196175/",
      "username": "@foodlover",
      "caption": "Spicy Masala Noodles🔥",
      "tags": "#food #noodles #recipe",
      "likes": 4567,
      "comments": 139,
      "profile": "assets/profile2.png",
    },
    {
      "url": "https://www.pexels.com/download/video/4474373/",
      "username": "@chef_Ali",
      "caption": "Sushi Plater Recipe 🍱",
      "tags": "#healthy #foodlover #sea food",
      "likes": 4251,
      "comments": 230,
      "profile": "assets/profile.png",
    },
    {
      "url": "https://www.pexels.com/download/video/853816/",
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
      "url": "https://www.pexels.com/download/video/3196344/",
      "username": "@streetfoodlover",
      "caption": "Best Pizza in Town 🍕🔥",
      "tags": "#pizza #streetfood",
      "likes": 7891,
      "comments": 398,
      "profile": "assets/profile2.png",
    },
    {
      "url": "https://www.pexels.com/download/video/3378581/",
      "username": "@chef_faiza",
      "caption": "Choclate Pan Cakes 🥮🍫",
      "tags": "#healthy #foodlover",
      "likes": 5325,
      "comments": 322,
      "profile": "assets/profile.png",
    },
  ];

  late List<VideoPlayerController?> videoControllers;
  late List<ChewieController?> chewieControllers;
  late List<bool> videoLoadFailed; // track which video failed to load

  late List<int> likes;
  late List<bool> isLiked;

  late AnimationController _rotationController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    videoControllers = List.generate(videos.length, (index) => null);
    chewieControllers = List.generate(videos.length, (index) => null);
    videoLoadFailed = List.generate(videos.length, (index) => false);

    likes = videos.map((v) => v['likes'] as int).toList();
    isLiked = List.generate(videos.length, (index) => false);

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    initializeVideo(0);
  }

  Future<void> initializeVideo(int index) async {
    if (videoControllers[index] != null || videoLoadFailed[index]) return;

    try {
      final controller = VideoPlayerController.network(videos[index]["url"]);
      await controller.initialize();

      final chewie = ChewieController(
        videoPlayerController: controller,
        autoPlay: index == currentIndex,
        looping: true,
        showControls: false,
      );

      if (!mounted) return;

      setState(() {
        videoControllers[index] = controller;
        chewieControllers[index] = chewie;
      });

      if (index == currentIndex) {
        _rotationController.repeat();
      }
    } catch (e) {
      // Video failed to load → mark failed, so we don’t try again
      setState(() {
        videoLoadFailed[index] = true;
      });
      // Optionally print error to console
      debugPrint('Error loading video at index $index: $e');
    }
  }

  void disposeVideo(int index) {
    videoControllers[index]?.dispose();
    chewieControllers[index]?.dispose();
    videoControllers[index] = null;
    chewieControllers[index] = null;
  }

  @override
  void dispose() {
    for (var i = 0; i < videos.length; i++) {
      disposeVideo(i);
    }
    _rotationController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) async {
    setState(() {
      currentIndex = index;
    });

    await initializeVideo(index);
    if (index + 1 < videos.length) initializeVideo(index + 1);
    if (index - 1 >= 0) initializeVideo(index - 1);

    for (var i = 0; i < videos.length; i++) {
      if ((i - index).abs() > 1) {
        disposeVideo(i);
      }
    }

    chewieControllers[index]?.play();
    _rotationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return buildVideoPage(index);
        },
      ),
    );
  }

  Widget buildVideoPage(int index) {
    final data = videos[index];

    Widget videoWidget;
    if (videoLoadFailed[index]) {
      // If load failed, show a placeholder
      videoWidget = const Center(
        child: Text(
          "Video not available",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    } else if (chewieControllers[index] != null) {
      videoWidget = Chewie(controller: chewieControllers[index]!);
    } else {
      videoWidget = const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        Positioned.fill(child: videoWidget),

        Positioned(top: 40, left: 20, child: Image.asset('assets/dine.png', height: 36)),
        Positioned(top: 40, right: 20, child: Image.asset('assets/notification.png', height: 32)),

        Positioned(
          right: 15,
          bottom: 30,
          child: Column(
            children: [
              CircleAvatar(radius: 25, backgroundImage: AssetImage(data["profile"])),
              const SizedBox(height: 20),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!isLiked[index]) {
                          likes[index] += 1;
                          isLiked[index] = true;
                        } else {
                          likes[index] -= 1;
                          isLiked[index] = false;
                        }
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color: isLiked[index] ? Colors.red : Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text("${likes[index]}", style: const TextStyle(color: Colors.white, fontSize: 11)),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 32),
                  const SizedBox(height: 5),
                  Text("${data['comments']}", style: const TextStyle(color: Colors.white, fontSize: 11)),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: const [
                  Icon(Icons.share, color: Colors.white, size: 32),
                  SizedBox(height: 5),
                  Text("Share", style: TextStyle(color: Colors.white, fontSize: 11)),
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
              Text(data["username"],
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(height: 5),
              Text(data["tags"], style: const TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 5),
              Text(data["caption"], style: const TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}