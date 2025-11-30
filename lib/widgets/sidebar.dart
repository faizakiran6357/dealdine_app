// // import 'package:flutter/material.dart';

// // class Sidebar extends StatelessWidget {
// //   const Sidebar({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 230,
// //       color: Colors.white,
// //       child: Column(
// //         children: [
// //           const SizedBox(height: 30),
// //           Image.asset("assets/splash1.png", height: 40),
// //           const SizedBox(height: 40),

// //           // Menu Items
// //           _menuItem(Icons.dashboard, "Dashboard", selected: true),
// //           _menuItem(Icons.check_circle, "Approvals"),
// //           _menuItem(Icons.analytics, "Analytics"),
// //           _menuItem(Icons.notifications, "Notifications"),

// //           const Spacer(),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _menuItem(IconData icon, String title, {bool selected = false}) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 8),
// //       decoration: BoxDecoration(
// //         color: selected ? const Color(0xffff6a00) : Colors.transparent,
// //         borderRadius: BorderRadius.circular(10),
// //       ),
// //       child: ListTile(
// //         leading: Icon(icon, color: selected ? Colors.white : Colors.black54),
// //         title: Text(
// //           title,
// //           style: TextStyle(
// //               color: selected ? Colors.white : Colors.black87,
// //               fontWeight: FontWeight.w500),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class Sidebar extends StatelessWidget {
//   const Sidebar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 230,
//       color: Colors.white,
//       child: Column(
//         children: [
//           const SizedBox(height: 30),
//           Image.asset("assets/splash1.png", height: 40),
//           const SizedBox(height: 40),

//           // Menu Items
//           _menuItem(
//             Icons.dashboard,
//             "Dashboard",
//             selected: true,
//             horizontalPadding: 15,  // 👈 LEFT/RIGHT PADDING ADDED
//             verticalPadding: 12,     // 👈 HEIGHT REDUCED SLIGHTLY
//           ),

//           _menuItem(Icons.check_circle, "Approvals"),
//           _menuItem(Icons.analytics, "Analytics"),
//           _menuItem(Icons.notifications, "Notifications"),

//           const Spacer(),
//         ],
//       ),
//     );
//   }

//   Widget _menuItem(
//     IconData icon,
//     String title, {
//     bool selected = false,
//     double horizontalPadding = 10,
//     double verticalPadding = 10,
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: EdgeInsets.symmetric(
//         horizontal: horizontalPadding,   // 👈 CUSTOM HORIZONTAL PADDING
//         vertical: verticalPadding,       // 👈 CUSTOM VERTICAL PADDING
//       ),
//       decoration: BoxDecoration(
//         color: selected ? const Color(0xffff6a00) : Colors.transparent,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             color: selected ? Colors.white : Colors.black54,
//           ),
//           const SizedBox(width: 12),
//           Text(
//             title,
//             style: TextStyle(
//               color: selected ? Colors.white : Colors.black87,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset("assets/splash1.png", height: 35),
          const SizedBox(height: 30),

          // ⭐ Dashboard item (custom margins to shrink width)
          _menuItem(
            Icons.dashboard,
            "Dashboard",
            selected: true,
            leftMargin: 15,     // 👈 Left side space
            rightMargin: 15,    // 👈 Right side space
          ),

          // ⭐ Other items untouched
          _menuItem(Icons.check_circle, "Approvals"),
          _menuItem(Icons.analytics, "Analytics"),
          _menuItem(Icons.notifications, "Notifications"),

          const Spacer(),
        ],
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title, {
    bool selected = false,
    double leftMargin = 0,
    double rightMargin = 0,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: leftMargin,
        right: rightMargin,
        top: 8,
        bottom: 8,
      ), // 👈 BUTTON SHIFTS INWARD (SMALLER WIDTH)
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: selected ? const Color(0xffff6a00) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: selected ? Colors.white : Colors.black54,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
