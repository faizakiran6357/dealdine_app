
// import 'package:dealdine_application/widgets/primary_button.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class OnboardingMain extends StatefulWidget {
//   const OnboardingMain({super.key});

//   @override
//   State<OnboardingMain> createState() => _OnboardingMainState();
// }

// class _OnboardingMainState extends State<OnboardingMain> {
//   final PageController _pageController = PageController();
//   int currentIndex = 0;

//   void goNext(BuildContext context) {
//     if (currentIndex == 3) {
//       context.go('/login');
//     } else {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void onPageChanged(int index) {
//     setState(() => currentIndex = index);
//   }

//   void handleLastSwipe() {
//     if (currentIndex == 3) {
//       Future.delayed(const Duration(milliseconds: 100), () {
//         context.go('/login');
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       body: SafeArea(
//         child: Stack(
//           children: [

//             /// ------------------------
//             /// 🔵 Only PageView moves
//             /// ------------------------
//             NotificationListener<ScrollEndNotification>(
//               onNotification: (n) {
//                 if (currentIndex == 3 && _pageController.page == 3) {
//                   handleLastSwipe();
//                 }
//                 return true;
//               },
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: onPageChanged,
//                 children: [
//                   buildPage(
//                     image: 'assets/onboarding1.png',
//                     title: "All your favorites",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide.png',
//                   ),
//                   buildPage(
//                     image: 'assets/onboarding2.png',
//                     title: "All your favorites",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide1.png',
//                   ),
//                   buildPage(
//                     image: 'assets/onboarding3.png',
//                     title: "Order from chosen chef",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide2.png',
//                   ),
//                   buildPage(
//                     image: 'assets/onboarding4.png',
//                     title: "Free delivery offers",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide3.png',
//                   ),
//                 ],
//               ),
//             ),

//             /// --------------------------------------
//             /// 🟢 Bottom Fixed Button + Skip
//             /// (Does NOT move during swiping)
//             /// --------------------------------------
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 30,
//               child: Column(
//                 children: [

//                   /// 🔥 PRIMARY BUTTON (Next / Get Started)
//                   PrimaryButton(
//                     text: currentIndex == 3 ? "Get Started" : "Next",
//                     radius: 12,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     onTap: () {
//                       if (currentIndex == 3) {
//                         context.go('/login');
//                       } else {
//                         goNext(context);
//                       }
//                     },
//                   ),

//                   const SizedBox(height: 15),

//                   /// Skip only if not last
//                   if (currentIndex != 3)
//                     GestureDetector(
//                       onTap: () => context.go('/login'),
//                       child: const Text(
//                         "Skip",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF646982),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// -----------------------------------------
//   /// PAGE UI (only this part scrolls/swipes)
//   /// -----------------------------------------
//   Widget buildPage({
//     required String image,
//     required String title,
//     required String subtitle,
//     required String indicator,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//       child: Column(
//         children: [
//           const SizedBox(height: 80),

//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               image,
//               width: 240,
//               height: 292,
//               fit: BoxFit.cover,
//             ),
//           ),

//           const SizedBox(height: 34),

//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF32343E),
//             ),
//           ),

//           const SizedBox(height: 14),

//           Text(
//             subtitle,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 15,
//               height: 1.5,
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF646982),
//             ),
//           ),

//           const SizedBox(height: 25),

//           Image.asset(
//             indicator,
//             width: 76,
//             height: 10,
//             fit: BoxFit.contain,
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:dealdine_application/widgets/primary_button.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class OnboardingMain extends StatefulWidget {
//   const OnboardingMain({super.key});

//   @override
//   State<OnboardingMain> createState() => _OnboardingMainState();
// }

// class _OnboardingMainState extends State<OnboardingMain> {
//   final PageController _pageController = PageController();
//   int currentIndex = 0;

//   void goNext(BuildContext context) {
//     if (currentIndex == 3) {
//       context.go('/login');
//     } else {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void onPageChanged(int index) {
//     setState(() => currentIndex = index);
//   }

//   void handleLastSwipe() {
//     if (currentIndex == 3) {
//       Future.delayed(const Duration(milliseconds: 100), () {
//         context.go('/login');
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       body: SafeArea(
//         child: Stack(
//           children: [

//             /// ------------------------
//             /// 🔵 Only PageView moves
//             /// ------------------------
//             NotificationListener<ScrollEndNotification>(
//               onNotification: (n) {
//                 if (currentIndex == 3 && _pageController.page == 3) {
//                   handleLastSwipe();
//                 }
//                 return true;
//               },
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: onPageChanged,
//                 children: [
//                   buildPage(
//                     image: 'assets/onboarding1.png',
//                     title: "All your favorites",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide.png',
//                   ),
//                   buildPage(
//                     image: 'assets/onboarding2.png',
//                     title: "All your favorites",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide1.png',
//                   ),
//                   buildPage(
//                     image: 'assets/onboarding3.png',
//                     title: "Order from chosen chef",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide2.png',
//                   ),
//                   buildPage(
//                     image: 'assets/onboarding4.png',
//                     title: "Free delivery offers",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide3.png',
//                   ),
//                 ],
//               ),
//             ),

//             /// --------------------------------------
//             /// 🟢 Bottom Fixed Button + Skip
//             /// --------------------------------------
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 30,
//               child: Column(
//                 children: [

//                   PrimaryButton(
//                     text: currentIndex == 3 ? "Get Started" : "Next",
//                     radius: 12,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     onTap: () {
//                       if (currentIndex == 3) {
//                         context.go('/login');
//                       } else {
//                         goNext(context);
//                       }
//                     },
//                   ),

//                   const SizedBox(height: 15),

//                   if (currentIndex != 3)
//                     GestureDetector(
//                       onTap: () => context.go('/login'),
//                       child: const Text(
//                         "Skip",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF646982),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// -----------------------------------------
//   /// PAGE UI (only this part scrolls/swipes)
//   /// -----------------------------------------
//   Widget buildPage({
//     required String image,
//     required String title,
//     required String subtitle,
//     required String indicator,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//       child: Column(
//         children: [
          
//           /// 🔼 IMAGE THODA AUR UPAR KAR DIYA
//           const SizedBox(height: 50),

//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               image,
//               width: 240,
//               height: 292,
//               fit: BoxFit.cover,
//             ),
//           ),

//           /// 🔽 IMAGE AUR SLIDER KE BEECH EXTRA SPACE
//           const SizedBox(height: 50),

//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF32343E),
//             ),
//           ),

//           const SizedBox(height: 14),

//           Text(
//             subtitle,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 15,
//               height: 1.5,
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF646982),
//             ),
//           ),

//           const SizedBox(height: 35),

//           Image.asset(
//             indicator,
//             width: 76,
//             height: 10,
//             fit: BoxFit.contain,
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:dealdine_application/widgets/primary_button.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class OnboardingMain extends StatefulWidget {
//   const OnboardingMain({super.key});

//   @override
//   State<OnboardingMain> createState() => _OnboardingMainState();
// }

// class _OnboardingMainState extends State<OnboardingMain> {
//   final PageController _pageController = PageController();
//   int currentIndex = 0;

//   void goNext(BuildContext context) {
//     if (currentIndex == 3) {
//       context.go('/login');
//     } else {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void onPageChanged(int index) {
//     setState(() => currentIndex = index);
//   }

//   void handleLastSwipe() {
//     if (currentIndex == 3) {
//       Future.delayed(const Duration(milliseconds: 100), () {
//         context.go('/login');
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       body: SafeArea(
//         child: Stack(
//           children: [

//             /// ------------------------
//             /// 🔵 Only PageView moves
//             /// ------------------------
//             NotificationListener<ScrollEndNotification>(
//               onNotification: (n) {
//                 if (currentIndex == 3 && _pageController.page == 3) {
//                   handleLastSwipe();
//                 }
//                 return true;
//               },
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: onPageChanged,
//                 children: [
//                   buildPage(
//                     image: 'assets/onboarding1.png',
//                     title: "All your favorites",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide.png',
//                   ),
//                   buildPage(
//                     image: 'assets/onboarding2.png',
//                     title: "All your favorites",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide1.png',
//                   ),
//                   buildPage(
//                     image: 'assets/onboarding3.png',
//                     title: "Order from chosen chef",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide2.png',
//                   ),
//                   buildPage(
//                     image: 'assets/onboarding4.png',
//                     title: "Free delivery offers",
//                     subtitle:
//                         "Get all your loved foods in one once\nplace, you just place the order we do the rest",
//                     indicator: 'assets/slide3.png',
//                   ),
//                 ],
//               ),
//             ),

//             /// --------------------------------------
//             /// 🟢 Bottom Fixed Button + Skip
//             /// --------------------------------------
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 30,
//               child: Column(
//                 children: [

//                   PrimaryButton(
//                     text: currentIndex == 3 ? "Get Started" : "Next",
//                     radius: 12,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     onTap: () {
//                       if (currentIndex == 3) {
//                         context.go('/login');
//                       } else {
//                         goNext(context);
//                       }
//                     },
//                   ),

//                   const SizedBox(height: 15),

//                   if (currentIndex != 3)
//                     GestureDetector(
//                       onTap: () => context.go('/login'),
//                       child: const Text(
//                         "Skip",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF646982),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// -----------------------------------------
//   /// PAGE UI (only this part scrolls/swipes)
//   /// -----------------------------------------
//   Widget buildPage({
//     required String image,
//     required String title,
//     required String subtitle,
//     required String indicator,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//       child: Column(
//         children: [

//           /// 🔼 IMAGE upper hi rehta — SAME
//           const SizedBox(height: 50),

//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               image,
//               width: 240,
//               height: 292,
//               fit: BoxFit.cover,
//             ),
//           ),

//           /// 🔻 IMAGE aur TITLE ke darmiyan SPACE kam kar diya
//           const SizedBox(height: 25),   // 🔥 YAHI CHANGE KIYA

//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF32343E),
//             ),
//           ),

//           const SizedBox(height: 14),

//           Text(
//             subtitle,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 15,
//               height: 1.5,
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF646982),
//             ),
//           ),

//           const SizedBox(height: 35),

//           Image.asset(
//             indicator,
//             width: 76,
//             height: 10,
//             fit: BoxFit.contain,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:dealdine_application/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  void goNext(BuildContext context) {
    if (currentIndex == 3) {
      context.go('/login');
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPageChanged(int index) {
    setState(() => currentIndex = index);
  }

  void handleLastSwipe() {
    if (currentIndex == 3) {
      Future.delayed(const Duration(milliseconds: 100), () {
        context.go('/login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Stack(
          children: [

            /// ------------------------
            /// 🔵 Only PageView moves
            /// ------------------------
            NotificationListener<ScrollEndNotification>(
              onNotification: (n) {
                if (currentIndex == 3 && _pageController.page == 3) {
                  handleLastSwipe();
                }
                return true;
              },
              child: PageView(
                controller: _pageController,
                onPageChanged: onPageChanged,
                children: [
                  buildPage(
                    image: 'assets/onboarding1.png',
                    title: "All your favorites",
                    subtitle:
                        "Get all your loved foods in one once\nplace, you just place the order we do the rest",
                    indicator: 'assets/slide.png',
                  ),
                  buildPage(
                    image: 'assets/onboarding2.png',
                    title: "All your favorites",
                    subtitle:
                        "Get all your loved foods in one once\nplace, you just place the order we do the rest",
                    indicator: 'assets/slide1.png',
                  ),
                  buildPage(
                    image: 'assets/onboarding3.png',
                    title: "Order from chosen chef",
                    subtitle:
                        "Get all your loved foods in one once\nplace, you just place the order we do the rest",
                    indicator: 'assets/slide2.png',
                  ),
                  buildPage(
                    image: 'assets/onboarding4.png',
                    title: "Free delivery offers",
                    subtitle:
                        "Get all your loved foods in one once\nplace, you just place the order we do the rest",
                    indicator: 'assets/slide3.png',
                  ),
                ],
              ),
            ),

            /// --------------------------------------
            /// 🟢 Bottom Fixed Button + Skip
            /// --------------------------------------
            Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: Column(
                children: [

                  PrimaryButton(
                    text: currentIndex == 3 ? "Get Started" : "Next",
                    radius: 12,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    onTap: () {
                      if (currentIndex == 3) {
                        context.go('/login');
                      } else {
                        goNext(context);
                      }
                    },
                  ),

                  const SizedBox(height: 15),

                  if (currentIndex != 3)
                    GestureDetector(
                      onTap: () => context.go('/login'),
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF646982),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// -----------------------------------------
  /// PAGE UI (only this part scrolls/swipes)
  /// -----------------------------------------
  Widget buildPage({
    required String image,
    required String title,
    required String subtitle,
    required String indicator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [

          /// 🔼 IMAGE upper hi rehta — SAME
          const SizedBox(height: 50),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 240,
              height: 292,
              fit: BoxFit.cover,
            ),
          ),

          /// 🔻 IMAGE aur TITLE ke darmiyan SPACE
          const SizedBox(height: 25),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFF32343E),
            ),
          ),

          const SizedBox(height: 14),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w400,
              color: Color(0xFF646982),
            ),
          ),

          /// 🔻 SUBTITLE aur SLIDER ke darmiyan space kam kar diya
          const SizedBox(height: 25),   // 🔥 YAHI CHANGE KIYA

          Image.asset(
            indicator,
            width: 76,
            height: 10,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
