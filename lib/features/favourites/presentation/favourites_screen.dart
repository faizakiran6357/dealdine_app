
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class FavouritesScreen extends StatelessWidget {
//   const FavouritesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset("assets/dine.png", width: 150),
//                 Image.asset("assets/notification.png", width: 30),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // REMOVED "Favourite Restaurants | See All >" ROW

//             _restaurantCard(),
//             const SizedBox(height: 15),
//             _restaurantCard(),
//             const SizedBox(height: 15),
//             _restaurantCard(),
//             const SizedBox(height: 15),
//             _restaurantCard(),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }

//   static Widget _restaurantCard() {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset("assets/resto.png", width: 65),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Panda Express",
//                         style: TextStyle(
//                             fontSize: 17, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 3),
//                     const Text(
//                       "Coffe + Pasta Combo",
//                       style: TextStyle(color: Colors.grey,fontSize: 10),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 6),
//                     Image.asset(
//                       "assets/off.png",
//                       height: 30,
//                     ),
//                   ],
//                 ),
//               ),
//               Image.asset("assets/bbb.png", width: 50),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Row(
//             children: [
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Image.asset(
//                     "assets/aaa.png",
//                     height: 40,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Image.asset("assets/heart.png", height: 35),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:dealdine_application/features/notifications/presentation/notifications_screen.dart';
import 'package:dealdine_application/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/dine.png", width: 150),
                // Image.asset("assets/notification.png", width: 30),
                 // 👉 CLICKABLE NOTIFICATION ICON
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NotificationsScreen(),
                      ),
                    );
                  },
                  child: Image.asset("assets/notification.png", width: 30),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _restaurantCard(),
            const SizedBox(height: 15),
            _restaurantCard(),
            const SizedBox(height: 15),
            _restaurantCard(),
            const SizedBox(height: 15),
            _restaurantCard(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget _restaurantCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- TOP ROW ----------
          Row(
            children: [
              Image.asset("assets/resto.png", width: 65),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Panda Express",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Coffee + Pasta Combo",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Image.asset(
                      "assets/off.png",
                      height: 30,
                    ),
                  ],
                ),
              ),
              Image.asset("assets/bbb.png", width: 60),
            ],
          ),

          const SizedBox(height: 15),

          // ---------- BUTTON + HEART ROW ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // View Deal Button
              SizedBox(
                width: 252,
                height: 42,
                child: PrimaryButton(
                  text: "View Deal",
                  onTap: () {
                    print("View Deal clicked");
                  },
                  radius: 12,
                  // padding: const EdgeInsets.symmetric(
                  //     horizontal: 61, vertical: 12),
                ),
              ),

              // Heart Icon
              Image.asset("assets/heart.png", width: 39, height: 39),
            ],
          ),
        ],
      ),
    );
  }
}
