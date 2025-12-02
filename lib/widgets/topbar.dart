
// // // import 'package:flutter/material.dart';

// // // class TopBar extends StatelessWidget {
// // //   final bool showMenu;
// // //   const TopBar({super.key, this.showMenu = false});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return LayoutBuilder(
// // //       builder: (context, constraints) {
// // //         final bool isCompact = constraints.maxWidth < 600;

// // //         Widget buildSearchField() {
// // //           return Container(
// // //             height: 40,
// // //             padding: const EdgeInsets.symmetric(horizontal: 10),
// // //             decoration: BoxDecoration(
// // //               color: const Color(0xffF3F3F3),
// // //               borderRadius: BorderRadius.circular(10),
// // //             ),
// // //             child: const TextField(
// // //               decoration: InputDecoration(
// // //                 hintText: "Search",
// // //                 border: InputBorder.none,
// // //                 prefixIcon: Icon(Icons.search),
// // //               ),
// // //             ),
// // //           );
// // //         }

// // //         Widget buildNotifications() {
// // //           return Stack(
// // //             clipBehavior: Clip.none,
// // //             children: [
// // //               const Icon(
// // //                 Icons.notifications,
// // //                 color: Colors.orange,
// // //                 size: 24,
// // //               ),
// // //               Positioned(
// // //                 right: -6,
// // //                 top: -6,
// // //                 child: Container(
// // //                   padding: const EdgeInsets.all(4),
// // //                   decoration: const BoxDecoration(
// // //                     color: Color(0xFFFF69B4),
// // //                     shape: BoxShape.circle,
// // //                   ),
// // //                   constraints: const BoxConstraints(
// // //                     minWidth: 18,
// // //                     minHeight: 18,
// // //                   ),
// // //                   child: const Text(
// // //                     '6',
// // //                     style: TextStyle(
// // //                       color: Colors.white,
// // //                       fontSize: 7,
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                     textAlign: TextAlign.center,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           );
// // //         }

// // //         Widget buildLanguageSelector() {
// // //           return Row(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               Container(
// // //                 width: 30,
// // //                 height: 25,
// // //                 decoration: BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(2),
// // //                   border: Border.all(color: Colors.grey.shade300),
// // //                 ),
// // //                 child: ClipRRect(
// // //                   borderRadius: BorderRadius.circular(2),
// // //                   child: Image.asset(
// // //                     "assets/flag.png",
// // //                     fit: BoxFit.cover,
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(width: 8),
// // //               const Text(
// // //                 'English',
// // //                 style: TextStyle(
// // //                   fontSize: 14,
// // //                   fontWeight: FontWeight.w500,
// // //                 ),
// // //               ),
// // //               const SizedBox(width: 4),
// // //               const Icon(
// // //                 Icons.keyboard_arrow_down,
// // //                 size: 18,
// // //                 color: Colors.grey,
// // //               ),
// // //             ],
// // //           );
// // //         }

// // //         Widget buildProfile() {
// // //           return Row(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               const CircleAvatar(
// // //                 radius: 20,
// // //                 backgroundImage: AssetImage("assets/profile3.png"),
// // //               ),
// // //               const SizedBox(width: 12),
// // //               Column(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: const [
// // //                   Text(
// // //                     'Moni Roy',
// // //                     style: TextStyle(
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.black87,
// // //                     ),
// // //                   ),
// // //                   Text(
// // //                     'Admin',
// // //                     style: TextStyle(
// // //                       fontSize: 12,
// // //                       color: Colors.grey,
// // //                       fontWeight: FontWeight.normal,
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //               const SizedBox(width: 8),
// // //               const Icon(
// // //                 Icons.keyboard_arrow_down,
// // //                 size: 18,
// // //                 color: Colors.grey,
// // //               ),
// // //             ],
// // //           );
// // //         }

// // //         Widget buildMenuButton() {
// // //           if (!showMenu) return const SizedBox.shrink();
// // //           return Row(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               IconButton(
// // //                 icon: const Icon(Icons.menu),
// // //                 onPressed: () => Scaffold.of(context).openDrawer(),
// // //               ),
// // //               const SizedBox(width: 10),
// // //             ],
// // //           );
// // //         }

// // //         final actions = <Widget>[
// // //           buildNotifications(),
// // //           const SizedBox(width: 16),
// // //           buildLanguageSelector(),
// // //           const SizedBox(width: 16),
// // //           buildProfile(),
// // //         ];

// // //         Widget buildActionBar() {
// // //           return Wrap(
// // //             spacing: 16,
// // //             runSpacing: 12,
// // //             crossAxisAlignment: WrapCrossAlignment.center,
// // //             children: actions,
// // //           );
// // //         }

// // //         return Container(
// // //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// // //           decoration: const BoxDecoration(
// // //             color: Colors.white,
// // //             border: Border(
// // //               top: BorderSide(color: Color(0xFF9C27B0), width: 2),
// // //             ),
// // //             boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
// // //           ),
// // //           child: isCompact
// // //               ? Column(
// // //                   mainAxisSize: MainAxisSize.min,
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Row(
// // //                       children: [
// // //                         buildMenuButton(),
// // //                         Expanded(child: buildSearchField()),
// // //                       ],
// // //                     ),
// // //                     const SizedBox(height: 12),
// // //                     buildActionBar(),
// // //                   ],
// // //                 )
// // //               : SizedBox(
// // //                   height: 60,
// // //                   child: Row(
// // //                     children: [
// // //                       buildMenuButton(),
// // //                       Expanded(child: buildSearchField()),
// // //                       const SizedBox(width: 20),
// // //                       Flexible(child: buildActionBar()),
// // //                     ],
// // //                   ),
// // //                 ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';

// // class TopBar extends StatelessWidget {
// //   final bool showMenu;
// //   const TopBar({super.key, this.showMenu = false});

// //   @override
// //   Widget build(BuildContext context) {
// //     return LayoutBuilder(
// //       builder: (context, constraints) {
// //         final bool isMobile = constraints.maxWidth < 600;

// //         Widget buildSearchField() {
// //           return Container(
// //             height: 40,
// //             padding: const EdgeInsets.symmetric(horizontal: 10),
// //             decoration: BoxDecoration(
// //               color: const Color(0xffF3F3F3),
// //               borderRadius: BorderRadius.circular(10),
// //             ),
// //             child: const TextField(
// //               decoration: InputDecoration(
// //                 hintText: "Search",
// //                 border: InputBorder.none,
// //                 prefixIcon: Icon(Icons.search),
// //               ),
// //             ),
// //           );
// //         }

// //         Widget buildNotifications() {
// //           return Stack(
// //             clipBehavior: Clip.none,
// //             children: [
// //               const Icon(
// //                 Icons.notifications,
// //                 color: Colors.orange,
// //                 size: 24,
// //               ),
// //               Positioned(
// //                 right: -6,
// //                 top: -6,
// //                 child: Container(
// //                   padding: const EdgeInsets.all(4),
// //                   decoration: const BoxDecoration(
// //                     color: Color(0xFFFF69B4),
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: const Text(
// //                     '6',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 7,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           );
// //         }

// //         Widget buildLanguageSelector() {
// //           return Row(
// //             children: [
// //               Container(
// //                 width: 30,
// //                 height: 25,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(2),
// //                   border: Border.all(color: Colors.grey.shade300),
// //                 ),
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.circular(2),
// //                   child: Image.asset(
// //                     "assets/flag.png",
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(width: 8),
// //               const Text(
// //                 'English',
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w500,
// //                 ),
// //               ),
// //               const SizedBox(width: 4),
// //               const Icon(
// //                 Icons.keyboard_arrow_down,
// //                 size: 18,
// //                 color: Colors.grey,
// //               ),
// //             ],
// //           );
// //         }

// //         Widget buildProfile() {
// //           return Row(
// //             children: [
// //               const CircleAvatar(
// //                 radius: 20,
// //                 backgroundImage: AssetImage("assets/profile3.png"),
// //               ),
// //               const SizedBox(width: 12),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: const [
// //                   Text(
// //                     'Moni Roy',
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black87,
// //                     ),
// //                   ),
// //                   Text(
// //                     'Admin',
// //                     style: TextStyle(
// //                       fontSize: 12,
// //                       color: Colors.grey,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(width: 8),
// //               const Icon(
// //                 Icons.keyboard_arrow_down,
// //                 size: 18,
// //                 color: Colors.grey,
// //               ),
// //             ],
// //           );
// //         }

// //         Widget buildMenuButton() {
// //           if (!showMenu) return const SizedBox.shrink();
// //           return Row(
// //             children: [
// //               IconButton(
// //                 icon: const Icon(Icons.menu),
// //                 onPressed: () => Scaffold.of(context).openDrawer(),
// //               ),
// //               const SizedBox(width: 10),
// //             ],
// //           );
// //         }

// //         final actions = [
// //           buildNotifications(),
// //           const SizedBox(width: 16),
// //           buildLanguageSelector(),
// //           const SizedBox(width: 16),
// //           buildProfile(),
// //         ];

// //         // ---------------------------
// //         // 🔥 MOBILE SCROLLABLE TOP BAR
// //         // ---------------------------
// //         if (isMobile) {
// //           return Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
// //             decoration: const BoxDecoration(
// //               color: Colors.white,
// //               border: Border(
// //                 top: BorderSide(color: Color(0xFF9C27B0), width: 2),
// //               ),
// //               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
// //             ),

// //             // Scrollable Row
// //             child: SingleChildScrollView(
// //               scrollDirection: Axis.horizontal,
// //               child: Row(
// //                 children: [
// //                   buildMenuButton(),
// //                   SizedBox(
// //                       width: MediaQuery.of(context).size.width * 0.65,
// //                       child: buildSearchField()),
// //                   const SizedBox(width: 16),
// //                   ...actions,
// //                 ],
// //               ),
// //             ),
// //           );
// //         }

// //         // ---------------------------
// //         // 🔥 ORIGINAL WEB LAYOUT
// //         // ---------------------------
// //         return Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// //           decoration: const BoxDecoration(
// //             color: Colors.white,
// //             border: Border(
// //               top: BorderSide(color: Color(0xFF9C27B0), width: 2),
// //             ),
// //             boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
// //           ),
// //           child: SizedBox(
// //             height: 60,
// //             child: Row(
// //               children: [
// //                 buildMenuButton(),
// //                 Expanded(child: buildSearchField()),
// //                 const SizedBox(width: 20),
// //                 Flexible(
// //                   child: Wrap(
// //                     spacing: 16,
// //                     runSpacing: 12,
// //                     children: actions,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class TopBar extends StatelessWidget {
//   final bool showMenu;
//   const TopBar({super.key, this.showMenu = false});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final bool isMobile = constraints.maxWidth < 600;

//         Widget buildSearchField() {
//           return Container(
//             height: 40,
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               color: const Color(0xffF3F3F3),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const TextField(
//               decoration: InputDecoration(
//                 hintText: "Search",
//                 border: InputBorder.none,
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           );
//         }

//         Widget buildNotifications() {
//           return Stack(
//             clipBehavior: Clip.none,
//             children: [
//               const Icon(
//                 Icons.notifications,
//                 color: Colors.orange,
//                 size: 24,
//               ),
//               Positioned(
//                 right: -6,
//                 top: -6,
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFFF69B4),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Text(
//                     '6',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 7,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }

//         Widget buildLanguageSelector() {
//           return Row(
//             children: [
//               Container(
//                 width: 30,
//                 height: 25,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(2),
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(2),
//                   child: Image.asset(
//                     "assets/flag.png",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               const Text(
//                 'English',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(width: 4),
//               const Icon(
//                 Icons.keyboard_arrow_down,
//                 size: 18,
//                 color: Colors.grey,
//               ),
//             ],
//           );
//         }

//         Widget buildProfile() {
//           return Row(
//             children: [
//               const CircleAvatar(
//                 radius: 20,
//                 backgroundImage: AssetImage("assets/profile3.png"),
//               ),
//               const SizedBox(width: 12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text(
//                     'Moni Roy',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     'Admin',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(width: 8),
//               const Icon(
//                 Icons.keyboard_arrow_down,
//                 size: 18,
//                 color: Colors.grey,
//               ),
//             ],
//           );
//         }

//         Widget buildMenuButton() {
//           if (!showMenu) return const SizedBox.shrink();
//           return Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.menu),
//                 onPressed: () => Scaffold.of(context).openDrawer(),
//               ),
//               const SizedBox(width: 10),
//             ],
//           );
//         }

//         final actions = [
//           buildNotifications(),
//           const SizedBox(width: 16),
//           buildLanguageSelector(),
//           const SizedBox(width: 16),
//           buildProfile(),
//         ];

//         // ---------------------------
//         // 🔥 MOBILE SCROLLABLE TOP BAR (UPDATED WITH TOP PADDING)
//         // ---------------------------
//         if (isMobile) {
//           return Container(
//             padding: const EdgeInsets.only(
//               top: 20,       // <<< ADDED FOR PERFECT MOBILE POSITION
//               left: 15,
//               right: 15,
//               bottom: 12,
//             ),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               border: Border(
//                 top: BorderSide(color: Color(0xFF9C27B0), width: 2),
//               ),
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//             ),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   buildMenuButton(),
//                   SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.65,
//                       child: buildSearchField()),
//                   const SizedBox(width: 16),
//                   ...actions,
//                 ],
//               ),
//             ),
//           );
//         }

//         // ---------------------------
//         // 🔥 ORIGINAL WEB LAYOUT
//         // ---------------------------
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             border: Border(
//               top: BorderSide(color: Color(0xFF9C27B0), width: 2),
//             ),
//             boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//           ),
//           child: SizedBox(
//             height: 60,
//             child: Row(
//               children: [
//                 buildMenuButton(),
//                 Expanded(child: buildSearchField()),
//                 const SizedBox(width: 20),
//                 Flexible(
//                   child: Wrap(
//                     spacing: 16,
//                     runSpacing: 12,
//                     children: actions,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class TopBar extends StatelessWidget {
//   final bool showMenu;
//   const TopBar({super.key, this.showMenu = false});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final bool isMobile = constraints.maxWidth < 600;

//         Widget buildSearchField() {
//           return Container(
//             height: 40,
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               color: const Color(0xffF3F3F3),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const TextField(
//               decoration: InputDecoration(
//                 hintText: "Search",
//                 border: InputBorder.none,
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           );
//         }

//         Widget buildNotifications() {
//           return Stack(
//             clipBehavior: Clip.none,
//             children: [
//               const Icon(
//                 Icons.notifications,
//                 color: Colors.orange,
//                 size: 24,
//               ),
//               Positioned(
//                 right: -6,
//                 top: -6,
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFFF69B4),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Text(
//                     '6',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 7,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }

//         Widget buildLanguageSelector() {
//           return Row(
//             children: [
//               Container(
//                 width: 30,
//                 height: 25,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(2),
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(2),
//                   child: Image.asset(
//                     "assets/flag.png",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               const Text(
//                 'English',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(width: 4),
//               const Icon(
//                 Icons.keyboard_arrow_down,
//                 size: 18,
//                 color: Colors.grey,
//               ),
//             ],
//           );
//         }

//         Widget buildProfile() {
//           return Row(
//             children: [
//               const CircleAvatar(
//                 radius: 20,
//                 backgroundImage: AssetImage("assets/profile3.png"),
//               ),
//               const SizedBox(width: 12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text(
//                     'Moni Roy',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     'Admin',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(width: 8),
//               const Icon(
//                 Icons.keyboard_arrow_down,
//                 size: 18,
//                 color: Colors.grey,
//               ),
//             ],
//           );
//         }

//         Widget buildMenuButton() {
//           if (!showMenu) return const SizedBox.shrink();
//           return Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.menu),
//                 onPressed: () => Scaffold.of(context).openDrawer(),
//               ),
//               const SizedBox(width: 10),
//             ],
//           );
//         }

//         final actions = [
//           buildNotifications(),
//           const SizedBox(width: 16),
//           buildLanguageSelector(),
//           const SizedBox(width: 16),
//           buildProfile(),
//         ];

//         // ---------------------------
//         // 🔥 MOBILE SCROLLABLE TOP BAR (UPDATED WITH MORE TOP PADDING)
//         // ---------------------------
//         if (isMobile) {
//           return Container(
//             padding: const EdgeInsets.only(
//               top: 35,     // <<< Increased Top Padding (AppBar ke niche perfect)
//               left: 15,
//               right: 15,
//               bottom: 12,
//             ),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               border: Border(
//                 top: BorderSide(color: Color(0xFF9C27B0), width: 2),
//               ),
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//             ),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   buildMenuButton(),
//                   SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.65,
//                       child: buildSearchField()),
//                   const SizedBox(width: 16),
//                   ...actions,
//                 ],
//               ),
//             ),
//           );
//         }

//         // ---------------------------
//         // 🔥 ORIGINAL WEB LAYOUT (UNCHANGED)
//         // ---------------------------
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             border: Border(
//               top: BorderSide(color: Color(0xFF9C27B0), width: 2),
//             ),
//             boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//           ),
//           child: SizedBox(
//             height: 60,
//             child: Row(
//               children: [
//                 buildMenuButton(),
//                 Expanded(child: buildSearchField()),
//                 const SizedBox(width: 20),
//                 Flexible(
//                   child: Wrap(
//                     spacing: 16,
//                     runSpacing: 12,
//                     children: actions,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final bool showMenu;
  const TopBar({super.key, this.showMenu = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;

        Widget buildSearchField() {
          return Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xffF3F3F3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          );
        }

        Widget buildNotifications() {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications,
                color: Colors.orange,
                size: 24,
              ),
              Positioned(
                right: -6,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF69B4),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        Widget buildLanguageSelector() {
          return Row(
            children: [
              Container(
                width: 30,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    "assets/flag.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'English',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Colors.grey,
              ),
            ],
          );
        }

        Widget buildProfile() {
          return Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/profile3.png"),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Moni Roy',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Colors.grey,
              ),
            ],
          );
        }

        Widget buildMenuButton() {
          if (!showMenu) return const SizedBox.shrink();
          return Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              const SizedBox(width: 10),
            ],
          );
        }

        final actions = [
          buildNotifications(),
          const SizedBox(width: 16),
          buildLanguageSelector(),
          const SizedBox(width: 16),
          buildProfile(),
        ];

        // ---------------------------
        // 🔥 MOBILE (UNCHANGED)
        // ---------------------------
        if (isMobile) {
          return Container(
            padding: const EdgeInsets.only(
              top: 35,
              left: 15,
              right: 15,
              bottom: 12,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Color(0xFF9C27B0), width: 2),
              ),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildMenuButton(),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: buildSearchField()),
                  const SizedBox(width: 16),
                  ...actions,
                ],
              ),
            ),
          );
        }

        // ---------------------------
        // 🔥 WEB (UPDATED HORIZONTAL ROW)
        // ---------------------------
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(0xFF9C27B0), width: 2),
            ),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                buildMenuButton(),
                // Search Field
                SizedBox(
                  width: 400, // Fixed width for web search field
                  child: buildSearchField(),
                ),
                const SizedBox(width: 250),
                // Actions row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: actions,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
