// import 'package:flutter/material.dart';

// class TopNavBar extends StatelessWidget {
//   const TopNavBar({super.key, required bool isWeb});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 38,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(19),
//               border: Border.all(color: Colors.grey.shade300, width: 0.6),
//             ),
//             child: Row(
//               children: const [
//                 Icon(Icons.search, color: Color(0xFF9DA6B0), size: 18),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'Search',
//                     style: TextStyle(color: Color(0xFF9DA6B0), fontSize: 14),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         Image.asset('assets/bell_icon.png', width: 28, height: 28),
//         const SizedBox(width: 20),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//           decoration: BoxDecoration(
//             color: const Color(0xFFF7F8FA),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               Image.asset('assets/Flag.png', width: 30, height: 30),
//               const SizedBox(width: 8),
//               const Text('English', style: TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
//               const SizedBox(width: 4),
//               const Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7180), size: 18),
//             ],
//           ),
//         ),
//         const SizedBox(width: 20),
//         Row(
//           children: [
//             CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/profile3.png')),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text('MoniRoy', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
//                 Text('Admin', style: TextStyle(fontSize: 11, color: Color(0xFF6B7180))),
//               ],
//             ),
//             const SizedBox(width: 4),
//             const Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF6B7180)),
//           ],
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class TopNavBar extends StatelessWidget {
//   const TopNavBar({super.key, required this.isWeb});
//   final bool isWeb;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // Search bar
//         Expanded(
//           child: Container(
//             height: 38,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(19),
//               border: Border.all(color: Colors.grey.shade300, width: 0.6),
//             ),
//             child: Row(
//               children: const [
//                 Icon(Icons.search, color: Color(0xFF9DA6B0), size: 18),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'Search',
//                     style: TextStyle(color: Color(0xFF9DA6B0), fontSize: 14),
//                     overflow: TextOverflow.ellipsis, // Prevent overflow
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),

//         const SizedBox(width: 12),

//         // Make right side scrollable if needed
//         Flexible(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 Image.asset('assets/bell_icon.png', width: 28, height: 28),
//                 const SizedBox(width: 20),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF7F8FA),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       Image.asset('assets/Flag.png', width: 30, height: 30),
//                       const SizedBox(width: 8),
//                       const Text('English', style: TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
//                       const SizedBox(width: 4),
//                       const Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7180), size: 18),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Row(
//                   children: [
//                     const CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/profile3.png')),
//                     const SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text('MoniRoy', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
//                         Text('Admin', style: TextStyle(fontSize: 11, color: Color(0xFF6B7180))),
//                       ],
//                     ),
//                     const SizedBox(width: 4),
//                     const Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF6B7180)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class TopNavBar extends StatelessWidget {
//   const TopNavBar({super.key, required this.isWeb});
//   final bool isWeb;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 78, top: 16, right: 20),
//       child: Row(
//         children: [
//           // ----------------------------
//           // FIXED SIZE SEARCH BAR ON WEB
//           // ----------------------------
//           if (isWeb)
//             Container(
//               width: 388,
//               height: 38,
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(19),
//                 border: Border.all(color: Colors.grey.shade300, width: 0.6),
//               ),
//               child: Row(
//                 children: const [
//                   Icon(Icons.search, color: Color(0xFF9DA6B0), size: 18),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       'Search',
//                       style: TextStyle(color: Color(0xFF9DA6B0), fontSize: 14),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//           // --------------------------------------
//           // EXPANDED SEARCH BAR ON MOBILE/TABLET
//           // --------------------------------------
//           if (!isWeb)
//             Expanded(
//               child: Container(
//                 height: 38,
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(19),
//                   border: Border.all(color: Colors.grey.shade300, width: 0.6),
//                 ),
//                 child: Row(
//                   children: const [
//                     Icon(Icons.search, color: Color(0xFF9DA6B0), size: 18),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         'Search',
//                         style: TextStyle(color: Color(0xFF9DA6B0), fontSize: 14),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//           const SizedBox(width: 12),

//           // --------------------------------
//           // RIGHT SIDE — NOW NO EXTRA SPACE
//           // --------------------------------
//           Flexible(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Image.asset('assets/bell_icon.png', width: 28, height: 28),
//                 const SizedBox(width: 20),

//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF7F8FA),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       Image.asset('assets/Flag.png', width: 30, height: 30),
//                       const SizedBox(width: 8),
//                       const Text('English', style: TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
//                       const SizedBox(width: 4),
//                       const Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7180), size: 18),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(width: 20),

//                 Row(
//                   children: [
//                     const CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/profile3.png')),
//                     const SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text('MoniRoy',
//                             style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
//                         Text('Admin', style: TextStyle(fontSize: 11, color: Color(0xFF6B7180))),
//                       ],
//                     ),
//                     const SizedBox(width: 4),
//                     const Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF6B7180)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class TopNavBar extends StatelessWidget {
//   const TopNavBar({super.key, required this.isWeb});
//   final bool isWeb;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal, // horizontal scroll
//         child: Row(
//           children: [
//             // ----------------------------
//             // SEARCH BAR
//             // ----------------------------
//             Container(
//               width: isWeb ? 388 : 220, // fixed for web, smaller for mobile
//               height: 38,
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(19),
//                 border: Border.all(color: Colors.grey.shade300, width: 0.6),
//               ),
//               child: Row(
//                 children: const [
//                   Icon(Icons.search, color: Color(0xFF9DA6B0), size: 18),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       'Search',
//                       style: TextStyle(color: Color(0xFF9DA6B0), fontSize: 14),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(width: 16),

//             // ----------------------------
//             // RIGHT SIDE ITEMS
//             // ----------------------------
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset('assets/bell_icon.png', width: 28, height: 28),
//                 const SizedBox(width: 16),

//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF7F8FA),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       Image.asset('assets/Flag.png', width: 24, height: 24),
//                       const SizedBox(width: 6),
//                       const Text('English',
//                           style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
//                       const Icon(Icons.keyboard_arrow_down,
//                           color: Color(0xFF6B7180), size: 18),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 16),

//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const CircleAvatar(
//                         radius: 20, backgroundImage: AssetImage('assets/profile3.png')),
//                     const SizedBox(width: 8),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text('MoniRoy',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black)),
//                         Text('Admin',
//                             style: TextStyle(fontSize: 10, color: Color(0xFF6B7180))),
//                       ],
//                     ),
//                     const SizedBox(width: 4),
//                     const Icon(Icons.keyboard_arrow_down,
//                         size: 18, color: Color(0xFF6B7180)),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class TopNavBar extends StatelessWidget {
//   const TopNavBar({super.key, required this.isWeb});
//   final bool isWeb;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       child: isWeb
//           ? Row(
//               children: [
//                 // ----------------------------
//                 // SEARCH BAR (fixed width on web)
//                 // ----------------------------
//                 Container(
//                   width: 388,
//                   height: 38,
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(19),
//                     border: Border.all(color: Colors.grey.shade300, width: 0.6),
//                   ),
//                   child: Row(
//                     children: const [
//                       Icon(Icons.search, color: Color(0xFF9DA6B0), size: 18),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           'Search',
//                           style: TextStyle(color: Color(0xFF9DA6B0), fontSize: 14),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const Spacer(), // push right items to end

//                 // ----------------------------
//                 // RIGHT SIDE ITEMS
//                 // ----------------------------
//                 _rightSideItems(),
//               ],
//             )
//           : SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   // ----------------------------
//                   // SEARCH BAR (mobile expands)
//                   // ----------------------------
//                   Container(
//                     width: screenWidth * 0.5, // takes half width
//                     constraints: const BoxConstraints(maxWidth: 300),
//                     height: 38,
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(19),
//                       border: Border.all(color: Colors.grey.shade300, width: 0.6),
//                     ),
//                     child: Row(
//                       children: const [
//                         Icon(Icons.search, color: Color(0xFF9DA6B0), size: 18),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             'Search',
//                             style: TextStyle(color: Color(0xFF9DA6B0), fontSize: 14),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(width: 16),

//                   // ----------------------------
//                   // RIGHT SIDE ITEMS
//                   // ----------------------------
//                   _rightSideItems(),
//                 ],
//               ),
//             ),
//     );
//   }

//   // Right side icons & profile
//   Widget _rightSideItems() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Image.asset('assets/bell_icon.png', width: 28, height: 28),
//         const SizedBox(width: 16),

//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//           decoration: BoxDecoration(
//             color: const Color(0xFFF7F8FA),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               Image.asset('assets/Flag.png', width: 30, height: 30),
//               const SizedBox(width: 6),
//               const Text('English',
//                   style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
//               const Icon(Icons.keyboard_arrow_down,
//                   color: Color(0xFF6B7180), size: 18),
//             ],
//           ),
//         ),
//         const SizedBox(width: 16),

//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const CircleAvatar(
//                 radius: 20, backgroundImage: AssetImage('assets/profile3.png')),
//             const SizedBox(width: 8),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text('MoniRoy',
//                     style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black)),
//                 Text('Admin',
//                     style: TextStyle(fontSize: 10, color: Color(0xFF6B7180))),
//               ],
//             ),
//             const SizedBox(width: 4),
//             const Icon(Icons.keyboard_arrow_down,
//                 size: 18, color: Color(0xFF6B7180)),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isWeb;

  const TopNavBar({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,

      // 🔥 NO PADDING OUTSIDE — FULL EDGE ATTACHMENT
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            color: Colors.black12,
            offset: Offset(0, 1),
          )
        ],
      ),

      // 🔥 INTERNAL PADDING ONLY (Does not create outside gap)
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        children: [
          // ----------------------------
          // Search Box
          // ----------------------------
          Container(
            width: isWeb ? 380 : MediaQuery.of(context).size.width * 0.55,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 18, color: Color(0xFF9DA6B0)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      isCollapsed: true,
                      hintStyle: TextStyle(
                        color: Color(0xFF9DA6B0),
                        fontSize: 14,
                      ),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // ----------------------------
          // Notification Bell
          // ----------------------------
          Image.asset('assets/bell_icon.png', width: 26, height: 26),
          const SizedBox(width: 20),

          // ----------------------------
          // Language box
          // ----------------------------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset('assets/Flag.png', width: 26, height: 26),
                const SizedBox(width: 6),
                const Text(
                  "English",
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7180)),
                ),
                const Icon(Icons.keyboard_arrow_down,
                    size: 18, color: Color(0xFF6B7180)),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // ----------------------------
          // Profile Row
          // ----------------------------
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/profile3.png'),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Moni Roy",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF6B7180),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 6),
              const Icon(Icons.keyboard_arrow_down,
                  size: 20, color: Color(0xFF6B7180)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

