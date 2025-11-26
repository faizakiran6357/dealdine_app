
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
      "url": "https://www.pexels.com/download/video/3196344/",
      "username": "@streetfoodlover",
      "caption": "Best Pizza in Town 🍕🔥",
      "tags": "#pizza #streetfood",
      "likes": 7891,
      "comments": 398,
      "profile": "assets/profile2.png",
    },
    {
      "url": "https://www.pexels.com/download/video/7141501/",
      "username": "@chef_faiza",
      "caption": "Choclate Pan Cakes 🥮🍫",
      "tags": "#healthy #foodlover",
      "likes": 5325,
      "comments": 322,
      "profile": "assets/profile.png",
    },
  ];

  // Controllers per video
  late List<VideoPlayerController?> videoControllers;
  late List<ChewieController?> chewieControllers;

  // Likes and user liked
  late List<int> likes;
  late List<bool> isLiked;

  // Rotation controller for disc
  late AnimationController _rotationController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    videoControllers = List.generate(videos.length, (index) => null);
    chewieControllers = List.generate(videos.length, (index) => null);

    likes = videos.map((v) => v['likes'] as int).toList();
    isLiked = List.generate(videos.length, (index) => false);

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    initializeVideo(0); // Initialize first video
  }

  Future<void> initializeVideo(int index) async {
    if (videoControllers[index] != null) return;

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

    return Stack(
      children: [
        // Video player
        Positioned.fill(
          child: chewieControllers[index] != null
              ? Chewie(controller: chewieControllers[index]!)
              : const Center(child: CircularProgressIndicator()),
        ),

        // Top icons
        Positioned(top: 40, left: 20, child: Image.asset('assets/dine.png', height: 36)),
        Positioned(top: 40, right: 20, child: Image.asset('assets/notification.png', height: 32)),

        // Right side buttons (moved closer to bottom)
        Positioned(
          right: 15,
          bottom: 30, // was 120
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
              // Rotating disc
              Column(
                children: [
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
            ],
          ),
        ),

        // Bottom left text (moved closer to bottom)
        Positioned(
          left: 20,
          bottom: 30, // was 100
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data["username"], style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
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
