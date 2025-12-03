
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class RestaurantProfileScreen extends StatelessWidget {
//   const RestaurantProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bool isWeb = MediaQuery.of(context).size.width > 900;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       body: Row(
//         children: [
//           // --------------------------
//           // LEFT SIDEBAR
//           // --------------------------
//           LeftSidebar(
//             width: isWeb ? 220 : 70,
//             showLabels: isWeb,
//           ),

//           // --------------------------
//           // MAIN CONTENT AREA
//           // --------------------------
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // ----------------------
//                   // TOP NAV BAR
//                   // ----------------------
//                   TopNavBar(isWeb: isWeb),

//                   const SizedBox(height: 28),

//                   // ----------------------
//                   // PAGE TITLE
//                   // ----------------------
//                   const Text(
//                     "Restaurant Profile",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // ----------------------------
//                   // RESTAURANT INFO CARD
//                   // ----------------------------
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(32),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(18),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.05),
//                           blurRadius: 12,
//                         )
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // ---------------------------------
//                         // Profile Picture + Title Text
//                         // ---------------------------------
//                         Row(
//                           children: [
//                             Container(
//                               width: 68,
//                               height: 68,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: const DecorationImage(
//                                   image: AssetImage('assets/restuarant_profile.png'),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   "Mario's Italian Bistro",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Enter deal title...",
//                                   style: TextStyle(
//                                     fontSize: 13,
//                                     color: Color(0xFF6B7180),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),

//                         const SizedBox(height: 30),

//                         // FORM FIELDS
//                         _fieldLabel("Restaurant Name"),
//                         _inputField("Mario's Italian Bistro"),

//                         const SizedBox(height: 18),

//                         _fieldLabel("Address"),
//                         _inputField("123 Main Street, Brambleton, VA"),

//                         const SizedBox(height: 18),

//                         _fieldLabel("Phone"),
//                         _inputField("(555) 123-4567"),

//                         const SizedBox(height: 18),

//                         _fieldLabel("Email"),
//                         _inputField("info@mariosbistro.com"),

//                         const SizedBox(height: 18),

//                         _fieldLabel("Description"),
//                         _multiLineInput(
//                             "Authentic Italian cuisine with a modern twist"),

//                         const SizedBox(height: 28),

//                         // SAVE BUTTON
//                         SizedBox(
//                           width: double.infinity,
//                           height: 48,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFFFF4B00),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const Text(
//                               "Save Changes",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 24),

//                   // ------------------------------
//                   // ACCOUNT SETTINGS CARD
//                   // ------------------------------
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(32),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(18),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.04),
//                           blurRadius: 12,
//                         )
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Account Settings",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 22),

//                         _settingTile(
//                           title: "Email Notifications",
//                           subtitle:
//                               "Receive updates about your deals and analytics",
//                         ),
//                         const SizedBox(height: 16),

//                         _settingTile(
//                           title: "SMS Alerts",
//                           subtitle:
//                               "Get instant notifications for deal redemptions",
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 60),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ------------------------------------------------------------
// // COMPONENTS
// // ------------------------------------------------------------

// Widget _fieldLabel(String text) {
//   return Text(
//     text,
//     style: const TextStyle(
//       fontSize: 15,
//       fontWeight: FontWeight.w600,
//     ),
//   );
// }

// Widget _inputField(String hint) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 14),
//     height: 44,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     alignment: Alignment.centerLeft,
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//     ),
//   );
// }

// Widget _multiLineInput(String hint) {
//   return Container(
//     padding: const EdgeInsets.all(14),
//     height: 120,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//     ),
//   );
// }

// Widget _settingTile({required String title, required String subtitle}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//     decoration: BoxDecoration(
//       color: const Color(0xFFF7F8FA),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style:
//                     const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
//             const SizedBox(height: 4),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFF6B7180),
//               ),
//             ),
//           ],
//         ),
//         // -------------------------
//         // ORANGE CHECKBOX
//         // -------------------------
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             color: const Color(0xFFFF4B00),
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: const Icon(
//             Icons.check,
//             color: Colors.white,
//             size: 18,
//           ),
//         ),
//       ],
//     ),
//   );
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class RestaurantProfileScreen extends StatelessWidget {
//   const RestaurantProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final bool isWeb = width >= 950;
//     final bool isTablet = width >= 650 && width < 950;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,
//       drawer: (!isWeb && !isTablet)
//           ? Drawer(child: LeftSidebar(width: 240, showLabels: true))
//           : null,
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Sidebar for web/tablet
//             if (isWeb || isTablet)
//               LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),

//             // Main content
//             Expanded(
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 1200),
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 18),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Top nav for web/tablet
//                         if (isWeb || isTablet) const TopNavBar(isWeb: true),
//                         const SizedBox(height: 28),

//                         // Page title
//                         const Text(
//                           "Restaurant Profile",
//                           style: TextStyle(
//                               fontSize: 28, fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(height: 20),

//                         // Restaurant info card
//                         _restaurantInfoCard(),

//                         const SizedBox(height: 24),

//                         // Account settings
//                         _accountSettingsCard(),

//                         const SizedBox(height: 60),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _restaurantInfoCard() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(32),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 12,
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Profile picture + title
//           Row(
//             children: [
//               Container(
//                 width: 68,
//                 height: 68,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: const DecorationImage(
//                     image: AssetImage('assets/restuarant_profile.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Mario's Italian Bistro",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     "Enter deal title...",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFF6B7180),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 30),

//           // Form fields
//           _fieldLabel("Restaurant Name"),
//           _inputField("Mario's Italian Bistro"),
//           const SizedBox(height: 18),

//           _fieldLabel("Address"),
//           _inputField("123 Main Street, Brambleton, VA"),
//           const SizedBox(height: 18),

//           _fieldLabel("Phone"),
//           _inputField("(555) 123-4567"),
//           const SizedBox(height: 18),

//           _fieldLabel("Email"),
//           _inputField("info@mariosbistro.com"),
//           const SizedBox(height: 18),

//           _fieldLabel("Description"),
//           _multiLineInput("Authentic Italian cuisine with a modern twist"),
//           const SizedBox(height: 28),

//           // Save button
//           SizedBox(
//             width: double.infinity,
//             height: 48,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFFF4B00),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text(
//                 "Save Changes",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _accountSettingsCard() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(32),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 12,
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Account Settings",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 22),
//           _settingTile(
//             title: "Email Notifications",
//             subtitle: "Receive updates about your deals and analytics",
//           ),
//           const SizedBox(height: 16),
//           _settingTile(
//             title: "SMS Alerts",
//             subtitle: "Get instant notifications for deal redemptions",
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ----------------------------
// // COMPONENTS
// // ----------------------------
// Widget _fieldLabel(String text) {
//   return Text(
//     text,
//     style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//   );
// }

// Widget _inputField(String hint) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 14),
//     height: 44,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     alignment: Alignment.centerLeft,
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//     ),
//   );
// }

// Widget _multiLineInput(String hint) {
//   return Container(
//     padding: const EdgeInsets.all(14),
//     height: 120,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//     ),
//   );
// }

// Widget _settingTile({required String title, required String subtitle}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//     decoration: BoxDecoration(
//       color: const Color(0xFFF7F8FA),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style:
//                     const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
//             const SizedBox(height: 4),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFF6B7180),
//               ),
//             ),
//           ],
//         ),
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             color: const Color(0xFFFF4B00),
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: const Icon(
//             Icons.check,
//             color: Colors.white,
//             size: 18,
//           ),
//         ),
//       ],
//     ),
//   );
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class RestaurantProfileScreen extends StatelessWidget {
//   const RestaurantProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final bool isWeb = width > 900;
//     final bool isTablet = width > 600 && width <= 900;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // --------------------------
//           // LEFT SIDEBAR
//           // --------------------------
//           if (isWeb || isTablet)
//             LeftSidebar(
//               width: isWeb ? 220 : 72,
//               showLabels: isWeb || isTablet,
//             ),

//           // --------------------------
//           // MAIN CONTENT AREA
//           // --------------------------
//           Expanded(
//             child: SafeArea(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 1200),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // ----------------------
//                       // TOP NAV BAR
//                       // ----------------------
//                       if (isWeb || isTablet) const TopNavBar(isWeb: true),

//                       const SizedBox(height: 28),

//                       // ----------------------
//                       // PAGE TITLE
//                       // ----------------------
//                       const Text(
//                         "Restaurant Profile",
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // ----------------------------
//                       // RESTAURANT INFO CARD
//                       // ----------------------------
//                       _restaurantInfoCard(),

//                       const SizedBox(height: 24),

//                       // ------------------------------
//                       // ACCOUNT SETTINGS CARD
//                       // ------------------------------
//                       _accountSettingsCard(),

//                       const SizedBox(height: 60),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       // --------------------------
//       // MOBILE DRAWER + TOP NAV
//       // --------------------------
//       drawer: (!isWeb && !isTablet)
//           ? Drawer(child: LeftSidebar(width: 220, showLabels: true))
//           : null,
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,
//     );
//   }
// }

// // ============================================================
// // RESTAURANT INFO CARD
// // ============================================================
// Widget _restaurantInfoCard() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(24), // responsive padding
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(18),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 12,
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 68,
//               height: 68,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: const DecorationImage(
//                   image: AssetImage('assets/restuarant_profile.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Mario's Italian Bistro",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     softWrap: true,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     "Enter deal title...",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFF6B7180),
//                     ),
//                     softWrap: true,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),

//         // FORM FIELDS
//         _fieldLabel("Restaurant Name"),
//         _inputField("Mario's Italian Bistro"),
//         const SizedBox(height: 12),

//         _fieldLabel("Address"),
//         _inputField("123 Main Street, Brambleton, VA"),
//         const SizedBox(height: 12),

//         _fieldLabel("Phone"),
//         _inputField("(555) 123-4567"),
//         const SizedBox(height: 12),

//         _fieldLabel("Email"),
//         _inputField("info@mariosbistro.com"),
//         const SizedBox(height: 12),

//         _fieldLabel("Description"),
//         _multiLineInput("Authentic Italian cuisine with a modern twist"),
//         const SizedBox(height: 20),

//         // SAVE BUTTON
//         SizedBox(
//           width: double.infinity,
//           height: 48,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFFF4B00),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               "Save Changes",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // ============================================================
// // ACCOUNT SETTINGS CARD
// // ============================================================
// Widget _accountSettingsCard() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(18),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.04),
//           blurRadius: 12,
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Account Settings",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 18),

//         _settingTile(
//           title: "Email Notifications",
//           subtitle: "Receive updates about your deals and analytics",
//         ),
//         const SizedBox(height: 12),

//         _settingTile(
//           title: "SMS Alerts",
//           subtitle: "Get instant notifications for deal redemptions",
//         ),
//       ],
//     ),
//   );
// }

// // ============================================================
// // COMPONENTS
// // ============================================================
// Widget _fieldLabel(String text) {
//   return Text(
//     text,
//     style: const TextStyle(
//       fontSize: 15,
//       fontWeight: FontWeight.w600,
//     ),
//   );
// }

// Widget _inputField(String hint) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 14),
//     height: 44,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     alignment: Alignment.centerLeft,
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//       softWrap: true,
//       overflow: TextOverflow.ellipsis,
//     ),
//   );
// }

// Widget _multiLineInput(String hint) {
//   return Container(
//     padding: const EdgeInsets.all(14),
//     height: 120,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//       softWrap: true,
//     ),
//   );
// }

// Widget _settingTile({required String title, required String subtitle}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//     decoration: BoxDecoration(
//       color: const Color(0xFFF7F8FA),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//                 softWrap: true,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180)),
//                 softWrap: true,
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 8),
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             color: const Color(0xFFFF4B00),
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: const Icon(
//             Icons.check,
//             color: Colors.white,
//             size: 18,
//           ),
//         ),
//       ],
//     ),
//   );
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class RestaurantProfileScreen extends StatelessWidget {
//   const RestaurantProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final bool isWeb = width > 900;
//     final bool isTablet = width > 600 && width <= 900;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // --------------------------
//             // LEFT SIDEBAR (always stick)
//             // --------------------------
//             if (isWeb || isTablet)
//               LeftSidebar(
//                 width: isWeb ? 220 : 72,
//                 showLabels: true,
//               ),

//             // --------------------------
//             // MAIN CONTENT AREA
//             // --------------------------
//             Expanded(
//               child: Column(
//                 children: [
//                   // ----------------------
//                   // TOP NAV BAR (always stick)
//                   // ----------------------
//                   const TopNavBar(isWeb: true),

//                   // ----------------------
//                   // SCROLLABLE MAIN CONTENT
//                   // ----------------------
//                   Expanded(
//                     child: SingleChildScrollView(
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                       child: ConstrainedBox(
//                         constraints: const BoxConstraints(maxWidth: 1200),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 28),

//                             // PAGE TITLE
//                             const Text(
//                               "Restaurant Profile",
//                               style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 20),

//                             // RESTAURANT INFO CARD
//                             _restaurantInfoCard(),

//                             const SizedBox(height: 24),

//                             // ACCOUNT SETTINGS CARD
//                             _accountSettingsCard(),

//                             const SizedBox(height: 60),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),

//       // --------------------------
//       // MOBILE DRAWER + TOP NAV
//       // --------------------------
//       drawer: (!isWeb && !isTablet)
//           ? Drawer(child: LeftSidebar(width: 220, showLabels: true))
//           : null,
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,
//     );
//   }
// }

// // ============================================================
// // RESTAURANT INFO CARD
// // ============================================================
// Widget _restaurantInfoCard() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(18),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 12,
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 68,
//               height: 68,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: const DecorationImage(
//                   image: AssetImage('assets/restuarant_profile.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Mario's Italian Bistro",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     softWrap: true,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     "Enter deal title...",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFF6B7180),
//                     ),
//                     softWrap: true,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),

//         // FORM FIELDS
//         _fieldLabel("Restaurant Name"),
//         _inputField("Mario's Italian Bistro"),
//         const SizedBox(height: 12),

//         _fieldLabel("Address"),
//         _inputField("123 Main Street, Brambleton, VA"),
//         const SizedBox(height: 12),

//         _fieldLabel("Phone"),
//         _inputField("(555) 123-4567"),
//         const SizedBox(height: 12),

//         _fieldLabel("Email"),
//         _inputField("info@mariosbistro.com"),
//         const SizedBox(height: 12),

//         _fieldLabel("Description"),
//         _multiLineInput("Authentic Italian cuisine with a modern twist"),
//         const SizedBox(height: 20),

//         // SAVE BUTTON
//         SizedBox(
//           width: double.infinity,
//           height: 48,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFFF4B00),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               "Save Changes",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // ============================================================
// // ACCOUNT SETTINGS CARD
// // ============================================================
// Widget _accountSettingsCard() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(18),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.04),
//           blurRadius: 12,
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Account Settings",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 18),

//         _settingTile(
//           title: "Email Notifications",
//           subtitle: "Receive updates about your deals and analytics",
//         ),
//         const SizedBox(height: 12),

//         _settingTile(
//           title: "SMS Alerts",
//           subtitle: "Get instant notifications for deal redemptions",
//         ),
//       ],
//     ),
//   );
// }

// // ============================================================
// // COMPONENTS
// // ============================================================
// Widget _fieldLabel(String text) {
//   return Text(
//     text,
//     style: const TextStyle(
//       fontSize: 15,
//       fontWeight: FontWeight.w600,
//     ),
//   );
// }

// Widget _inputField(String hint) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 14),
//     height: 44,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     alignment: Alignment.centerLeft,
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//       softWrap: true,
//       overflow: TextOverflow.ellipsis,
//     ),
//   );
// }

// Widget _multiLineInput(String hint) {
//   return Container(
//     padding: const EdgeInsets.all(14),
//     height: 120,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//       softWrap: true,
//     ),
//   );
// }

// Widget _settingTile({required String title, required String subtitle}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//     decoration: BoxDecoration(
//       color: const Color(0xFFF7F8FA),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//                 softWrap: true,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180)),
//                 softWrap: true,
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 8),
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             color: const Color(0xFFFF4B00),
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: const Icon(
//             Icons.check,
//             color: Colors.white,
//             size: 18,
//           ),
//         ),
//       ],
//     ),
//   );
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class RestaurantProfileScreen extends StatelessWidget {
//   const RestaurantProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final bool isWeb = width > 900;
//     final bool isTablet = width > 600 && width <= 900;
//     final bool isMobile = !isWeb && !isTablet;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // --------------------------
//             // LEFT SIDEBAR (always stick)
//             // --------------------------
//             if (isWeb || isTablet)
//               LeftSidebar(
//                 width: isWeb ? 220 : 72,
//                 showLabels: true,
//               ),

//             // --------------------------
//             // MAIN CONTENT AREA
//             // --------------------------
//             Expanded(
//               child: Column(
//                 children: [
//                   // ----------------------
//                   // TOP NAV BAR (always stick for Web/Tablet)
//                   // ----------------------
//                   if (!isMobile) const TopNavBar(isWeb: true),

//                   // ----------------------
//                   // SCROLLABLE MAIN CONTENT
//                   // ----------------------
//                   Expanded(
//                     child: SingleChildScrollView(
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                       child: ConstrainedBox(
//                         constraints: const BoxConstraints(maxWidth: 1200),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 28),

//                             // PAGE TITLE
//                             const Text(
//                               "Restaurant Profile",
//                               style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 20),

//                             // RESTAURANT INFO CARD
//                             _restaurantInfoCard(),

//                             const SizedBox(height: 24),

//                             // ACCOUNT SETTINGS CARD
//                             _accountSettingsCard(),

//                             const SizedBox(height: 60),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),

//       // --------------------------
//       // MOBILE DRAWER + APPBAR
//       // --------------------------
//       drawer: isMobile ? Drawer(child: LeftSidebar(width: 220, showLabels: true)) : null,
//       appBar: isMobile
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,
//     );
//   }
// }

// // ============================================================
// // RESTAURANT INFO CARD
// // ============================================================
// Widget _restaurantInfoCard() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(18),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 12,
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 68,
//               height: 68,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: const DecorationImage(
//                   image: AssetImage('assets/restuarant_profile.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Mario's Italian Bistro",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     softWrap: true,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     "Enter deal title...",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFF6B7180),
//                     ),
//                     softWrap: true,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),

//         // FORM FIELDS
//         _fieldLabel("Restaurant Name"),
//         _inputField("Mario's Italian Bistro"),
//         const SizedBox(height: 12),

//         _fieldLabel("Address"),
//         _inputField("123 Main Street, Brambleton, VA"),
//         const SizedBox(height: 12),

//         _fieldLabel("Phone"),
//         _inputField("(555) 123-4567"),
//         const SizedBox(height: 12),

//         _fieldLabel("Email"),
//         _inputField("info@mariosbistro.com"),
//         const SizedBox(height: 12),

//         _fieldLabel("Description"),
//         _multiLineInput("Authentic Italian cuisine with a modern twist"),
//         const SizedBox(height: 20),

//         // SAVE BUTTON
//         SizedBox(
//           width: double.infinity,
//           height: 48,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFFF4B00),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               "Save Changes",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // ============================================================
// // ACCOUNT SETTINGS CARD
// // ============================================================
// Widget _accountSettingsCard() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(18),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.04),
//           blurRadius: 12,
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Account Settings",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 18),

//         _settingTile(
//           title: "Email Notifications",
//           subtitle: "Receive updates about your deals and analytics",
//         ),
//         const SizedBox(height: 12),

//         _settingTile(
//           title: "SMS Alerts",
//           subtitle: "Get instant notifications for deal redemptions",
//         ),
//       ],
//     ),
//   );
// }

// // ============================================================
// // COMPONENTS
// // ============================================================
// Widget _fieldLabel(String text) {
//   return Text(
//     text,
//     style: const TextStyle(
//       fontSize: 15,
//       fontWeight: FontWeight.w600,
//     ),
//   );
// }

// Widget _inputField(String hint) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 14),
//     height: 44,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     alignment: Alignment.centerLeft,
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//       softWrap: true,
//       overflow: TextOverflow.ellipsis,
//     ),
//   );
// }

// Widget _multiLineInput(String hint) {
//   return Container(
//     padding: const EdgeInsets.all(14),
//     height: 120,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//       softWrap: true,
//     ),
//   );
// }

// Widget _settingTile({required String title, required String subtitle}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//     decoration: BoxDecoration(
//       color: const Color(0xFFF7F8FA),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//                 softWrap: true,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180)),
//                 softWrap: true,
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 8),
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             color: const Color(0xFFFF4B00),
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: const Icon(
//             Icons.check,
//             color: Colors.white,
//             size: 18,
//           ),
//         ),
//       ],
//     ),
//   );
// // }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class RestaurantProfileScreen extends StatelessWidget {
//   const RestaurantProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final bool isWeb = width > 900;
//     final bool isTablet = width > 600 && width <= 900;
//     final bool isMobile = !isWeb && !isTablet;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),

//       // --------------------------
//       // MOBILE APPBAR + DRAWER
//       // --------------------------
//       appBar: isMobile
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               leading: Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu, color: Colors.black),
//                   onPressed: () => Scaffold.of(context).openDrawer(),
//                 ),
//               ),
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Image.asset('assets/bell_icon.png', width: 26, height: 26),
//                 ],
//               ),
//             )
//           : null,
//       drawer: isMobile
//           ? Drawer(
//               child: LeftSidebar(width: 220, showLabels: true),
//             )
//           : null,

//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // --------------------------
//             // LEFT SIDEBAR (Web/Tablet)
//             // --------------------------
//             if (isWeb || isTablet)
//               LeftSidebar(
//                 width: isWeb ? 220 : 72,
//                 showLabels: true,
//               ),

//             // --------------------------
//             // MAIN CONTENT AREA
//             // --------------------------
//             Expanded(
//               child: Column(
//                 children: [
//                   // --------------------------
//                   // TOP NAV BAR (Web/Tablet)
//                   // --------------------------
//                   if (!isMobile) const TopNavBar(isWeb: true),

//                   // --------------------------
//                   // MOBILE SEARCH FIELD (AppBar ke neeche)
//                   // --------------------------
//                   if (isMobile)
//                     Padding(
//                       padding:
//                           const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Search deals...',
//                           filled: true,
//                           fillColor: Colors.white,
//                           prefixIcon: const Icon(Icons.search),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),

//                   // --------------------------
//                   // SCROLLABLE CONTENT
//                   // --------------------------
//                   Expanded(
//                     child: SingleChildScrollView(
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                       child: ConstrainedBox(
//                         constraints: const BoxConstraints(maxWidth: 1200),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 20),

//                             // PAGE TITLE
//                             const Text(
//                               "Restaurant Profile",
//                               style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 20),

//                             // RESTAURANT INFO CARD
//                             _restaurantInfoCard(),

//                             const SizedBox(height: 24),

//                             // ACCOUNT SETTINGS CARD
//                             _accountSettingsCard(),

//                             const SizedBox(height: 24),

//                             // MOBILE SETTINGS CARD (mobile only)
//                             if (isMobile)
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (_) => const SettingsScreen()),
//                                   );
//                                 },
//                                 child: Container(
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.all(24),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(18),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.04),
//                                         blurRadius: 12,
//                                       )
//                                     ],
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: const [
//                                       Text(
//                                         "Settings",
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       Icon(Icons.arrow_forward_ios, size: 16),
//                                     ],
//                                   ),
//                                 ),
//                               ),

//                             const SizedBox(height: 60),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ============================================================
// // SETTINGS SCREEN (MOBILE)
// // ============================================================
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Settings"),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             // LANGUAGE ROW
//             Row(
//               children: [
//                 Image.asset('assets/Flag.png', width: 26, height: 26),
//                 const SizedBox(width: 8),
//                 const Text(
//                   "English",
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // PROFILE INFO
//             Row(
//               children: [
//                 const CircleAvatar(
//                   radius: 30,
//                   backgroundImage: AssetImage('assets/profile3.png'),
//                 ),
//                 const SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Moni Roy",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                     ),
//                     Text(
//                       "Admin",
//                       style: TextStyle(fontSize: 14, color: Color(0xFF6B7180)),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ============================================================
// // RESTAURANT INFO CARD
// // ============================================================
// Widget _restaurantInfoCard() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(18),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 12,
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 68,
//               height: 68,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: const DecorationImage(
//                   image: AssetImage('assets/restuarant_profile.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Mario's Italian Bistro",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     "Enter deal title...",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFF6B7180),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),

//         _fieldLabel("Restaurant Name"),
//         _inputField("Mario's Italian Bistro"),
//         const SizedBox(height: 12),

//         _fieldLabel("Address"),
//         _inputField("123 Main Street, Brambleton, VA"),
//         const SizedBox(height: 12),

//         _fieldLabel("Phone"),
//         _inputField("(555) 123-4567"),
//         const SizedBox(height: 12),

//         _fieldLabel("Email"),
//         _inputField("info@mariosbistro.com"),
//         const SizedBox(height: 12),

//         _fieldLabel("Description"),
//         _multiLineInput("Authentic Italian cuisine with a modern twist"),
//         const SizedBox(height: 20),

//         // SAVE BUTTON
//         SizedBox(
//           width: double.infinity,
//           height: 48,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFFF4B00),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               "Save Changes",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // ============================================================
// // ACCOUNT SETTINGS CARD
// // ============================================================
// Widget _accountSettingsCard() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(18),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.04),
//           blurRadius: 12,
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Account Settings",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 18),

//         _settingTile(
//           title: "Email Notifications",
//           subtitle: "Receive updates about your deals and analytics",
//         ),
//         const SizedBox(height: 12),

//         _settingTile(
//           title: "SMS Alerts",
//           subtitle: "Get instant notifications for deal redemptions",
//         ),
//       ],
//     ),
//   );
// }

// // ============================================================
// // COMPONENTS
// // ============================================================
// Widget _fieldLabel(String text) {
//   return Text(
//     text,
//     style: const TextStyle(
//       fontSize: 15,
//       fontWeight: FontWeight.w600,
//     ),
//   );
// }

// Widget _inputField(String hint) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 14),
//     height: 44,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     alignment: Alignment.centerLeft,
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//     ),
//   );
// }

// Widget _multiLineInput(String hint) {
//   return Container(
//     padding: const EdgeInsets.all(14),
//     height: 120,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     child: Text(
//       hint,
//       style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
//     ),
//   );
// }

// Widget _settingTile({required String title, required String subtitle}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//     decoration: BoxDecoration(
//       color: const Color(0xFFF7F8FA),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180)),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 8),
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             color: const Color(0xFFFF4B00),
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: const Icon(
//             Icons.check,
//             color: Colors.white,
//             size: 18,
//           ),
//         ),
//       ],
//     ),
//   );
// }
import 'package:dealdine_application/widgets/left_sidebar.dart';
import 'package:dealdine_application/widgets/mobile_appbar.dart';
import 'package:dealdine_application/widgets/top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class RestaurantProfileScreen extends StatelessWidget {
  const RestaurantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isWeb = width > 900;
    final bool isTablet = width > 600 && width <= 900;
    final bool isMobile = !isWeb && !isTablet;

    return Scaffold(
      backgroundColor: const Color(0xFFdee2e6),

      // --------------------------
      // MOBILE APPBAR + DRAWER
      // --------------------------
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile
          ? Drawer(
              child: LeftSidebar(width: 220, showLabels: true),
            )
          : null,

      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT SIDEBAR (Web/Tablet)
            if (isWeb || isTablet)
              LeftSidebar(
                width: isWeb ? 220 : 72,
                showLabels: true,
              ),

            // MAIN CONTENT AREA
            Expanded(
              child: Column(
                children: [
                  // TOP NAV BAR (Web/Tablet)
                  if (!isMobile) const TopNavBar(isWeb: true),

                  // SCROLLABLE CONTENT
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 1),

                            // PAGE TITLE
                            const Text(
                              "Restaurant Profile",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // RESTAURANT INFO CARD
                            _restaurantInfoCard(),

                            const SizedBox(height: 24),

                            // ACCOUNT SETTINGS CARD
                            _accountSettingsCard(),

                            const SizedBox(height: 24),

                            // MOBILE SETTINGS CARD (mobile only)
                            if (isMobile)
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const SettingsScreen()),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        blurRadius: 12,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Settings",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward_ios, size: 16),
                                    ],
                                  ),
                                ),
                              ),

                            const SizedBox(height: 60),
                          ],
                        ),
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
}


// // ============================================================
// // ENHANCED SETTINGS SCREEN (MOBILE)
// // ============================================================
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         title: const Text(
//           "Settings",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // -------------------------
//             // LANGUAGES CARD
//             // -------------------------
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   const Text(
//                     "Languages",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   const Spacer(),
//                   Image.asset('assets/Flag.png', width: 28, height: 28),
//                   const SizedBox(width: 8),
//                   Row(
//                     children: const [
//                       Text(
//                         "English",
//                         style:
//                             TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                       ),
//                       Icon(Icons.keyboard_arrow_down, size: 20),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // -------------------------
//             // PROFILE INFO CARD
//             // -------------------------
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   const CircleAvatar(
//                     radius: 35,
//                     backgroundImage: AssetImage('assets/profile3.png'),
//                   ),
//                   const SizedBox(width: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         "Moni Roy",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "Admin",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF6B7180),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // -------------------------
//             // ADD MORE SETTINGS (OPTIONAL)
//             // -------------------------
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Account Settings",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     "Manage your account preferences and security settings.",
//                     style: TextStyle(fontSize: 14, color: Color(0xFF6B7180)),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------
            // LANGUAGES CARD
            // -------------------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Text(
                    "Languages",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Image.asset('assets/Flag.png', width: 28, height: 28),
                  const SizedBox(width: 8),
                  Row(
                    children: const [
                      Text(
                        "English",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 20),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------
            // PROFILE INFO CARD
            // -------------------------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/profile3.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Moni Roy",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Admin",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7180),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------
            // ACCOUNT SETTINGS CARD
            // -------------------------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Account Settings",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Manage your account preferences and security settings.",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6B7180)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // -------------------------
            // LOGOUT BUTTON
            // -------------------------
            GestureDetector(
              onTap: () {
                // Navigate to RoleSelectionScreen using GoRouter
                context.go('/role');
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4B00),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}


// ============================================================
// RESTAURANT INFO CARD
// ============================================================
Widget _restaurantInfoCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 12,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/restuarant_profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Mario's Italian Bistro",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Enter deal title...",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B7180),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        _fieldLabel("Restaurant Name"),
        _inputField("Mario's Italian Bistro"),
        const SizedBox(height: 12),

        _fieldLabel("Address"),
        _inputField("123 Main Street, Brambleton, VA"),
        const SizedBox(height: 12),

        _fieldLabel("Phone"),
        _inputField("(555) 123-4567"),
        const SizedBox(height: 12),

        _fieldLabel("Email"),
        _inputField("info@mariosbistro.com"),
        const SizedBox(height: 12),

        _fieldLabel("Description"),
        _multiLineInput("Authentic Italian cuisine with a modern twist"),
        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4B00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Save Changes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// ============================================================
// ACCOUNT SETTINGS CARD
// ============================================================
Widget _accountSettingsCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 12,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Account Settings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 18),

        _settingTile(
          title: "Email Notifications",
          subtitle: "Receive updates about your deals and analytics",
        ),
        const SizedBox(height: 12),

        _settingTile(
          title: "SMS Alerts",
          subtitle: "Get instant notifications for deal redemptions",
        ),
      ],
    ),
  );
}

// ============================================================
// COMPONENTS
// ============================================================
Widget _fieldLabel(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget _inputField(String hint) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    height: 44,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.grey.shade300),
    ),
    alignment: Alignment.centerLeft,
    child: Text(
      hint,
      style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
    ),
  );
}

Widget _multiLineInput(String hint) {
  return Container(
    padding: const EdgeInsets.all(14),
    height: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Text(
      hint,
      style: const TextStyle(color: Color(0xFF6B7180), fontSize: 14),
    ),
  );
}

Widget _settingTile({required String title, required String subtitle}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    decoration: BoxDecoration(
      color: const Color(0xFFF7F8FA),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: const Color(0xFFFF4B00),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
        ),
      ],
    ),
  );
}
