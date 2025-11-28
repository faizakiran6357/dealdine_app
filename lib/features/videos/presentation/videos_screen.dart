
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class VideosScreen extends StatefulWidget {
//   const VideosScreen({super.key});

//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }

// class _VideosScreenState extends State<VideosScreen> with SingleTickerProviderStateMixin {
//   final PageController _pageController = PageController();

//   final List<Map<String, dynamic>> videos = [
//     {
//       "url": "https://www.pexels.com/download/video/4058071/",
//       "username": "@foodlover",
//       "caption": "Spicy Masala Noodles🔥",
//       "tags": "#food #noodles #recipe",
//       "likes": 4567,
//       "comments": 139,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3298011/",
//       "username": "@chef_Ali",
//       "caption": "Sushi Plater Recipe 🍱",
//       "tags": "#healthy #foodlover #sea food",
//       "likes": 4251,
//       "comments": 230,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/2961911/",
//       "username": "@foodexplorer",
//       "caption": "Crispy Chicken Tikka Kabab🔥",
//       "tags": "#food #chicken #recipe",
//       "likes": 2112,
//       "comments": 143,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/854082/",
//       "username": "@chef_danish",
//       "caption": "Fruit Salad Recipe 🥭🍉",
//       "tags": "#healthy #foodlover",
//       "likes": 5321,
//       "comments": 211,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3196344/",
//       "username": "@streetfoodlover",
//       "caption": "Best Pizza in Town 🍕🔥",
//       "tags": "#pizza #streetfood",
//       "likes": 7891,
//       "comments": 398,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/7141501/",
//       "username": "@chef_faiza",
//       "caption": "Choclate Pan Cakes 🥮🍫",
//       "tags": "#healthy #foodlover",
//       "likes": 5325,
//       "comments": 322,
//       "profile": "assets/profile.png",
//     },
//   ];

//   // Controllers per video
//   late List<VideoPlayerController?> videoControllers;
//   late List<ChewieController?> chewieControllers;

//   // Likes and user liked
//   late List<int> likes;
//   late List<bool> isLiked;

//   // Rotation controller for disc
//   late AnimationController _rotationController;

//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();

//     videoControllers = List.generate(videos.length, (index) => null);
//     chewieControllers = List.generate(videos.length, (index) => null);

//     likes = videos.map((v) => v['likes'] as int).toList();
//     isLiked = List.generate(videos.length, (index) => false);

//     _rotationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     );

//     initializeVideo(0); // Initialize first video
//   }

//   Future<void> initializeVideo(int index) async {
//     if (videoControllers[index] != null) return;

//     final controller = VideoPlayerController.network(videos[index]["url"]);
//     await controller.initialize();

//     final chewie = ChewieController(
//       videoPlayerController: controller,
//       autoPlay: index == currentIndex,
//       looping: true,
//       showControls: false,
//     );

//     if (!mounted) return;

//     setState(() {
//       videoControllers[index] = controller;
//       chewieControllers[index] = chewie;
//     });

//     if (index == currentIndex) {
//       _rotationController.repeat();
//     }
//   }

//   void disposeVideo(int index) {
//     videoControllers[index]?.dispose();
//     chewieControllers[index]?.dispose();
//     videoControllers[index] = null;
//     chewieControllers[index] = null;
//   }

//   @override
//   void dispose() {
//     for (var i = 0; i < videos.length; i++) {
//       disposeVideo(i);
//     }
//     _rotationController.dispose();
//     super.dispose();
//   }

//   void onPageChanged(int index) async {
//     setState(() {
//       currentIndex = index;
//     });

//     await initializeVideo(index);
//     if (index + 1 < videos.length) initializeVideo(index + 1);
//     if (index - 1 >= 0) initializeVideo(index - 1);

//     for (var i = 0; i < videos.length; i++) {
//       if ((i - index).abs() > 1) {
//         disposeVideo(i);
//       }
//     }

//     chewieControllers[index]?.play();
//     _rotationController.repeat();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         itemCount: videos.length,
//         onPageChanged: onPageChanged,
//         itemBuilder: (context, index) {
//           return buildVideoPage(index);
//         },
//       ),
//     );
//   }

//   Widget buildVideoPage(int index) {
//     final data = videos[index];

//     return Stack(
//       children: [
//         // Video player
//         Positioned.fill(
//           child: chewieControllers[index] != null
//               ? Chewie(controller: chewieControllers[index]!)
//               : const Center(child: CircularProgressIndicator()),
//         ),

//         // Top icons
//         Positioned(top: 40, left: 20, child: Image.asset('assets/dine.png', height: 36)),
//         Positioned(top: 40, right: 20, child: Image.asset('assets/notification.png', height: 32)),

//         // Right side buttons (moved closer to bottom)
//         Positioned(
//           right: 15,
//           bottom: 30, // was 120
//           child: Column(
//             children: [
//               CircleAvatar(radius: 25, backgroundImage: AssetImage(data["profile"])),
//               const SizedBox(height: 20),
//               Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (!isLiked[index]) {
//                           likes[index] += 1;
//                           isLiked[index] = true;
//                         } else {
//                           likes[index] -= 1;
//                           isLiked[index] = false;
//                         }
//                       });
//                     },
//                     child: Icon(
//                       Icons.favorite,
//                       color: isLiked[index] ? Colors.red : Colors.white,
//                       size: 32,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text("${likes[index]}", style: const TextStyle(color: Colors.white, fontSize: 11)),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Column(
//                 children: [
//                   const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 32),
//                   const SizedBox(height: 5),
//                   Text("${data['comments']}", style: const TextStyle(color: Colors.white, fontSize: 11)),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Column(
//                 children: const [
//                   Icon(Icons.share, color: Colors.white, size: 32),
//                   SizedBox(height: 5),
//                   Text("Share", style: TextStyle(color: Colors.white, fontSize: 11)),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Rotating disc
//               Column(
//                 children: [
//                   RotationTransition(
//                     turns: _rotationController,
//                     child: Image.asset(
//                       'assets/Disc.png',
//                       height: 36,
//                       width: 36,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),

//         // Bottom left text (moved closer to bottom)
//         Positioned(
//           left: 20,
//           bottom: 30, // was 100
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(data["username"], style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
//               const SizedBox(height: 5),
//               Text(data["tags"], style: const TextStyle(color: Colors.white, fontSize: 14)),
//               const SizedBox(height: 5),
//               Text(data["caption"], style: const TextStyle(color: Colors.white, fontSize: 14)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideosScreen extends StatefulWidget {
//   const VideosScreen({super.key});

//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }

// class _VideosScreenState extends State<VideosScreen> with SingleTickerProviderStateMixin {
//   final PageController _pageController = PageController();

//   final List<Map<String, dynamic>> videos = [
//     {
//       "url": "https://www.pexels.com/download/video/4058071/",
//       "username": "@foodlover",
//       "caption": "Spicy Masala Noodles🔥",
//       "tags": "#food #noodles #recipe",
//       "likes": 4567,
//       "comments": 139,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3298011/",
//       "username": "@chef_Ali",
//       "caption": "Sushi Plater Recipe 🍱",
//       "tags": "#healthy #foodlover #sea food",
//       "likes": 4251,
//       "comments": 230,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/2961911/",
//       "username": "@foodexplorer",
//       "caption": "Crispy Chicken Tikka Kabab🔥",
//       "tags": "#food #chicken #recipe",
//       "likes": 2112,
//       "comments": 143,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/854082/",
//       "username": "@chef_danish",
//       "caption": "Fruit Salad Recipe 🥭🍉",
//       "tags": "#healthy #foodlover",
//       "likes": 5321,
//       "comments": 211,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3196344/",
//       "username": "@streetfoodlover",
//       "caption": "Best Pizza in Town 🍕🔥",
//       "tags": "#pizza #streetfood",
//       "likes": 7891,
//       "comments": 398,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/7141501/",
//       "username": "@chef_faiza",
//       "caption": "Choclate Pan Cakes 🥮🍫",
//       "tags": "#healthy #foodlover",
//       "likes": 5325,
//       "comments": 322,
//       "profile": "assets/profile.png",
//     },
//   ];

//   VideoPlayerController? _controller;
//   int currentIndex = 0;

//   late AnimationController _rotationController;
//   late List<int> likes;
//   late List<bool> isLiked;

//   @override
//   void initState() {
//     super.initState();

//     likes = videos.map((v) => v['likes'] as int).toList();
//     isLiked = List.generate(videos.length, (index) => false);

//     _rotationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     );

//     _initializeVideo(0);
//   }

//   Future<void> _initializeVideo(int index) async {
//     // Dispose previous controller
//     if (_controller != null) {
//       await _controller!.pause();
//       await _controller!.dispose();
//     }

//     _controller = VideoPlayerController.network(videos[index]["url"])
//       ..initialize().then((_) {
//         if (!mounted) return;
//         setState(() {});
//         _controller!.play();
//         _controller!.setLooping(true);
//         _rotationController.repeat();
//       });
//   }

//   void _onPageChanged(int index) {
//     currentIndex = index;
//     _initializeVideo(index);
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     _rotationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = videos[currentIndex];

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         itemCount: videos.length,
//         onPageChanged: _onPageChanged,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               if (_controller!.value.isPlaying) {
//                 _controller!.pause();
//                 _rotationController.stop();
//               } else {
//                 _controller!.play();
//                 _rotationController.repeat();
//               }
//               setState(() {});
//             },
//             child: Stack(
//               children: [
//                 // Video
//                 Positioned.fill(
//                   child: _controller != null && _controller!.value.isInitialized
//                       ? FittedBox(
//                           fit: BoxFit.cover,
//                           child: SizedBox(
//                             width: _controller!.value.size.width,
//                             height: _controller!.value.size.height,
//                             child: VideoPlayer(_controller!),
//                           ),
//                         )
//                       : const Center(child: CircularProgressIndicator()),
//                 ),

//                 // Top icons
//                 Positioned(top: 40, left: 20, child: Image.asset('assets/dine.png', height: 36)),
//                 Positioned(top: 40, right: 20, child: Image.asset('assets/notification.png', height: 32)),

//                 // Right side buttons
//                 Positioned(
//                   right: 15,
//                   bottom: 30,
//                   child: Column(
//                     children: [
//                       CircleAvatar(radius: 25, backgroundImage: AssetImage(data["profile"])),
//                       const SizedBox(height: 20),
//                       Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 if (!isLiked[index]) {
//                                   likes[index] += 1;
//                                   isLiked[index] = true;
//                                 } else {
//                                   likes[index] -= 1;
//                                   isLiked[index] = false;
//                                 }
//                               });
//                             },
//                             child: Icon(Icons.favorite,
//                                 color: isLiked[index] ? Colors.red : Colors.white, size: 32),
//                           ),
//                           const SizedBox(height: 5),
//                           Text("${likes[index]}",
//                               style: const TextStyle(color: Colors.white, fontSize: 11)),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Column(
//                         children: [
//                           const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 32),
//                           const SizedBox(height: 5),
//                           Text("${data['comments']}",
//                               style: const TextStyle(color: Colors.white, fontSize: 11)),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Column(
//                         children: const [
//                           Icon(Icons.share, color: Colors.white, size: 32),
//                           SizedBox(height: 5),
//                           Text("Share", style: TextStyle(color: Colors.white, fontSize: 11)),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       // Rotating disc
//                       RotationTransition(
//                         turns: _rotationController,
//                         child: Image.asset('assets/Disc.png', height: 36, width: 36),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Bottom left text
//                 Positioned(
//                   left: 20,
//                   bottom: 30,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(data["username"],
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 5),
//                       Text(data["tags"], style: const TextStyle(color: Colors.white, fontSize: 14)),
//                       const SizedBox(height: 5),
//                       Text(data["caption"], style: const TextStyle(color: Colors.white, fontSize: 14)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideosScreen extends StatefulWidget {
//   const VideosScreen({super.key});

//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }

// class _VideosScreenState extends State<VideosScreen> with SingleTickerProviderStateMixin {
//   final PageController _pageController = PageController();

//   final List<Map<String, dynamic>> videos = [
//     {
//       "url": "https://www.pexels.com/download/video/4058071/",
//       "username": "@foodlover",
//       "caption": "Spicy Masala Noodles🔥",
//       "tags": "#food #noodles #recipe",
//       "likes": 4567,
//       "comments": 139,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3298011/",
//       "username": "@chef_Ali",
//       "caption": "Sushi Plater Recipe 🍱",
//       "tags": "#healthy #foodlover #sea food",
//       "likes": 4251,
//       "comments": 230,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/2961911/",
//       "username": "@foodexplorer",
//       "caption": "Crispy Chicken Tikka Kabab🔥",
//       "tags": "#food #chicken #recipe",
//       "likes": 2112,
//       "comments": 143,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/854082/",
//       "username": "@chef_danish",
//       "caption": "Fruit Salad Recipe 🥭🍉",
//       "tags": "#healthy #foodlover",
//       "likes": 5321,
//       "comments": 211,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3196344/",
//       "username": "@streetfoodlover",
//       "caption": "Best Pizza in Town 🍕🔥",
//       "tags": "#pizza #streetfood",
//       "likes": 7891,
//       "comments": 398,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/7141501/",
//       "username": "@chef_faiza",
//       "caption": "Choclate Pan Cakes 🥮🍫",
//       "tags": "#healthy #foodlover",
//       "likes": 5325,
//       "comments": 322,
//       "profile": "assets/profile.png",
//     },
//   ];

//   VideoPlayerController? _controller;
//   int currentIndex = 0;

//   late AnimationController _rotationController;
//   late List<int> likes;
//   late List<bool> isLiked;

//   @override
//   void initState() {
//     super.initState();

//     likes = videos.map((v) => v['likes'] as int).toList();
//     isLiked = List.generate(videos.length, (index) => false);

//     _rotationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     );

//     _initializeVideo(0);
//   }

//   Future<void> _initializeVideo(int index) async {
//     // Dispose previous controller
//     if (_controller != null) {
//       await _controller!.pause();
//       await _controller!.dispose();
//     }

//     _controller = VideoPlayerController.network(videos[index]["url"])
//       ..initialize().then((_) {
//         if (!mounted) return;
//         setState(() {});
//         _controller!.play();
//         _controller!.setLooping(true);
//         _rotationController.repeat();
//       });
//   }

//   void _onPageChanged(int index) {
//     currentIndex = index;
//     _initializeVideo(index);
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     _rotationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = videos[currentIndex];

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         itemCount: videos.length,
//         onPageChanged: _onPageChanged,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               if (_controller!.value.isPlaying) {
//                 _controller!.pause();
//                 _rotationController.stop();
//               } else {
//                 _controller!.play();
//                 _rotationController.repeat();
//               }
//               setState(() {});
//             },
//             child: Stack(
//               children: [
//                 // Video
//                 Positioned.fill(
//                   child: _controller != null && _controller!.value.isInitialized
//                       ? FittedBox(
//                           fit: BoxFit.cover,
//                           child: SizedBox(
//                             width: _controller!.value.size.width,
//                             height: _controller!.value.size.height,
//                             child: VideoPlayer(_controller!),
//                           ),
//                         )
//                       : const Center(child: CircularProgressIndicator()),
//                 ),

//                 // Top icons
//                 Positioned(top: 40, left: 20, child: Image.asset('assets/dine.png', height: 36)),
//                 Positioned(top: 40, right: 20, child: Image.asset('assets/notification.png', height: 32)),

//                 // Right side buttons
//                 Positioned(
//                   right: 15,
//                   bottom: 30,
//                   child: Column(
//                     children: [
//                       CircleAvatar(radius: 25, backgroundImage: AssetImage(data["profile"])),
//                       const SizedBox(height: 20),
//                       Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 if (!isLiked[index]) {
//                                   likes[index] += 1;
//                                   isLiked[index] = true;
//                                 } else {
//                                   likes[index] -= 1;
//                                   isLiked[index] = false;
//                                 }
//                               });
//                             },
//                             child: Icon(Icons.favorite,
//                                 color: isLiked[index] ? Colors.red : Colors.white, size: 32),
//                           ),
//                           const SizedBox(height: 5),
//                           Text("${likes[index]}",
//                               style: const TextStyle(color: Colors.white, fontSize: 11)),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Column(
//                         children: [
//                           const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 32),
//                           const SizedBox(height: 5),
//                           Text("${data['comments']}",
//                               style: const TextStyle(color: Colors.white, fontSize: 11)),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Column(
//                         children: const [
//                           Icon(Icons.share, color: Colors.white, size: 32),
//                           SizedBox(height: 5),
//                           Text("Share", style: TextStyle(color: Colors.white, fontSize: 11)),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       // Rotating disc
//                       RotationTransition(
//                         turns: _rotationController,
//                         child: Image.asset('assets/Disc.png', height: 36, width: 36),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Bottom left text
//                 Positioned(
//                   left: 20,
//                   bottom: 30,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(data["username"],
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 5),
//                       Text(data["tags"], style: const TextStyle(color: Colors.white, fontSize: 14)),
//                       const SizedBox(height: 5),
//                       Text(data["caption"], style: const TextStyle(color: Colors.white, fontSize: 14)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_awesome_reels/flutter_awesome_reels.dart';

// class VideosScreen extends StatefulWidget {
//   const VideosScreen({super.key});

//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }

// class _VideosScreenState extends State<VideosScreen> {
//   final List<Map<String, dynamic>> videos = [
//     {
//       "url": "https://www.pexels.com/download/video/4058071/",
//       "username": "@foodlover",
//       "caption": "Spicy Masala Noodles🔥",
//       "tags": "#food #noodles #recipe",
//       "likes": 4567,
//       "comments": 139,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3298011/",
//       "username": "@chef_Ali",
//       "caption": "Sushi Plater Recipe 🍱",
//       "tags": "#healthy #foodlover #sea food",
//       "likes": 4251,
//       "comments": 230,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/2961911/",
//       "username": "@foodexplorer",
//       "caption": "Crispy Chicken Tikka Kabab🔥",
//       "tags": "#food #chicken #recipe",
//       "likes": 2112,
//       "comments": 143,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/854082/",
//       "username": "@chef_danish",
//       "caption": "Fruit Salad Recipe 🥭🍉",
//       "tags": "#healthy #foodlover",
//       "likes": 5321,
//       "comments": 211,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3196344/",
//       "username": "@streetfoodlover",
//       "caption": "Best Pizza in Town 🍕🔥",
//       "tags": "#pizza #streetfood",
//       "likes": 7891,
//       "comments": 398,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/7141501/",
//       "username": "@chef_faiza",
//       "caption": "Choclate Pan Cakes 🥮🍫",
//       "tags": "#healthy #foodlover",
//       "likes": 5325,
//       "comments": 322,
//       "profile": "assets/profile.png",
//     },
//     // ... other items ...
//   ];

//   late final List<ReelModel> _reels;

//   @override
//   void initState() {
//     super.initState();
//     _reels = videos.asMap().entries.map((entry) {
//       final i = entry.key;
//       final v = entry.value;
//       return ReelModel(
//         id: 'reel_$i',
//         videoSource: VideoSource(
//           url: v['url'] as String,
//           format: VideoFormat.mp4,
//         ),
//         user: ReelUser(
//           id: 'user_$i',
//           username: v['username'] as String,
//           // displayName optional
//         ),
//         caption: v['caption'] as String?,
//         // You can store likes/comments metadata separately if needed
//       );
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: AwesomeReels(
//         reels: _reels,
//         config: const ReelConfig(
//           // optional configuration like caching, preload etc.
//         ),
//         overlayBuilder: (context, reel, controller) {
//           // get index from reel.id = 'reel_i'
//           final idx = int.tryParse(reel.id.replaceFirst('reel_', '')) ?? 0;
//           final meta = videos[idx];

//           return Stack(
//             children: [
//               // top icons
//               Positioned(top: 40, left: 20,
//                 child: Image.asset('assets/dine.png', height: 36),
//               ),
//               Positioned(top: 40, right: 20,
//                 child: Image.asset('assets/notification.png', height: 32),
//               ),

//               // right side buttons
//               Positioned(
//                 right: 15,
//                 bottom: 30,
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 25,
//                       backgroundImage: AssetImage(meta['profile']),
//                     ),
//                     const SizedBox(height: 20),
//                     Column(
//                       children: [
//                         const Icon(Icons.favorite, color: Colors.white, size: 32),
//                         const SizedBox(height: 5),
//                         Text('${meta["likes"]}', style: const TextStyle(color: Colors.white, fontSize: 11)),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Column(
//                       children: [
//                         const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 32),
//                         const SizedBox(height: 5),
//                         Text('${meta["comments"]}', style: const TextStyle(color: Colors.white, fontSize: 11)),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     const Icon(Icons.share, color: Colors.white, size: 32),
//                   ],
//                 ),
//               ),

//               // bottom left text
//               Positioned(
//                 left: 20,
//                 bottom: 30,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(meta["username"],
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                       )),
//                     const SizedBox(height: 5),
//                     Text(meta["tags"], style: const TextStyle(color: Colors.white, fontSize: 14)),
//                     const SizedBox(height: 5),
//                     Text(meta["caption"], style: const TextStyle(color: Colors.white, fontSize: 14)),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//  import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:preload_page_view/preload_page_view.dart';

// class VideosScreen extends StatefulWidget {
//   const VideosScreen({super.key});

//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }

// class _VideosScreenState extends State<VideosScreen>
//     with SingleTickerProviderStateMixin {
//   final PreloadPageController _pageController = PreloadPageController();

//   final List<Map<String, dynamic>> videos = [
//     {
//       "id": "1",
//       "url": "https://www.pexels.com/download/video/4058071/",
//       "username": "@foodlover",
//       "caption": "Spicy Masala Noodles🔥",
//       "tags": "#food #noodles #recipe",
//       "likes": 4567,
//       "comments": 139,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "id": "2",
//       "url": "https://www.pexels.com/download/video/3298011/",
//       "username": "@chef_Ali",
//       "caption": "Sushi Plater Recipe 🍱",
//       "tags": "#healthy #foodlover #sea food",
//       "likes": 4251,
//       "comments": 230,
//       "profile": "assets/profile.png",
//     },
//     {
//       "id": "3",
//       "url": "https://www.pexels.com/download/video/2961911/",
//       "username": "@foodexplorer",
//       "caption": "Crispy Chicken Tikka Kabab🔥",
//       "tags": "#food #chicken #recipe",
//       "likes": 2112,
//       "comments": 143,
//       "profile": "assets/profile2.png",
//     },
//   ];

//   late List<VideoPlayerController?> videoControllers;
//   late List<ChewieController?> chewieControllers;

//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();

//     videoControllers = List.generate(videos.length, (_) => null);
//     chewieControllers = List.generate(videos.length, (_) => null);

//     _initVideo(0);
//     _initVideo(1); // preload next
//   }

//   Future<void> _initVideo(int index) async {
//     if (index < 0 || index >= videos.length) return;
//     if (videoControllers[index] != null) return;

//     final vc = VideoPlayerController.network(videos[index]["url"]);
//     await vc.initialize();
//     vc.setLooping(true);

//     final cc = ChewieController(
//       videoPlayerController: vc,
//       showControls: false,
//       autoPlay: index == currentIndex,
//       looping: true,
//     );

//     if (!mounted) return;

//     setState(() {
//       videoControllers[index] = vc;
//       chewieControllers[index] = cc;
//     });
//   }

//   void _disposeVideo(int index) {
//     if (index < 0 || index >= videos.length) return;

//     videoControllers[index]?.dispose();
//     chewieControllers[index]?.dispose();
//     videoControllers[index] = null;
//     chewieControllers[index] = null;
//   }

//   @override
//   void dispose() {
//     for (var i = 0; i < videos.length; i++) {
//       _disposeVideo(i);
//     }
//     super.dispose();
//   }

//   Future<void> _onPageChanged(int index) async {
//     setState(() => currentIndex = index);

//     /// Pause all
//     for (var c in videoControllers) {
//       if (c != null) c.pause();
//     }

//     /// Initialize nearby videos
//     _initVideo(index);
//     _initVideo(index + 1);
//     _initVideo(index - 1);

//     /// Dispose far-away videos
//     for (int i = 0; i < videos.length; i++) {
//       if ((i - index).abs() > 1) _disposeVideo(i);
//     }

//     /// Play current video
//     final vc = videoControllers[index];
//     if (vc != null && vc.value.isInitialized) vc.play();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: PreloadPageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         preloadPagesCount: 1,
//         itemCount: videos.length,
//         onPageChanged: _onPageChanged,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               final vc = videoControllers[index];
//               if (vc != null) {
//                 vc.value.isPlaying ? vc.pause() : vc.play();
//               }
//             },
//             child: Stack(
//               children: [
//                 Positioned.fill(
//                   child: chewieControllers[index] != null
//                       ? Chewie(controller: chewieControllers[index]!)
//                       : const Center(child: CircularProgressIndicator()),
//                 ),

//                 /// Right side – likes/comments
//                 Positioned(
//                   right: 15,
//                   bottom: 30,
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundImage:
//                             AssetImage(videos[index]["profile"]),
//                       ),
//                       const SizedBox(height: 20),
//                       const Icon(Icons.favorite_outline,
//                           color: Colors.white, size: 32),
//                       const SizedBox(height: 20),
//                       const Icon(Icons.comment, color: Colors.white, size: 32),
//                     ],
//                   ),
//                 ),

//                 /// Bottom text
//                 Positioned(
//                   left: 15,
//                   bottom: 30,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(videos[index]["username"],
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 16)),
//                       Text(videos[index]["caption"],
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 14)),
//                       Text(videos[index]["tags"],
//                           style: const TextStyle(
//                               color: Colors.white70, fontSize: 13)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:preload_page_view/preload_page_view.dart';

// class VideosScreen extends StatefulWidget {
//   const VideosScreen({super.key});

//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }

// class _VideosScreenState extends State<VideosScreen>
//     with SingleTickerProviderStateMixin, WidgetsBindingObserver {
//   final PreloadPageController _pageController = PreloadPageController();

//   final List<Map<String, dynamic>> videos = [
//     {
//       "url": "https://www.pexels.com/download/video/4058071/",
//       "username": "@foodlover",
//       "caption": "Spicy Masala Noodles🔥",
//       "tags": "#food #noodles #recipe",
//       "likes": 4567,
//       "comments": 139,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3298011/",
//       "username": "@chef_Ali",
//       "caption": "Sushi Plater Recipe 🍱",
//       "tags": "#healthy #foodlover #sea food",
//       "likes": 4251,
//       "comments": 230,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/2961911/",
//       "username": "@foodexplorer",
//       "caption": "Crispy Chicken Tikka Kabab🔥",
//       "tags": "#food #chicken #recipe",
//       "likes": 2112,
//       "comments": 143,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/854082/",
//       "username": "@chef_danish",
//       "caption": "Fruit Salad Recipe 🥭🍉",
//       "tags": "#healthy #foodlover",
//       "likes": 5321,
//       "comments": 211,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3196344/",
//       "username": "@streetfoodlover",
//       "caption": "Best Pizza in Town 🍕🔥",
//       "tags": "#pizza #streetfood",
//       "likes": 7891,
//       "comments": 398,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/7141501/",
//       "username": "@chef_faiza",
//       "caption": "Choclate Pan Cakes 🥮🍫",
//       "tags": "#healthy #foodlover",
//       "likes": 5325,
//       "comments": 322,
//       "profile": "assets/profile.png",
//     },
//   ];

//   late List<VideoPlayerController?> videoControllers;
//   late List<VoidCallback?> _listeners;
//   late List<int> likes;
//   late List<bool> isLiked;

//   int currentIndex = 0;
//   late AnimationController _rotationController;
//   bool _appActive = true;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);

//     videoControllers = List.generate(videos.length, (_) => null);
//     _listeners = List.generate(videos.length, (_) => null);
//     likes = videos.map((v) => v['likes'] as int).toList();
//     isLiked = List.generate(videos.length, (_) => false);

//     _rotationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 5));

//     // Initialize all controllers up-front (small list → instant playback)
//     _initializeAllControllers();
//   }

//   Future<void> _initializeAllControllers() async {
//     for (int i = 0; i < videos.length; i++) {
//       _createController(i);
//     }
//     // Ensure first is playing when ready
//     // small delay to let initial controllers settle
//     Future.delayed(const Duration(milliseconds: 200), () {
//       _playAtIndex(currentIndex);
//     });
//   }

//   Future<void> _createController(int index) async {
//     if (index < 0 || index >= videos.length) return;
//     if (videoControllers[index] != null) return;

//     try {
//       final controller = VideoPlayerController.network(videos[index]['url']);
//       await controller.initialize();
//       controller.setLooping(true);

//       // listener to update UI when playback state changes
//       VoidCallback listener = () {
//         // Only trigger UI update for the current item (minimize rebuilds)
//         if (mounted && (index == currentIndex)) {
//           setState(() {});
//           // rotate disc when current is playing
//           if (controller.value.isPlaying) {
//             if (!_rotationController.isAnimating) _rotationController.repeat();
//           } else {
//             if (_rotationController.isAnimating) _rotationController.stop();
//           }
//         }
//       };

//       controller.addListener(listener);

//       videoControllers[index] = controller;
//       _listeners[index] = () {
//         try {
//           controller.removeListener(listener);
//         } catch (_) {}
//       };

//       // Do not auto-play all; we will control playback when page changes.
//       setState(() {}); // show thumbnail -> but controller ready
//     } catch (e) {
//       // Initialization error (network/format) — keep it null, show loader later
//       debugPrint('Video init error at $index: $e');
//     }
//   }

//   Future<void> _playAtIndex(int index) async {
//     if (index < 0 || index >= videos.length) return;

//     // Pause all others
//     for (int i = 0; i < videoControllers.length; i++) {
//       final c = videoControllers[i];
//       if (c != null && i != index) {
//         try {
//           if (c.value.isPlaying) await c.pause();
//         } catch (_) {}
//       }
//     }

//     final vc = videoControllers[index];
//     if (vc != null && vc.value.isInitialized) {
//       try {
//         await vc.play();
//         _rotationController.repeat();
//       } catch (e) {
//         debugPrint('Play error at $index: $e');
//       }
//     }
//   }

//   Future<void> _pauseAll() async {
//     for (var c in videoControllers) {
//       if (c != null && c.value.isInitialized && c.value.isPlaying) {
//         try {
//           await c.pause();
//         } catch (_) {}
//       }
//     }
//     if (_rotationController.isAnimating) _rotationController.stop();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);

//     for (int i = 0; i < videoControllers.length; i++) {
//       try {
//         _listeners[i]?.call();
//       } catch (_) {}
//       videoControllers[i]?.dispose();
//       videoControllers[i] = null;
//     }
//     _rotationController.dispose();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final wasActive = _appActive;
//     _appActive = state == AppLifecycleState.resumed;

//     if (!_appActive && wasActive) {
//       // app going background -> pause everything
//       _pauseAll();
//     } else if (_appActive && !wasActive) {
//       // app resumed -> try to play current
//       _playAtIndex(currentIndex);
//     }
//     super.didChangeAppLifecycleState(state);
//   }

//   Future<void> _onPageChanged(int idx) async {
//     currentIndex = idx;
//     setState(() {});
//     // Play the current, pause others. Do NOT dispose controllers here.
//     await _playAtIndex(idx);

//     // Ensure neighbors are initialized (they should be from startup)
//     _createController(idx + 1);
//     _createController(idx - 1);
//   }

//   Widget _buildVideoPlayer(int index) {
//     final controller = videoControllers[index];
//     if (controller == null) {
//       // still initializing or failed
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (!controller.value.isInitialized) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     // Fill screen with video preserving aspect
//     return FittedBox(
//       fit: BoxFit.cover,
//       alignment: Alignment.center,
//       child: SizedBox(
//         width: controller.value.size.width,
//         height: controller.value.size.height,
//         child: VideoPlayer(controller),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: PreloadPageView.builder(
//         controller: _pageController,
//         preloadPagesCount: 1,
//         scrollDirection: Axis.vertical,
//         itemCount: videos.length,
//         onPageChanged: _onPageChanged,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               final vc = videoControllers[index];
//               if (vc != null && vc.value.isInitialized) {
//                 setState(() {
//                   if (vc.value.isPlaying) {
//                     vc.pause();
//                     _rotationController.stop();
//                   } else {
//                     // play this and pause others
//                     _playAtIndex(index);
//                   }
//                 });
//               }
//             },
//             child: Stack(
//               children: [
//                 // Video area
//                 Positioned.fill(child: _buildVideoPlayer(index)),

//                 // Top icons
//                 Positioned(
//                   top: 40,
//                   left: 20,
//                   child: Image.asset('assets/dine.png', height: 36),
//                 ),
//                 Positioned(
//                   top: 40,
//                   right: 20,
//                   child: Image.asset('assets/notification.png', height: 32),
//                 ),

//                 // Right side buttons
//                 Positioned(
//                   right: 15,
//                   bottom: 30,
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundImage: AssetImage(videos[index]['profile']),
//                       ),
//                       const SizedBox(height: 20),

//                       // Like button + count
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             if (!isLiked[index]) {
//                               likes[index] += 1;
//                               isLiked[index] = true;
//                             } else {
//                               likes[index] -= 1;
//                               isLiked[index] = false;
//                             }
//                           });
//                         },
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.favorite,
//                               color: isLiked[index] ? Colors.red : Colors.white,
//                               size: 32,
//                             ),
//                             const SizedBox(height: 5),
//                             Text("${likes[index]}",
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 11)),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(height: 20),

//                       // Comments
//                       Column(
//                         children: [
//                           const Icon(Icons.chat_bubble_outline,
//                               color: Colors.white, size: 32),
//                           const SizedBox(height: 5),
//                           Text("${videos[index]['comments']}",
//                               style: const TextStyle(
//                                   color: Colors.white, fontSize: 11)),
//                         ],
//                       ),

//                       const SizedBox(height: 20),

//                       // Share
//                       Column(
//                         children: const [
//                           Icon(Icons.share, color: Colors.white, size: 32),
//                           SizedBox(height: 5),
//                           Text("Share",
//                               style: TextStyle(color: Colors.white, fontSize: 11)),
//                         ],
//                       ),

//                       const SizedBox(height: 20),

//                       // Rotating Disc
//                       RotationTransition(
//                         turns: _rotationController,
//                         child: Image.asset('assets/Disc.png', height: 36, width: 36),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Bottom left text
//                 Positioned(
//                   left: 20,
//                   bottom: 30,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(videos[index]['username'],
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 5),
//                       Text(videos[index]['tags'],
//                           style: const TextStyle(color: Colors.white, fontSize: 14)),
//                       const SizedBox(height: 5),
//                       Text(videos[index]['caption'],
//                           style: const TextStyle(color: Colors.white, fontSize: 14)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:preload_page_view/preload_page_view.dart';

// class VideosScreen extends StatefulWidget {
//   const VideosScreen({super.key});

//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }

// class _VideosScreenState extends State<VideosScreen>
//     with SingleTickerProviderStateMixin, WidgetsBindingObserver {
//   final PreloadPageController _pageController = PreloadPageController();

//   final List<Map<String, dynamic>> videos = [
//     {
//       "url": "https://www.pexels.com/download/video/4058071/",
//       "username": "@foodlover",
//       "caption": "Spicy Masala Noodles🔥",
//       "tags": "#food #noodles #recipe",
//       "likes": 4567,
//       "comments": 139,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3298011/",
//       "username": "@chef_Ali",
//       "caption": "Sushi Plater Recipe 🍱",
//       "tags": "#healthy #foodlover #sea food",
//       "likes": 4251,
//       "comments": 230,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/2961911/",
//       "username": "@foodexplorer",
//       "caption": "Crispy Chicken Tikka Kabab🔥",
//       "tags": "#food #chicken #recipe",
//       "likes": 2112,
//       "comments": 143,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/854082/",
//       "username": "@chef_danish",
//       "caption": "Fruit Salad Recipe 🥭🍉",
//       "tags": "#healthy #foodlover",
//       "likes": 5321,
//       "comments": 211,
//       "profile": "assets/profile.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/3196344/",
//       "username": "@streetfoodlover",
//       "caption": "Best Pizza in Town 🍕🔥",
//       "tags": "#pizza #streetfood",
//       "likes": 7891,
//       "comments": 398,
//       "profile": "assets/profile2.png",
//     },
//     {
//       "url": "https://www.pexels.com/download/video/7141501/",
//       "username": "@chef_faiza",
//       "caption": "Choclate Pan Cakes 🥮🍫",
//       "tags": "#healthy #foodlover",
//       "likes": 5325,
//       "comments": 322,
//       "profile": "assets/profile.png",
//     },
//   ];

//   late List<VideoPlayerController?> videoControllers;
//   late List<VoidCallback?> _listeners;
//   late List<int> likes;
//   late List<bool> isLiked;

//   int currentIndex = 0;
//   late AnimationController _rotationController;
//   bool _appActive = true;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);

//     videoControllers = List.generate(videos.length, (_) => null);
//     _listeners = List.generate(videos.length, (_) => null);
//     likes = videos.map((v) => v['likes'] as int).toList();
//     isLiked = List.generate(videos.length, (_) => false);

//     _rotationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 5));

//     _initializeAllControllers();
//   }

//   // ✅ FIXED FUNCTION (1st VIDEO NOW PLAYS INSTANTLY)
//   Future<void> _initializeAllControllers() async {
//     for (int i = 0; i < videos.length; i++) {
//       await _createController(i);
//     }

//     // As soon as first is initialized → play immediately
//     if (videoControllers[0] != null &&
//         videoControllers[0]!.value.isInitialized) {
//       _playAtIndex(0);
//     }
//   }

//   Future<void> _createController(int index) async {
//     if (index < 0 || index >= videos.length) return;
//     if (videoControllers[index] != null) return;

//     try {
//       final controller = VideoPlayerController.network(videos[index]['url']);
//       await controller.initialize();
//       controller.setLooping(true);

//       VoidCallback listener = () {
//         if (mounted && index == currentIndex) {
//           setState(() {});
//           if (controller.value.isPlaying) {
//             if (!_rotationController.isAnimating) _rotationController.repeat();
//           } else {
//             if (_rotationController.isAnimating) _rotationController.stop();
//           }
//         }
//       };

//       controller.addListener(listener);

//       videoControllers[index] = controller;
//       _listeners[index] = () {
//         try {
//           controller.removeListener(listener);
//         } catch (_) {}
//       };

//       setState(() {});
//     } catch (e) {
//       debugPrint('Video init error at $index: $e');
//     }
//   }

//   Future<void> _playAtIndex(int index) async {
//     if (index < 0 || index >= videos.length) return;

//     for (int i = 0; i < videoControllers.length; i++) {
//       final c = videoControllers[i];
//       if (c != null && i != index && c.value.isPlaying) {
//         await c.pause();
//       }
//     }

//     final vc = videoControllers[index];
//     if (vc != null && vc.value.isInitialized) {
//       await vc.play();
//       _rotationController.repeat();
//     }
//   }

//   Future<void> _pauseAll() async {
//     for (var c in videoControllers) {
//       if (c != null && c.value.isPlaying) {
//         await c.pause();
//       }
//     }
//     _rotationController.stop();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);

//     for (int i = 0; i < videoControllers.length; i++) {
//       _listeners[i]?.call();
//       videoControllers[i]?.dispose();
//     }

//     _rotationController.dispose();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final wasActive = _appActive;
//     _appActive = state == AppLifecycleState.resumed;

//     if (!_appActive && wasActive) {
//       _pauseAll();
//     } else if (_appActive && !wasActive) {
//       _playAtIndex(currentIndex);
//     }
//     super.didChangeAppLifecycleState(state);
//   }

//   Future<void> _onPageChanged(int idx) async {
//     currentIndex = idx;
//     setState(() {});
//     await _playAtIndex(idx);

//     _createController(idx + 1);
//     _createController(idx - 1);
//   }

//   Widget _buildVideoPlayer(int index) {
//     final controller = videoControllers[index];
//     if (controller == null || !controller.value.isInitialized) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return FittedBox(
//       fit: BoxFit.cover,
//       child: SizedBox(
//         width: controller.value.size.width,
//         height: controller.value.size.height,
//         child: VideoPlayer(controller),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: PreloadPageView.builder(
//         controller: _pageController,
//         preloadPagesCount: 1,
//         scrollDirection: Axis.vertical,
//         itemCount: videos.length,
//         onPageChanged: _onPageChanged,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               final vc = videoControllers[index];
//               if (vc != null && vc.value.isInitialized) {
//                 if (vc.value.isPlaying) {
//                   vc.pause();
//                   _rotationController.stop();
//                 } else {
//                   _playAtIndex(index);
//                 }
//               }
//             },
//             child: Stack(
//               children: [
//                 Positioned.fill(child: _buildVideoPlayer(index)),

//                 Positioned(
//                   top: 40,
//                   left: 20,
//                   child: Image.asset('assets/dine.png', height: 36),
//                 ),
//                 Positioned(
//                   top: 40,
//                   right: 20,
//                   child: Image.asset('assets/notification.png', height: 32),
//                 ),

//                 Positioned(
//                   right: 15,
//                   bottom: 30,
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundImage: AssetImage(videos[index]['profile']),
//                       ),
//                       const SizedBox(height: 20),

//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             if (!isLiked[index]) {
//                               likes[index]++;
//                               isLiked[index] = true;
//                             } else {
//                               likes[index]--;
//                               isLiked[index] = false;
//                             }
//                           });
//                         },
//                         child: Column(
//                           children: [
//                             Icon(Icons.favorite,
//                                 color: isLiked[index]
//                                     ? Colors.red
//                                     : Colors.white,
//                                 size: 32),
//                             const SizedBox(height: 5),
//                             Text("${likes[index]}",
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 11)),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(height: 20),

//                       Column(
//                         children: [
//                           const Icon(Icons.chat_bubble_outline,
//                               color: Colors.white, size: 32),
//                           const SizedBox(height: 5),
//                           Text("${videos[index]['comments']}",
//                               style: const TextStyle(
//                                   color: Colors.white, fontSize: 11)),
//                         ],
//                       ),

//                       const SizedBox(height: 20),

//                       Column(
//                         children: const [
//                           Icon(Icons.share, color: Colors.white, size: 32),
//                           SizedBox(height: 5),
//                           Text("Share",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 11)),
//                         ],
//                       ),

//                       const SizedBox(height: 20),

//                       RotationTransition(
//                         turns: _rotationController,
//                         child: Image.asset(
//                           'assets/Disc.png',
//                           height: 36,
//                           width: 36,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 Positioned(
//                   left: 20,
//                   bottom: 30,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(videos[index]['username'],
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 5),
//                       Text(videos[index]['tags'],
//                           style:
//                               const TextStyle(color: Colors.white, fontSize: 14)),
//                       const SizedBox(height: 5),
//                       Text(videos[index]['caption'],
//                           style:
//                               const TextStyle(color: Colors.white, fontSize: 14)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
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
