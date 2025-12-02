
// import 'dart:math';
// import 'package:flutter/material.dart';

// class RestaurantDashboardScreen extends StatelessWidget {
//   const RestaurantDashboardScreen({super.key});

//   // --- Styling constants
//   static const Color scaffoldBg = Color(0xFFEEEEF0); // subtle background around card area
//   static const Color pageBg = Color(0xFF555355); // outer frame (we'll simulate as margin)
//   static const Color leftBarBg = Colors.white;
//   static const Color accentOrange = Color(0xFFFF6B00);
//   static const Color cardBg = Colors.white;
//   static const Color mutedText = Color(0xFF6B7180);
//   static const double pageHorizontalPadding = 20.0;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final isWeb = width >= 1000;
//     final isTablet = width >= 600 && width < 1000;

//     return Scaffold(
//       backgroundColor: pageBg,
//       body: SafeArea(
//         child: Container(
//           color: pageBg,
//           child: Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 1200),
//               child: Container(
//                 color: scaffoldBg,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     if (isWeb || isTablet)
//                       _LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),
//                     // Make main content scrollable
//                     Expanded(
//                       child: SingleChildScrollView(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: pageHorizontalPadding, vertical: 18),
//                         child: _MainContent(isWeb: isWeb, isTablet: isTablet),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       drawer: !isWeb && !isTablet
//           ? Drawer(child: _LeftSidebar(width: 240, showLabels: true))
//           : null,
//     );
//   }
// }

// /* ----------------------- LEFT SIDEBAR ----------------------- */

// class _LeftSidebar extends StatelessWidget {
//   final double width;
//   final bool showLabels;

//   const _LeftSidebar({required this.width, required this.showLabels});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Asset image at top, horizontal padding only
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40.0),
//             child: Image.asset(
//               'assets/splash1.png',
//               width: 80,  // adjust size as needed
//               height: 80, // adjust size as needed
//               fit: BoxFit.contain,
//             ),
//           ),

//           const SizedBox(height: 12), // small gap between image and menu

//           // Menu items
//           _menuTile(Icons.dashboard_outlined, "Dashboard", showLabels, true),
//           const SizedBox(height: 6),
//           _menuTile(Icons.add_box_outlined, "Add Deal", showLabels, false),
//           const SizedBox(height: 6),
//           _menuTile(Icons.video_collection_outlined, "Upload Video", showLabels, false),
//           const SizedBox(height: 6),
//           _menuTile(Icons.bar_chart_outlined, "Analytics", showLabels, false),
//           const SizedBox(height: 6),
//           _menuTile(Icons.person_outline, "Profile", showLabels, false),
//         ],
//       ),
//     );
//   }

//   Widget _menuTile(IconData icon, String label, bool showLabel, bool active) {
//     const Color selectedColor = Color(0xFFFF4B00);
//     const double horizontalSpacing = 12.0; // space on both sides of menu item

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
//       child: Container(
//         decoration: active
//             ? BoxDecoration(
//                 color: selectedColor,
//                 borderRadius: BorderRadius.circular(8),
//               )
//             : null,
//         child: ListTile(
//           leading: Icon(icon, color: active ? Colors.white : const Color(0xFF727272)),
//           title: showLabel
//               ? Text(
//                   label,
//                   style: TextStyle(color: active ? Colors.white : const Color(0xFF727272)),
//                 )
//               : null,
//           dense: true,
//           horizontalTitleGap: 6,
//         ),
//       ),
//     );
//   }
// }


// /* ----------------------- MAIN CONTENT ----------------------- */
// class _MainContent extends StatelessWidget {
//   final bool isWeb;
//   final bool isTablet;
//   const _MainContent({required this.isWeb, required this.isTablet});

//   @override
//   Widget build(BuildContext context) {
//     // Sample chart data
//     final List<double> points = [10,28,40,35,60,48,70,45,65,80,60,70,50,60];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text('Dashboard', style: TextStyle(fontSize: isWeb ? 24 : 20, fontWeight: FontWeight.w700)),
//             const SizedBox(width: 14),
//             Expanded(child: _SearchBox(isWeb: isWeb)),
//             const SizedBox(width: 10),
//             IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Color(0xFF6B7180))),
//             const SizedBox(width: 6),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
//               child: Row(children: const [
//                 Icon(Icons.flag, size: 16, color: Color(0xFF6B7180)),
//                 SizedBox(width: 6),
//                 Text('English', style: TextStyle(color: Color(0xFF6B7180), fontSize: 13)),
//               ]),
//             ),
//             const SizedBox(width: 12),
//             CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/splash1.png')),
//           ],
//         ),
//         const SizedBox(height: 18),
//         _MetricsRow(isWeb: isWeb, isTablet: isTablet),
//         const SizedBox(height: 20),
//         // Active Deals
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//           ),
//           padding: const EdgeInsets.all(18),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Active Deals', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//               const SizedBox(height: 12),
//               Column(
//                 children: [
//                   _DealRow(title: '20% Off Burgers', subtitle: 'Get 20% off all burgers meals', expiry: 'Expires: 2025-08-15', views: '1250 views', redeemed: '86 redeemed'),
//                   _DealRow(title: '20% Off Pizza', subtitle: 'Get 15% off pizza combos', expiry: 'Expires: 2025-08-20', views: '980 views', redeemed: '72 redeemed'),
//                   _DealRow(title: 'Buy 1 Get 1 Free', subtitle: 'Special on fries', expiry: 'Expires: 2025-08-25', views: '450 views', redeemed: '34 redeemed'),
//                 ],
//               )
//             ],
//           ),
//         ),
//         const SizedBox(height: 22),
//         // Sales Chart
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(18),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(children: [
//                 Text('Sales Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//                 const Spacer(),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   decoration: BoxDecoration(color: const Color(0xFFF7F8FA), borderRadius: BorderRadius.circular(8)),
//                   child: Row(children: const [Text('October', style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))), Icon(Icons.keyboard_arrow_down, size: 18, color: Color(0xFF6B7180))]),
//                 ),
//               ]),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 260,
//                 child: CustomPaint(
//                   painter: _SalesPainter(points),
//                   child: Container(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
// }

// /* ----------------------- SEARCH BOX ----------------------- */
// class _SearchBox extends StatelessWidget {
//   final bool isWeb;
//   const _SearchBox({required this.isWeb});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 42,
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
//       child: Row(children: [
//         const Icon(Icons.search, color: Color(0xFF9DA6B0)),
//         const SizedBox(width: 10),
//         Expanded(child: Text('Search', style: TextStyle(color: const Color(0xFF9DA6B0), fontSize: isWeb ? 14 : 12))),
//       ]),
//     );
//   }
// }

// /* ----------------------- METRICS ROW ----------------------- */
// class _MetricsRow extends StatelessWidget {
//   final bool isWeb;
//   final bool isTablet;
//   const _MetricsRow({required this.isWeb, required this.isTablet});

//   @override
//   Widget build(BuildContext context) {
//     final spacing = 14.0;
//     final cards = [
//       _MetricCard(title: 'Active Deals', value: '200', foot: '8.5% Up from yesterday', accent: const Color(0xFF6D66FF), icon: Icons.local_offer_outlined),
//       _MetricCard(title: 'Total Views', value: '10293', foot: '1.3% Up from past week', accent: const Color(0xFFFFD166), icon: Icons.remove_red_eye_outlined),
//       _MetricCard(title: 'Redemptions', value: '200', foot: '4.3% Down from yesterday', accent: const Color(0xFF9DE0B6), icon: Icons.redeem_outlined),
//       _MetricCard(title: 'Conversion Rate', value: '6.8%', foot: '1.8% Up from yesterday', accent: const Color(0xFFFFC4BB), icon: Icons.pie_chart_outline),
//     ];

//     if (isWeb) {
//       return Row(
//         children: [
//           for (int i = 0; i < cards.length; i++)
//             Expanded(child: Padding(padding: EdgeInsets.only(left: i == 0 ? 0 : spacing), child: cards[i])),
//         ],
//       );
//     } else {
//       return Wrap(
//         spacing: spacing,
//         runSpacing: spacing,
//         children: cards.map((c) => SizedBox(width: MediaQuery.of(context).size.width / (isTablet ? 2.2 : 1.05), child: c)).toList(),
//       );
//     }
//   }
// }

// class _MetricCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final String foot;
//   final Color accent;
//   final IconData icon;

//   const _MetricCard({required this.title, required this.value, this.foot = '', required this.accent, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 0),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: RestaurantDashboardScreen.cardBg,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 6))],
//       ),
//       child: Row(children: [
//         Container(
//           decoration: BoxDecoration(color: accent.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
//           padding: const EdgeInsets.all(10),
//           child: Icon(icon, color: accent, size: 20),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(title, style: const TextStyle(color: Color(0xFF6B7180), fontSize: 13)),
//             const SizedBox(height: 6),
//             Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
//             const SizedBox(height: 6),
//             Text(foot, style: const TextStyle(color: Color(0xFF3AA374), fontSize: 12)),
//           ]),
//         ),
//       ]),
//     );
//   }
// }

// /* ----------------------- ACTIVE DEAL ROW ----------------------- */
// class _DealRow extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String expiry;
//   final String views;
//   final String redeemed;

//   const _DealRow({required this.title, required this.subtitle, required this.expiry, required this.views, required this.redeemed});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       decoration: BoxDecoration(color: const Color(0xFFF6F9FB), borderRadius: BorderRadius.circular(8)),
//       child: Row(children: [
//         Expanded(
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
//             const SizedBox(height: 6),
//             Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
//             const SizedBox(height: 8),
//             Text(expiry, style: const TextStyle(fontSize: 12, color: Color(0xFF9DA6B0))),
//           ]),
//         ),
//         Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//           Text(views, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF23303B))),
//           const SizedBox(height: 6),
//           Text(redeemed, style: const TextStyle(fontSize: 12, color: Color(0xFF3AA374))),
//         ])
//       ]),
//     );
//   }
// }

// /* ----------------------- SALES CHART ----------------------- */
// class _SalesPainter extends CustomPainter {
//   final List<double> pts;
//   _SalesPainter(this.pts);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final w = size.width;
//     final h = size.height;
//     final leftPadding = 36.0;
//     final rightPadding = 18.0;
//     final topPadding = 18.0;
//     final bottomPadding = 28.0;
//     final chartW = w - leftPadding - rightPadding;
//     final chartH = h - topPadding - bottomPadding;

//     final gridPaint = Paint()..color = const Color(0xFFEDF0F3);
//     for (int i = 0; i <= 5; i++) {
//       final y = topPadding + (chartH / 5) * i;
//       canvas.drawLine(Offset(leftPadding, y), Offset(leftPadding + chartW, y), gridPaint);
//     }

//     if (pts.isEmpty) return;

//     final maxV = pts.reduce(max);
//     final minV = pts.reduce(min);
//     final range = (maxV - minV) == 0 ? 1 : (maxV - minV);

//     final path = Path();
//     final points = <Offset>[];
//     for (int i = 0; i < pts.length; i++) {
//       final x = leftPadding + (chartW) * (i / (pts.length - 1));
//       final norm = (pts[i] - minV) / range;
//       final y = topPadding + chartH - (norm * chartH);
//       points.add(Offset(x, y));
//       if (i == 0) path.moveTo(x, y);
//       path.lineTo(x, y);
//     }

//     final fillPath = Path.from(path)
//       ..lineTo(leftPadding + chartW, topPadding + chartH)
//       ..lineTo(leftPadding, topPadding + chartH)
//       ..close();

//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     final shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
//       Color(0x33FF6B00),
//       Color(0x00FF6B00),
//     ]).createShader(rect);
//     final fillPaint = Paint()..shader = shader;
//     canvas.drawPath(fillPath, fillPaint);

//     final stroke = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.6
//       ..color = const Color(0xFFFF6B00)
//       ..strokeCap = StrokeCap.round;
//     canvas.drawPath(path, stroke);

//     final dotPaint = Paint()..color = const Color(0xFFFF6B00);
//     for (final p in points) {
//       canvas.drawCircle(p, 3.6, dotPaint);
//     }

//     final maxIndex = pts.indexOf(maxV);
//     if (maxIndex >= 0 && maxIndex < points.length) {
//       final p = points[maxIndex];
//       final txt = '${maxV.toStringAsFixed(0)}';
//       final tp = _textPainter(txt, 11, Colors.white);
//       final rectWidth = tp.width + 12;
//       final rectHeight = tp.height + 8;
//       final rectLeft = (p.dx - rectWidth / 2).clamp(leftPadding, leftPadding + chartW - rectWidth);
//       final rectTop = p.dy - rectHeight - 10;
//       final rrect = RRect.fromRectAndRadius(Rect.fromLTWH(rectLeft, rectTop, rectWidth, rectHeight), const Radius.circular(6));
//       final paintBox = Paint()..color = RestaurantDashboardScreen.accentOrange;
//       canvas.drawRRect(rrect, paintBox);
//       tp.paint(canvas, Offset(rectLeft + 6, rectTop + 4));
//     }

//     final labelStyle = TextStyle(color: const Color(0xFF9DA6B0), fontSize: 11);
//     final ticks = 5;
//     for (int i = 0; i <= ticks; i++) {
//       final x = leftPadding + (chartW / ticks) * i;
//       final lbl = '${(i * 10).toString()}k';
//       final tp = TextPainter(text: TextSpan(text: lbl, style: labelStyle), textDirection: TextDirection.ltr);
//       tp.layout();
//       tp.paint(canvas, Offset(x - tp.width / 2, topPadding + chartH + 8));
//     }
//   }

//   TextPainter _textPainter(String s, double size, Color color) {
//     final tp = TextPainter(text: TextSpan(text: s, style: TextStyle(color: color, fontSize: size, fontWeight: FontWeight.w600)), textDirection: TextDirection.ltr);
//     tp.layout();
//     return tp;
//   }

//   @override
//   bool shouldRepaint(covariant _SalesPainter old) => old.pts != pts;
// }
// import 'dart:math';
// import 'package:flutter/material.dart';

// class RestaurantDashboardScreen extends StatelessWidget {
//   const RestaurantDashboardScreen({super.key});

//   // --- Styling constants
//   static const Color scaffoldBg = Color(0xFFEEEEF0); // subtle background around card area
//   static const Color pageBg = Color(0xFF555355); // outer frame (we'll simulate as margin)
//   static const Color leftBarBg = Colors.white;
//   static const Color accentOrange = Color(0xFFFF6B00);
//   static const Color cardBg = Colors.white;
//   static const Color mutedText = Color(0xFF6B7180);
//   static const double pageHorizontalPadding = 20.0;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final isWeb = width >= 1000;
//     final isTablet = width >= 600 && width < 1000;

//     return Scaffold(
//       backgroundColor: pageBg,
//       body: SafeArea(
//         child: Container(
//           color: pageBg,
//           child: Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 1200),
//               child: Container(
//                 color: scaffoldBg,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     if (isWeb || isTablet)
//                       _LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),
//                     // Make main content scrollable
//                     Expanded(
//                       child: SingleChildScrollView(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: pageHorizontalPadding, vertical: 18),
//                         child: _MainContent(isWeb: isWeb, isTablet: isTablet),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       drawer: !isWeb && !isTablet
//           ? Drawer(child: _LeftSidebar(width: 240, showLabels: true))
//           : null,
//     );
//   }
// }

// /* ----------------------- LEFT SIDEBAR ----------------------- */

// class _LeftSidebar extends StatelessWidget {
//   final double width;
//   final bool showLabels;

//   const _LeftSidebar({required this.width, required this.showLabels});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40.0),
//             child: Image.asset(
//               'assets/splash1.png',
//               width: 80,
//               height: 80,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 12),
//           _menuTile(Icons.dashboard_outlined, "Dashboard", showLabels, true),
//           const SizedBox(height: 6),
//           _menuTile(Icons.add_box_outlined, "Add Deal", showLabels, false),
//           const SizedBox(height: 6),
//           _menuTile(Icons.video_collection_outlined, "Upload Video", showLabels, false),
//           const SizedBox(height: 6),
//           _menuTile(Icons.bar_chart_outlined, "Analytics", showLabels, false),
//           const SizedBox(height: 6),
//           _menuTile(Icons.person_outline, "Profile", showLabels, false),
//         ],
//       ),
//     );
//   }

//   Widget _menuTile(IconData icon, String label, bool showLabel, bool active) {
//     const Color selectedColor = Color(0xFFFF4B00);
//     const double horizontalSpacing = 12.0;

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
//       child: Container(
//         decoration: active
//             ? BoxDecoration(
//                 color: selectedColor,
//                 borderRadius: BorderRadius.circular(8),
//               )
//             : null,
//         child: ListTile(
//           leading: Icon(icon, color: active ? Colors.white : const Color(0xFF727272)),
//           title: showLabel
//               ? Text(
//                   label,
//                   style: TextStyle(color: active ? Colors.white : const Color(0xFF727272)),
//                 )
//               : null,
//           dense: true,
//           horizontalTitleGap: 6,
//         ),
//       ),
//     );
//   }
// }

// /* ----------------------- MAIN CONTENT ----------------------- */
// class _MainContent extends StatelessWidget {
//   final bool isWeb;
//   final bool isTablet;
//   const _MainContent({required this.isWeb, required this.isTablet});

//   @override
//   Widget build(BuildContext context) {
//     final List<double> points = [10, 28, 40, 35, 60, 48, 70, 45, 65, 80, 60, 70, 50, 60];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
      
//         /* ----------------------- TOP NAV BAR ----------------------- */
//   Row(
//   children: [
//     // ---------- SEARCH BAR ----------
//     Container(
//       width: 388,
//       height: 38,
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(19),
//         border: Border.all(color: Colors.grey.shade300, width: 0.6),
//       ),
//       child: Row(
//         children: const [
//           Icon(Icons.search, color: Color(0xFF9DA6B0), size: 18),
//           SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               'Search',
//               style: TextStyle(color: Color(0xFF9DA6B0), fontSize: 14),
//             ),
//           ),
//         ],
//       ),
//     ),

//     const Spacer(),

//     // ---------- BELL ICON WITH BADGE ----------
//     Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Image.asset(
//           'assets/bell_icon.png',
//           width: 28,
//           height: 28,
//         ),
//       ],
//     ),
//     const SizedBox(width: 20),

//     // ---------- FLAG + ENGLISH DROPDOWN ----------
//     Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           Image.asset('assets/Flag.png', width: 26, height: 26),
//           const SizedBox(width: 8),
//           const Text(
//             'English',
//             style: TextStyle(fontSize: 13, color: Color(0xFF6B7180)),
//           ),
//           const SizedBox(width: 4),
//           const Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7180), size: 18),
//         ],
//       ),
//     ),
//     const SizedBox(width: 20),

//     // ---------- PROFILE + NAME + ROLE ----------
//     Row(
//       children: [
//         CircleAvatar(
//           radius: 20,
//           backgroundImage: AssetImage('assets/profile3.png'),
//         ),
//         const SizedBox(width: 10),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text(
//               'MoniRoy',
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//             Text(
//               'Admin',
//               style: TextStyle(
//                 fontSize: 11,
//                 color: Color(0xFF6B7180),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(width: 4),
//         const Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF6B7180)),
//       ],
//     ),
//   ],
// ),

//         const SizedBox(height: 20),
//         // Big Dashboard Title
//         Text('Dashboard', style: TextStyle(fontSize: isWeb ? 28 : 24, fontWeight: FontWeight.w700)),
//         const SizedBox(height: 18),
//         _MetricsRow(isWeb: isWeb, isTablet: isTablet),
//         const SizedBox(height: 20),
//         // Active Deals
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//           ),
//           padding: const EdgeInsets.all(18),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Active Deals', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//               const SizedBox(height: 12),
//               Column(
//                 children: [
//                   _DealRow(title: '20% Off Burgers', subtitle: 'Get 20% off all burgers meals', expiry: 'Expires: 2025-08-15', views: '1250 views', redeemed: '86 redeemed'),
//                   _DealRow(title: '20% Off Pizza', subtitle: 'Get 15% off pizza combos', expiry: 'Expires: 2025-08-20', views: '980 views', redeemed: '72 redeemed'),
//                   _DealRow(title: 'Buy 1 Get 1 Free', subtitle: 'Special on fries', expiry: 'Expires: 2025-08-25', views: '450 views', redeemed: '34 redeemed'),
//                 ],
//               )
//             ],
//           ),
//         ),
//         const SizedBox(height: 22),
//         // Sales Chart
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(18),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(children: [
//                 Text('Sales Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//                 const Spacer(),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   decoration: BoxDecoration(color: const Color(0xFFF7F8FA), borderRadius: BorderRadius.circular(8)),
//                   child: Row(children: const [Text('October', style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))), Icon(Icons.keyboard_arrow_down, size: 18, color: Color(0xFF6B7180))]),
//                 ),
//               ]),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 260,
//                 child: CustomPaint(
//                   painter: _SalesPainter(points),
//                   child: Container(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
// }

// /* ----------------------- SEARCH BOX ----------------------- */
// class _SearchBox extends StatelessWidget {
//   final bool isWeb;
//   const _SearchBox({required this.isWeb});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 42,
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
//       child: Row(children: [
//         const Icon(Icons.search, color: Color(0xFF9DA6B0)),
//         const SizedBox(width: 10),
//         Expanded(child: Text('Search', style: TextStyle(color: const Color(0xFF9DA6B0), fontSize: isWeb ? 14 : 12))),
//       ]),
//     );
//   }
// }

// /* ----------------------- METRICS ROW ----------------------- */
// class _MetricsRow extends StatelessWidget {
//   final bool isWeb;
//   final bool isTablet;
//   const _MetricsRow({required this.isWeb, required this.isTablet});

//   @override
//   Widget build(BuildContext context) {
//     final spacing = 14.0;
//     final cards = [
//       _MetricCard(title: 'Active Deals', value: '200', foot: '8.5% Up from yesterday', accent: const Color(0xFF8280FF), icon: Icons.local_offer_outlined),
//       _MetricCard(title: 'Total Views', value: '10293', foot: '1.3% Up from past week', accent: const Color(0xFFFEC53D), icon: Icons.remove_red_eye_outlined),
//       _MetricCard(title: 'Redemptions', value: '200', foot: '4.3% Down from yesterday', accent: const Color(0xFF4AD991), icon: Icons.redeem_outlined),
//       _MetricCard(title: 'Conversion Rate', value: '6.8%', foot: '1.8% Up from yesterday', accent: const Color(0xFFFF9066), icon: Icons.pie_chart_outline),
//     ];

//     if (isWeb) {
//       return Row(
//         children: [
//           for (int i = 0; i < cards.length; i++)
//             Expanded(child: Padding(padding: EdgeInsets.only(left: i == 0 ? 0 : spacing), child: cards[i])),
//         ],
//       );
//     } else {
//       return Wrap(
//         spacing: spacing,
//         runSpacing: spacing,
//         children: cards.map((c) => SizedBox(width: MediaQuery.of(context).size.width / (isTablet ? 2.2 : 1.05), child: c)).toList(),
//       );
//     }
//   }
// }
//   class _MetricCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final String foot;
//   final Color accent;
//   final IconData icon;

//   const _MetricCard({
//     required this.title,
//     required this.value,
//     required this.foot,
//     required this.accent,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: RestaurantDashboardScreen.cardBg,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.03),
//             blurRadius: 8,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//           // LEFT SIDE — Text content
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: const TextStyle(
//                       color: Color(0xFF6B7180),
//                       fontSize: 13,
//                     )),
//                 const SizedBox(height: 6),
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   foot,
//                   style: const TextStyle(
//                     color: Color(0xFF3AA374),
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(width: 12),

//           // RIGHT SIDE — Icon
//           Container(
//             decoration: BoxDecoration(
//               color: accent.withOpacity(0.12),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: const EdgeInsets.all(10),
//             child: Icon(icon, color: accent, size: 22),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- ACTIVE DEAL ROW ----------------------- */
// class _DealRow extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String expiry;
//   final String views;
//   final String redeemed;

//   const _DealRow({required this.title, required this.subtitle, required this.expiry, required this.views, required this.redeemed});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       decoration: BoxDecoration(color: const Color(0xFFF6F9FB), borderRadius: BorderRadius.circular(8)),
//       child: Row(children: [
//         Expanded(
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
//             const SizedBox(height: 6),
//             Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
//             const SizedBox(height: 8),
//             Text(expiry, style: const TextStyle(fontSize: 12, color: Color(0xFF9DA6B0))),
//           ]),
//         ),
//         Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//           Text(views, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF23303B))),
//           const SizedBox(height: 6),
//           Text(redeemed, style: const TextStyle(fontSize: 12, color: Color(0xFF3AA374))),
//         ])
//       ]),
//     );
//   }
// }

// // /* ----------------------- SALES CHART ----------------------- */
// class _SalesPainter extends CustomPainter {
//   final List<double> pts;
//   _SalesPainter(this.pts);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final w = size.width;
//     final h = size.height;

//     const leftPadding = 45.0;
//     const rightPadding = 20.0;
//     const topPadding = 25.0;
//     const bottomPadding = 35.0;

//     final chartW = w - leftPadding - rightPadding;
//     final chartH = h - topPadding - bottomPadding;

//     /* -------------------- LEFT Y-AXIS (20%-100%) -------------------- */
//     const yLabels = ["100%", "80%", "60%", "40%", "20%"];
//     const yLines = 5;

//     final labelStyle = TextStyle(
//       color: Color(0xFF9DA6B0),
//       fontSize: 11,
//     );

//     final gridPaint = Paint()
//       ..color = const Color(0xFFE8EBEF)
//       ..strokeWidth = 1;

//     for (int i = 0; i < yLines; i++) {
//       final y = topPadding + (chartH / (yLines - 1)) * i;

//       canvas.drawLine(
//         Offset(leftPadding, y),
//         Offset(leftPadding + chartW, y),
//         gridPaint,
//       );

//       final tp = TextPainter(
//         text: TextSpan(text: yLabels[i], style: labelStyle),
//         textDirection: TextDirection.ltr,
//       )..layout();

//       tp.paint(canvas, Offset(leftPadding - tp.width - 8, y - tp.height / 2));
//     }

//     if (pts.isEmpty) return;

//     /* -------------------- NORMALIZE VALUES -------------------- */
//     final maxV = pts.reduce(max);
//     final minV = pts.reduce(min);
//     final range = (maxV - minV == 0) ? 1 : maxV - minV;

//     List<Offset> points = [];

//     for (int i = 0; i < pts.length; i++) {
//       final x = leftPadding + chartW * (i / (pts.length - 1));
//       final norm = (pts[i] - minV) / range;
//       final y = topPadding + chartH - (norm * chartH);
//       points.add(Offset(x, y));
//     }

//     /* -------------------- CATMULL–ROM CURVE (Smooth) -------------------- */
//     Path curve = Path();
//     curve.moveTo(points.first.dx, points.first.dy);

//     for (int i = 0; i < points.length - 1; i++) {
//       final p0 = i == 0 ? points[i] : points[i - 1];
//       final p1 = points[i];
//       final p2 = points[i + 1];
//       final p3 = i + 2 < points.length ? points[i + 2] : points[i + 1];

//       for (double t = 0; t < 1; t += 0.05) {
//         final tt = t * t;
//         final ttt = tt * t;

//         double x = 0.5 *
//             ((2 * p1.dx) +
//                 (-p0.dx + p2.dx) * t +
//                 (2 * p0.dx - 5 * p1.dx + 4 * p2.dx - p3.dx) * tt +
//                 (-p0.dx + 3 * p1.dx - 3 * p2.dx + p3.dx) * ttt);

//         double y = 0.5 *
//             ((2 * p1.dy) +
//                 (-p0.dy + p2.dy) * t +
//                 (2 * p0.dy - 5 * p1.dy + 4 * p2.dy - p3.dy) * tt +
//                 (-p0.dy + 3 * p1.dy - 3 * p2.dy + p3.dy) * ttt);

//         curve.lineTo(x, y);
//       }
//     }

//     /* -------------------- FILL GRADIENT -------------------- */
//     Path fillPath = Path.from(curve)
//       ..lineTo(points.last.dx, topPadding + chartH)
//       ..lineTo(points.first.dx, topPadding + chartH)
//       ..close();

//     final gradient = const LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [
//         Color(0x33FF6B00),
//         Color(0x00FF6B00),
//       ],
//     ).createShader(Rect.fromLTWH(0, 0, w, h));

//     canvas.drawPath(fillPath, Paint()..shader = gradient);

//     /* -------------------- ORANGE LINE -------------------- */
//     final stroke = Paint()
//       ..color = const Color(0xFFFF6B00)
//       ..strokeWidth = 2.4
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     canvas.drawPath(curve, stroke);

//     /* -------------------- DOTS -------------------- */
//     final dotPaint = Paint()..color = const Color(0xFFFF6B00);

//     for (final p in points) {
//       canvas.drawCircle(p, 4, dotPaint);
//     }

//     /* -------------------- TOOLTIP ON MAX POINT -------------------- */
//     final maxIndex = pts.indexOf(maxV);
//     final maxPoint = points[maxIndex];

//     final tooltipText = maxV.toStringAsFixed(2);

//     final tp = TextPainter(
//       text: TextSpan(
//         text: tooltipText,
//         style: TextStyle(
//           fontSize: 11,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     )..layout();

//     final boxW = tp.width + 16;
//     final boxH = tp.height + 10;

//     final tx = (maxPoint.dx - boxW / 2)
//         .clamp(leftPadding, leftPadding + chartW - boxW);
//     final ty = maxPoint.dy - boxH - 12;

//     canvas.drawRRect(
//       RRect.fromRectAndRadius(
//         Rect.fromLTWH(tx, ty, boxW, boxH),
//         const Radius.circular(6),
//       ),
//       Paint()..color = const Color(0xFFFF6B00),
//     );

//     tp.paint(canvas, Offset(tx + 8, ty + 5));

//     /* -------------------- X-AXIS LABELS (5k → 60k) -------------------- */

//     const xLabels = [
//       "5k", "10k", "15k", "20k", "25k", "30k", "35k",
//       "40k", "45k", "50k", "55k", "60k"
//     ];

//     for (int i = 0; i < xLabels.length; i++) {
//       final x = leftPadding + (chartW / (xLabels.length - 1)) * i;

//       final tp2 = TextPainter(
//         text: TextSpan(text: xLabels[i], style: labelStyle),
//         textDirection: TextDirection.ltr,
//       )..layout();

//       tp2.paint(
//         canvas,
//         Offset(x - tp2.width / 2, topPadding + chartH + 10),
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _SalesPainter old) => old.pts != pts;
// }
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class RestaurantDashboardScreen extends StatelessWidget {
//   const RestaurantDashboardScreen({super.key});

//   // --- Styling constants
//   static const Color scaffoldBg =Colors.white;
//   static const Color pageBg = Colors.white;
//   static const Color leftBarBg = Colors.white;
//   static const Color accentOrange = Color(0xFFFF6B00);
//   static const Color cardBg = Colors.white;
//   static const Color mutedText = Color(0xFF6B7180);
//   static const double pageHorizontalPadding = 20.0;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isWeb = width >= 1000;
//     final isTablet = width >= 600 && width < 1000;

//     return Scaffold(
//       backgroundColor: pageBg,
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: _SearchBox(isWeb: false),
//             )
//           : null,
//       drawer: (!isWeb && !isTablet)
//           ? Drawer(child: _LeftSidebar(width: 240, showLabels: true))
//           : null,
//       body: SafeArea(
//         child: Container(
//           color: pageBg,
//           child: Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 1200),
//               child: Container(
//                 color: scaffoldBg,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     if (isWeb || isTablet)
//                       _LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),
//                     // Make main content scrollable
//                     Expanded(
//                       child: SingleChildScrollView(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: pageHorizontalPadding, vertical: 18),
//                         child: _MainContent(isWeb: isWeb, isTablet: isTablet),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /* ----------------------- LEFT SIDEBAR ----------------------- */

//  class _LeftSidebar extends StatelessWidget {
//   final double width;
//   final bool showLabels;

//   const _LeftSidebar({required this.width, required this.showLabels, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final menuItems = [
//       _MenuItemData(icon: Icons.dashboard_outlined, label: "Dashboard", path: '/restaurant/dashboard'),
//       _MenuItemData(icon: Icons.add_box_outlined, label: "Add Deal", path: '/restaurant/add-deal'),
//       _MenuItemData(icon: Icons.video_collection_outlined, label: "Upload Video", path: '/restaurant/upload-video'),
//       _MenuItemData(icon: Icons.bar_chart_outlined, label: "Analytics", path: '/restaurant/analytics'),
//       _MenuItemData(icon: Icons.person_outline, label: "Profile", path: '/restaurant/profile'),
//     ];

//     return Container(
//       width: width,
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Adjusted padding here (reduced horizontal and vertical)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
//             child: Image.asset(
//               'assets/splash1.png',
//               width: 80,
//               height: 80,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: 4), // Reduced space between logo and first menu item

//           Builder(builder: (context) {
//             final currentLocation = GoRouterState.of(context).uri.toString();

//             return Column(
//               children: menuItems.map((item) {
//                 final isActive = currentLocation == item.path;
//                 return Padding(
//                   // Reduced horizontal padding from 12 to 6
//                   padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6),
//                   child: GestureDetector(
//                     onTap: () {
//                       GoRouter.of(context).go(item.path);
//                     },
//                     child: Container(
//                       decoration: isActive
//                           ? BoxDecoration(
//                               color: const Color(0xFFFF4B00),
//                               borderRadius: BorderRadius.circular(8),
//                             )
//                           : null,
//                       child: ListTile(
//                         leading: Icon(item.icon, color: isActive ? Colors.white : const Color(0xFF727272)),
//                         title: showLabels
//                             ? Text(item.label,
//                                 style: TextStyle(
//                                     color: isActive ? Colors.white : const Color(0xFF727272)))
//                             : null,
//                         dense: true,
//                         horizontalTitleGap: 6,
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

// class _MenuItemData {
//   final IconData icon;
//   final String label;
//   final String path;

//   _MenuItemData({required this.icon, required this.label, required this.path});
// }
// /* ----------------------- MAIN CONTENT ----------------------- */
// class _MainContent extends StatelessWidget {
//   final bool isWeb;
//   final bool isTablet;
//   const _MainContent({required this.isWeb, required this.isTablet});

//   @override
//   Widget build(BuildContext context) {
//     final List<double> points = [10, 28, 40, 35, 60, 48, 70, 45, 65, 80, 60, 70, 50, 60];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /* ----------------------- TOP NAV BAR ----------------------- */
//         if (isWeb || isTablet)
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
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
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Image.asset('assets/bell_icon.png', width: 28, height: 28),
//               const SizedBox(width: 20),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/Flag.png', width: 26, height: 26),
//                     const SizedBox(width: 8),
//                     const Text('English', style: TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
//                     const SizedBox(width: 4),
//                     const Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7180), size: 18),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 20),
//               Row(
//                 children: [
//                   CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/profile3.png')),
//                   const SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text('MoniRoy', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
//                       Text('Admin', style: TextStyle(fontSize: 11, color: Color(0xFF6B7180))),
//                     ],
//                   ),
//                   const SizedBox(width: 4),
//                   const Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF6B7180)),
//                 ],
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//         Text('Dashboard', style: TextStyle(fontSize: isWeb ? 28 : 24, fontWeight: FontWeight.w700)),
//         const SizedBox(height: 18),
//         _MetricsRow(isWeb: isWeb, isTablet: isTablet),
//         const SizedBox(height: 20),
//         // Active Deals Card
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//           ),
//           padding: const EdgeInsets.all(18),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Active Deals', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//               const SizedBox(height: 12),
//               Column(
//                 children: const [
//                   _DealRow(title: '20% Off Burgers', subtitle: 'Get 20% off all burgers meals', expiry: 'Expires: 2025-08-15', views: '1250 views', redeemed: '86 redeemed'),
//                   _DealRow(title: '20% Off Pizza', subtitle: 'Get 15% off pizza combos', expiry: 'Expires: 2025-08-20', views: '980 views', redeemed: '72 redeemed'),
//                   _DealRow(title: 'Buy 1 Get 1 Free', subtitle: 'Special on fries', expiry: 'Expires: 2025-08-25', views: '450 views', redeemed: '34 redeemed'),
//                 ],
//               )
//             ],
//           ),
//         ),
//         const SizedBox(height: 22),
//         // Sales Chart
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(18),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(children: [
//                 const Text('Sales Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//                 const Spacer(),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   decoration: BoxDecoration(color: const Color(0xFFF7F8FA), borderRadius: BorderRadius.circular(8)),
//                   child: Row(children: const [Text('October', style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))), Icon(Icons.keyboard_arrow_down, size: 18, color: Color(0xFF6B7180))]),
//                 ),
//               ]),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 260,
//                 child: CustomPaint(
//                   painter: _SalesPainter(points),
//                   child: Container(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
// }

// /* ----------------------- SEARCH BOX ----------------------- */
// class _SearchBox extends StatelessWidget {
//   final bool isWeb;
//   const _SearchBox({required this.isWeb});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 42,
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
//       child: Row(children: [
//         const Icon(Icons.search, color: Color(0xFF9DA6B0)),
//         const SizedBox(width: 10),
//         Expanded(child: Text('Search', style: TextStyle(color: const Color(0xFF9DA6B0), fontSize: isWeb ? 14 : 12))),
//       ]),
//     );
//   }
// }

// /* ----------------------- METRICS ROW ----------------------- */
// class _MetricsRow extends StatelessWidget {
//   final bool isWeb;
//   final bool isTablet;
//   const _MetricsRow({required this.isWeb, required this.isTablet});

//   @override
//   Widget build(BuildContext context) {
//     final spacing = 14.0;
//     final cards = [
//       _MetricCard(title: 'Active Deals', value: '200', foot: '8.5% Up from yesterday', accent: const Color(0xFF8280FF), icon: Icons.local_offer_outlined),
//       _MetricCard(title: 'Total Views', value: '10293', foot: '1.3% Up from past week', accent: const Color(0xFFFEC53D), icon: Icons.remove_red_eye_outlined),
//       _MetricCard(title: 'Redemptions', value: '200', foot: '4.3% Down from yesterday', accent: const Color(0xFF4AD991), icon: Icons.redeem_outlined),
//       _MetricCard(title: 'Conversion Rate', value: '6.8%', foot: '1.8% Up from yesterday', accent: const Color(0xFFFF9066), icon: Icons.pie_chart_outline),
//     ];

//     if (isWeb) {
//       return Row(
//         children: [
//           for (int i = 0; i < cards.length; i++)
//             Expanded(child: Padding(padding: EdgeInsets.only(left: i == 0 ? 0 : spacing), child: cards[i])),
//         ],
//       );
//     } else {
//       return Wrap(
//         spacing: spacing,
//         runSpacing: spacing,
//         children: cards.map((c) => SizedBox(width: MediaQuery.of(context).size.width / (isTablet ? 2.2 : 1.05), child: c)).toList(),
//       );
//     }
//   }
// }

// class _MetricCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final String foot;
//   final Color accent;
//   final IconData icon;

//   const _MetricCard({
//     required this.title,
//     required this.value,
//     required this.foot,
//     required this.accent,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: RestaurantDashboardScreen.cardBg,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.03),
//             blurRadius: 8,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title, style: const TextStyle(color: Color(0xFF6B7180), fontSize: 13)),
//                 const SizedBox(height: 6),
//                 Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 6),
//                 Text(foot, style: const TextStyle(color: Color(0xFF3AA374), fontSize: 12)),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           Container(
//             decoration: BoxDecoration(
//               color: accent.withOpacity(0.12),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: const EdgeInsets.all(10),
//             child: Icon(icon, color: accent, size: 22),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- ACTIVE DEAL ROW ----------------------- */
// class _DealRow extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String expiry;
//   final String views;
//   final String redeemed;

//   const _DealRow({required this.title, required this.subtitle, required this.expiry, required this.views, required this.redeemed});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       decoration: BoxDecoration(color: const Color(0xFFF6F9FB), borderRadius: BorderRadius.circular(8)),
//       child: Row(children: [
//         Expanded(
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
//             const SizedBox(height: 6),
//             Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
//             const SizedBox(height: 8),
//             Text(expiry, style: const TextStyle(fontSize: 12, color: Color(0xFF9DA6B0))),
//           ]),
//         ),
//         Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//           Text(views, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF23303B))),
//           const SizedBox(height: 6),
//           Text(redeemed, style: const TextStyle(fontSize: 12, color: Color(0xFF3AA374))),
//         ])
//       ]),
//     );
//   }
// }

// /* ----------------------- SALES CHART PAINTER ----------------------- */
// class _SalesPainter extends CustomPainter {
//   final List<double> pts;
//   _SalesPainter(this.pts);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final w = size.width;
//     final h = size.height;

//     const leftPadding = 45.0;
//     const rightPadding = 20.0;
//     const topPadding = 25.0;
//     const bottomPadding = 35.0;

//     final chartW = w - leftPadding - rightPadding;
//     final chartH = h - topPadding - bottomPadding;

//     /* -------------------- LEFT Y-AXIS (20%-100%) -------------------- */
//     const yLabels = ["100%", "80%", "60%", "40%", "20%"];
//     const yLines = 5;

//     final labelStyle = TextStyle(color: Color(0xFF9DA6B0), fontSize: 11);

//     final gridPaint = Paint()..color = const Color(0xFFE8EBEF)..strokeWidth = 1;

//     for (int i = 0; i < yLines; i++) {
//       final y = topPadding + (chartH / (yLines - 1)) * i;
//       canvas.drawLine(Offset(leftPadding, y), Offset(leftPadding + chartW, y), gridPaint);

//       final tp = TextPainter(text: TextSpan(text: yLabels[i], style: labelStyle), textDirection: TextDirection.ltr)..layout();
//       tp.paint(canvas, Offset(leftPadding - tp.width - 8, y - tp.height / 2));
//     }

//     if (pts.isEmpty) return;

//     final maxV = pts.reduce(max);
//     final minV = pts.reduce(min);
//     final range = (maxV - minV == 0) ? 1 : maxV - minV;

//     List<Offset> points = [];
//     for (int i = 0; i < pts.length; i++) {
//       final x = leftPadding + chartW * (i / (pts.length - 1));
//       final norm = (pts[i] - minV) / range;
//       final y = topPadding + chartH - (norm * chartH);
//       points.add(Offset(x, y));
//     }

//     Path curve = Path();
//     curve.moveTo(points.first.dx, points.first.dy);
//     for (int i = 0; i < points.length - 1; i++) {
//       final p0 = i == 0 ? points[i] : points[i - 1];
//       final p1 = points[i];
//       final p2 = points[i + 1];
//       final p3 = i + 2 < points.length ? points[i + 2] : points[i + 1];

//       for (double t = 0; t < 1; t += 0.05) {
//         final tt = t * t;
//         final ttt = tt * t;

//         double x = 0.5 *
//             ((2 * p1.dx) +
//                 (-p0.dx + p2.dx) * t +
//                 (2 * p0.dx - 5 * p1.dx + 4 * p2.dx - p3.dx) * tt +
//                 (-p0.dx + 3 * p1.dx - 3 * p2.dx + p3.dx) * ttt);

//         double y = 0.5 *
//             ((2 * p1.dy) +
//                 (-p0.dy + p2.dy) * t +
//                 (2 * p0.dy - 5 * p1.dy + 4 * p2.dy - p3.dy) * tt +
//                 (-p0.dy + 3 * p1.dy - 3 * p2.dy + p3.dy) * ttt);

//         curve.lineTo(x, y);
//       }
//     }

//     Path fillPath = Path.from(curve)
//       ..lineTo(points.last.dx, topPadding + chartH)
//       ..lineTo(points.first.dx, topPadding + chartH)
//       ..close();

//     final gradient = const LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [Color(0x33FF6B00), Color(0x00FF6B00)],
//     ).createShader(Rect.fromLTWH(0, 0, w, h));

//     canvas.drawPath(fillPath, Paint()..shader = gradient);

//     final stroke = Paint()
//       ..color = const Color(0xFFFF6B00)
//       ..strokeWidth = 2.4
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     canvas.drawPath(curve, stroke);

//     final dotPaint = Paint()..color = const Color(0xFFFF6B00);
//     for (final p in points) canvas.drawCircle(p, 4, dotPaint);

//     final maxIndex = pts.indexOf(maxV);
//     final maxPoint = points[maxIndex];
//     final tooltipText = maxV.toStringAsFixed(2);

//     final tp = TextPainter(
//       text: TextSpan(text: tooltipText, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white)),
//       textDirection: TextDirection.ltr,
//     )..layout();

//     final boxW = tp.width + 16;
//     final boxH = tp.height + 10;

//     final tx = (maxPoint.dx - boxW / 2).clamp(leftPadding, leftPadding + chartW - boxW);
//     final ty = maxPoint.dy - boxH - 12;

//     canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(tx, ty, boxW, boxH), const Radius.circular(6)),
//         Paint()..color = const Color(0xFFFF6B00));
//     tp.paint(canvas, Offset(tx + 8, ty + 5));

//     /* -------------------- X-AXIS LABELS (5k → 60k) -------------------- */
//     const xLabels = ["5k","10k","15k","20k","25k","30k","35k","40k","45k","50k","55k","60k"];
//     for (int i = 0; i < xLabels.length; i++) {
//       final x = leftPadding + (chartW / (xLabels.length - 1)) * i;
//       final tp2 = TextPainter(text: TextSpan(text: xLabels[i], style: labelStyle), textDirection: TextDirection.ltr)..layout();
//       tp2.paint(canvas, Offset(x - tp2.width / 2, topPadding + chartH + 10));
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _SalesPainter old) => old.pts != pts;
// }
// final correct code above

// import 'dart:math';
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';


// class RestaurantDashboardScreen extends StatelessWidget {
//   const RestaurantDashboardScreen({super.key});

//   static const Color scaffoldBg = Colors.white;
//   static const Color pageBg = Colors.white;
//   static const double pageHorizontalPadding = 20.0;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isWeb = width >= 1000;
//     final isTablet = width >= 600 && width < 1000;

//     final List<double> points = [10, 28, 40, 35, 60, 48, 70, 45, 65, 80, 60, 70, 50, 60];

//     return Scaffold(
//       backgroundColor: pageBg,
//       appBar: (!isWeb && !isTablet) ? AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const TopNavBar(isWeb: false),
//       ) : null,
//       drawer: (!isWeb && !isTablet) ? Drawer(child: LeftSidebar(width: 240, showLabels: true)) : null,
//       body: SafeArea(
//         child: Container(
//           color: pageBg,
//           child: Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 1200),
//               child: Container(
//                 color: scaffoldBg,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     if (isWeb || isTablet)
//                       LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: pageHorizontalPadding, vertical: 18),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             if (isWeb || isTablet) const TopNavBar(isWeb: true),
//                             const SizedBox(height: 20),
//                             Text('Dashboard', style: TextStyle(fontSize: isWeb ? 28 : 24, fontWeight: FontWeight.w700)),
//                             const SizedBox(height: 18),
//                             _MetricsRow(isWeb: isWeb, isTablet: isTablet),
//                             const SizedBox(height: 20),
//                             _ActiveDeals(),
//                             const SizedBox(height: 22),
//                             _SalesChart(points: points),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /* ----------------------- METRICS ROW ----------------------- */
// class _MetricsRow extends StatelessWidget {
//   final bool isWeb;
//   final bool isTablet;
//   const _MetricsRow({required this.isWeb, required this.isTablet});

//   @override
//   Widget build(BuildContext context) {
//     final spacing = 14.0;
//     final cards = [
//       _MetricCard(title: 'Active Deals', value: '200', foot: '8.5% Up from yesterday', accent: const Color(0xFF8280FF), icon: Icons.local_offer_outlined),
//       _MetricCard(title: 'Total Views', value: '10293', foot: '1.3% Up from past week', accent: const Color(0xFFFEC53D), icon: Icons.remove_red_eye_outlined),
//       _MetricCard(title: 'Redemptions', value: '200', foot: '4.3% Down from yesterday', accent: const Color(0xFF4AD991), icon: Icons.redeem_outlined),
//       _MetricCard(title: 'Conversion Rate', value: '6.8%', foot: '1.8% Up from yesterday', accent: const Color(0xFFFF9066), icon: Icons.pie_chart_outline),
//     ];

//     if (isWeb) {
//       return Row(
//         children: [
//           for (int i = 0; i < cards.length; i++)
//             Expanded(child: Padding(padding: EdgeInsets.only(left: i == 0 ? 0 : spacing), child: cards[i])),
//         ],
//       );
//     } else {
//       return Wrap(
//         spacing: spacing,
//         runSpacing: spacing,
//         children: cards.map((c) => SizedBox(width: MediaQuery.of(context).size.width / (isTablet ? 2.2 : 1.05), child: c)).toList(),
//       );
//     }
//   }
// }

// class _MetricCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final String foot;
//   final Color accent;
//   final IconData icon;

//   const _MetricCard({required this.title, required this.value, required this.foot, required this.accent, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 6))],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title, style: const TextStyle(color: Color(0xFF6B7180), fontSize: 13)),
//                 const SizedBox(height: 6),
//                 Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 6),
//                 Text(foot, style: const TextStyle(color: Color(0xFF3AA374), fontSize: 12)),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           Container(
//             decoration: BoxDecoration(color: accent.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
//             padding: const EdgeInsets.all(10),
//             child: Icon(icon, color: accent, size: 22),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- ACTIVE DEALS ----------------------- */
// class _ActiveDeals extends StatelessWidget {
//   const _ActiveDeals();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//       ),
//       padding: const EdgeInsets.all(18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text('Active Deals', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//           SizedBox(height: 12),
//           _DealRow(title: '20% Off Burgers', subtitle: 'Get 20% off all burgers meals', expiry: 'Expires: 2025-08-15', views: '1250 views', redeemed: '86 redeemed'),
//           _DealRow(title: '20% Off Pizza', subtitle: 'Get 15% off pizza combos', expiry: 'Expires: 2025-08-20', views: '980 views', redeemed: '72 redeemed'),
//           _DealRow(title: 'Buy 1 Get 1 Free', subtitle: 'Special on fries', expiry: 'Expires: 2025-08-25', views: '450 views', redeemed: '34 redeemed'),
//         ],
//       ),
//     );
//   }
// }

// class _DealRow extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String expiry;
//   final String views;
//   final String redeemed;

//   const _DealRow({required this.title, required this.subtitle, required this.expiry, required this.views, required this.redeemed});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       decoration: BoxDecoration(color: const Color(0xFFF6F9FB), borderRadius: BorderRadius.circular(8)),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
//               const SizedBox(height: 6),
//               Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
//               const SizedBox(height: 8),
//               Text(expiry, style: const TextStyle(fontSize: 12, color: Color(0xFF9DA6B0))),
//             ]),
//           ),
//           Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//             Text(views, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF23303B))),
//             const SizedBox(height: 6),
//             Text(redeemed, style: const TextStyle(fontSize: 12, color: Color(0xFF3AA374))),
//           ])
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- SALES CHART ----------------------- */
// class _SalesChart extends StatelessWidget {
//   final List<double> points;
//   const _SalesChart({required this.points});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Text('Sales Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//               const Spacer(),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                 decoration: BoxDecoration(color: const Color(0xFFF7F8FA), borderRadius: BorderRadius.circular(8)),
//                 child: Row(
//                   children: const [
//                     Text('October', style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
//                     Icon(Icons.keyboard_arrow_down, size: 18, color: Color(0xFF6B7180))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           SizedBox(height: 260, child: CustomPaint(painter: _SalesPainter(points), child: Container())),
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- SALES PAINTER ----------------------- */
// class _SalesPainter extends CustomPainter {
//   final List<double> pts;
//   _SalesPainter(this.pts);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final w = size.width;
//     final h = size.height;
//     const leftPadding = 45.0, rightPadding = 20.0, topPadding = 25.0, bottomPadding = 35.0;
//     final chartW = w - leftPadding - rightPadding, chartH = h - topPadding - bottomPadding;

//     const yLabels = ["100%", "80%", "60%", "40%", "20%"];
//     final labelStyle = TextStyle(color: Color(0xFF9DA6B0), fontSize: 11);
//     final gridPaint = Paint()..color = const Color(0xFFE8EBEF)..strokeWidth = 1;

//     for (int i = 0; i < yLabels.length; i++) {
//       final y = topPadding + (chartH / (yLabels.length - 1)) * i;
//       canvas.drawLine(Offset(leftPadding, y), Offset(leftPadding + chartW, y), gridPaint);
//       final tp = TextPainter(text: TextSpan(text: yLabels[i], style: labelStyle), textDirection: TextDirection.ltr)..layout();
//       tp.paint(canvas, Offset(leftPadding - tp.width - 8, y - tp.height / 2));
//     }

//     if (pts.isEmpty) return;

//     final maxV = pts.reduce(max), minV = pts.reduce(min), range = (maxV - minV == 0) ? 1 : maxV - minV;
//     List<Offset> points = [];
//     for (int i = 0; i < pts.length; i++) {
//       final x = leftPadding + chartW * (i / (pts.length - 1));
//       final y = topPadding + chartH - ((pts[i] - minV) / range * chartH);
//       points.add(Offset(x, y));
//     }

//     Path curve = Path()..moveTo(points.first.dx, points.first.dy);
//     for (int i = 0; i < points.length - 1; i++) {
//       final p0 = i == 0 ? points[i] : points[i - 1], p1 = points[i], p2 = points[i + 1], p3 = i + 2 < points.length ? points[i + 2] : points[i + 1];
//       for (double t = 0; t < 1; t += 0.05) {
//         final tt = t * t, ttt = tt * t;
//         double x = 0.5 * ((2 * p1.dx) + (-p0.dx + p2.dx) * t + (2 * p0.dx - 5 * p1.dx + 4 * p2.dx - p3.dx) * tt + (-p0.dx + 3 * p1.dx - 3 * p2.dx + p3.dx) * ttt);
//         double y = 0.5 * ((2 * p1.dy) + (-p0.dy + p2.dy) * t + (2 * p0.dy - 5 * p1.dy + 4 * p2.dy - p3.dy) * tt + (-p0.dy + 3 * p1.dy - 3 * p2.dy + p3.dy) * ttt);
//         curve.lineTo(x, y);
//       }
//     }

//     Path fillPath = Path.from(curve)..lineTo(points.last.dx, topPadding + chartH)..lineTo(points.first.dx, topPadding + chartH)..close();
//     final gradient = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x33FF6B00), Color(0x00FF6B00)]).createShader(Rect.fromLTWH(0, 0, w, h));
//     canvas.drawPath(fillPath, Paint()..shader = gradient);
//     canvas.drawPath(curve, Paint()..color = const Color(0xFFFF6B00)..strokeWidth = 2.4..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
//     final dotPaint = Paint()..color = const Color(0xFFFF6B00); for (final p in points) canvas.drawCircle(p, 4, dotPaint);

//     const xLabels = ["5k","10k","15k","20k","25k","30k","35k","40k","45k","50k","55k","60k"];
//     for (int i = 0; i < xLabels.length; i++) {
//       final x = leftPadding + (chartW / (xLabels.length - 1)) * i;
//       final tp2 = TextPainter(text: TextSpan(text: xLabels[i], style: labelStyle), textDirection: TextDirection.ltr)..layout();
//       tp2.paint(canvas, Offset(x - tp2.width / 2, topPadding + chartH + 10));
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _SalesPainter old) => old.pts != pts;
// }
// import 'dart:math';
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class RestaurantDashboardScreen extends StatelessWidget {
//   const RestaurantDashboardScreen({super.key});

//   static const Color scaffoldBg = Colors.white;
//   static const Color pageBg = Colors.white;
//   static const double pageHorizontalPadding = 20.0;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isWeb = width >= 1000;
//     final isTablet = width >= 600 && width < 1000;

//     final List<double> points = [10, 28, 40, 35, 60, 48, 70, 45, 65, 80, 60, 70, 50, 60];

//     return Scaffold(
//       backgroundColor: Color(0xFFDEDECC),
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,
//       drawer: (!isWeb && !isTablet)
//           ? Drawer(child: LeftSidebar(width: 220, showLabels: true))
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
//                         horizontal: pageHorizontalPadding, vertical: 18),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (isWeb || isTablet) const TopNavBar(isWeb: true),
//                         const SizedBox(height: 20),
//                         Text('Dashboard',
//                             style: TextStyle(
//                                 fontSize: isWeb ? 28 : 24,
//                                 fontWeight: FontWeight.w700)),
//                         const SizedBox(height: 18),
//                         _MetricsRow(isWeb: isWeb, isTablet: isTablet),
//                         const SizedBox(height: 20),
//                         const _ActiveDeals(),
//                         const SizedBox(height: 22),
//                         _SalesChart(points: points),
//                         const SizedBox(height: 20),
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
// }

// /* ----------------------- METRICS ROW ----------------------- */
// class _MetricsRow extends StatelessWidget {
//   final bool isWeb;
//   final bool isTablet;
//   const _MetricsRow({required this.isWeb, required this.isTablet});

//   @override
//   Widget build(BuildContext context) {
//     final spacing = 14.0;
//     final cards = [
//       _MetricCard(
//           title: 'Active Deals',
//           value: '200',
//           foot: '8.5% Up from yesterday',
//           accent: const Color(0xFF8280FF),
//           icon: Icons.local_offer_outlined),
//       _MetricCard(
//           title: 'Total Views',
//           value: '10293',
//           foot: '1.3% Up from past week',
//           accent: const Color(0xFFFEC53D),
//           icon: Icons.remove_red_eye_outlined),
//       _MetricCard(
//           title: 'Redemptions',
//           value: '200',
//           foot: '4.3% Down from yesterday',
//           accent: const Color(0xFF4AD991),
//           icon: Icons.redeem_outlined),
//       _MetricCard(
//           title: 'Conversion Rate',
//           value: '6.8%',
//           foot: '1.8% Up from yesterday',
//           accent: const Color(0xFFFF9066),
//           icon: Icons.pie_chart_outline),
//     ];

//     if (isWeb) {
//       return Row(
//         children: [
//           for (int i = 0; i < cards.length; i++)
//             Expanded(
//                 child: Padding(
//                     padding: EdgeInsets.only(left: i == 0 ? 0 : spacing),
//                     child: cards[i])),
//         ],
//       );
//     } else {
//       return Wrap(
//         spacing: spacing,
//         runSpacing: spacing,
//         children: cards
//             .map((c) => SizedBox(
//                 width: MediaQuery.of(context).size.width /
//                     (isTablet ? 2.2 : 1.05),
//                 child: c))
//             .toList(),
//       );
//     }
//   }
// }

// class _MetricCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final String foot;
//   final Color accent;
//   final IconData icon;

//   const _MetricCard(
//       {required this.title,
//       required this.value,
//       required this.foot,
//       required this.accent,
//       required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.03),
//               blurRadius: 8,
//               offset: const Offset(0, 6))
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title,
//                       style: const TextStyle(
//                           color: Color(0xFF6B7180), fontSize: 13)),
//                   const SizedBox(height: 6),
//                   Text(value,
//                       style: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.w700)),
//                   const SizedBox(height: 6),
//                   Text(foot,
//                       style: const TextStyle(
//                           color: Color(0xFF3AA374), fontSize: 12)),
//                 ]),
//           ),
//           const SizedBox(width: 12),
//           Container(
//             decoration: BoxDecoration(
//                 color: accent.withOpacity(0.12),
//                 borderRadius: BorderRadius.circular(10)),
//             padding: const EdgeInsets.all(10),
//             child: Icon(icon, color: accent, size: 22),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- ACTIVE DEALS ----------------------- */
// class _ActiveDeals extends StatelessWidget {
//   const _ActiveDeals();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 10,
//               offset: const Offset(0, 6))
//         ],
//       ),
//       padding: const EdgeInsets.all(18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text('Active Deals',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//           SizedBox(height: 12),
//           _DealRow(
//               title: '20% Off Burgers',
//               subtitle: 'Get 20% off all burgers meals',
//               expiry: 'Expires: 2025-08-15',
//               views: '1250 views',
//               redeemed: '86 redeemed'),
//           _DealRow(
//               title: '20% Off Pizza',
//               subtitle: 'Get 15% off pizza combos',
//               expiry: 'Expires: 2025-08-20',
//               views: '980 views',
//               redeemed: '72 redeemed'),
//           _DealRow(
//               title: 'Buy 1 Get 1 Free',
//               subtitle: 'Special on fries',
//               expiry: 'Expires: 2025-08-25',
//               views: '450 views',
//               redeemed: '34 redeemed'),
//         ],
//       ),
//     );
//   }
// }

// class _DealRow extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String expiry;
//   final String views;
//   final String redeemed;

//   const _DealRow(
//       {required this.title,
//       required this.subtitle,
//       required this.expiry,
//       required this.views,
//       required this.redeemed});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       decoration: BoxDecoration(
//           color: const Color(0xFFF6F9FB), borderRadius: BorderRadius.circular(8)),
//       child: Row(
//         children: [
//           Expanded(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                 Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 6),
//                 Text(subtitle,
//                     style: const TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
//                 const SizedBox(height: 8),
//                 Text(expiry,
//                     style: const TextStyle(fontSize: 12, color: Color(0xFF9DA6B0))),
//               ])),
//           Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//             Text(views,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w700, color: Color(0xFF23303B))),
//             const SizedBox(height: 6),
//             Text(redeemed,
//                 style: const TextStyle(fontSize: 12, color: Color(0xFF3AA374))),
//           ])
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- SALES CHART ----------------------- */
// class _SalesChart extends StatelessWidget {
//   final List<double> points;
//   const _SalesChart({required this.points});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 10,
//               offset: const Offset(0, 6))
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Text('Sales Details',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//               const Spacer(),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                 decoration: BoxDecoration(
//                     color: const Color(0xFFF7F8FA),
//                     borderRadius: BorderRadius.circular(8)),
//                 child: Row(
//                   children: const [
//                     Text('October',
//                         style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
//                     Icon(Icons.keyboard_arrow_down,
//                         size: 18, color: Color(0xFF6B7180))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           SizedBox(
//               height: 260,
//               child: CustomPaint(
//                   painter: _SalesPainter(points), child: Container())),
//         ],
//       ),
//     );
//   }
// }

// /* ----------------------- SALES PAINTER ----------------------- */
// class _SalesPainter extends CustomPainter {
//   final List<double> pts;
//   _SalesPainter(this.pts);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final w = size.width;
//     final h = size.height;
//     const leftPadding = 45.0,
//         rightPadding = 20.0,
//         topPadding = 25.0,
//         bottomPadding = 35.0;
//     final chartW = w - leftPadding - rightPadding,
//         chartH = h - topPadding - bottomPadding;

//     const yLabels = ["100%", "80%", "60%", "40%", "20%"];
//     final labelStyle = TextStyle(color: Color(0xFF9DA6B0), fontSize: 11);
//     final gridPaint = Paint()..color = const Color(0xFFE8EBEF)..strokeWidth = 1;

//     for (int i = 0; i < yLabels.length; i++) {
//       final y = topPadding + (chartH / (yLabels.length - 1)) * i;
//       canvas.drawLine(Offset(leftPadding, y), Offset(leftPadding + chartW, y),
//           gridPaint);
//       final tp = TextPainter(
//           text: TextSpan(text: yLabels[i], style: labelStyle),
//           textDirection: TextDirection.ltr)
//         ..layout();
//       tp.paint(canvas, Offset(leftPadding - tp.width - 8, y - tp.height / 2));
//     }

//     if (pts.isEmpty) return;

//     final maxV = pts.reduce(max),
//         minV = pts.reduce(min),
//         range = (maxV - minV == 0) ? 1 : maxV - minV;
//     List<Offset> points = [];
//     for (int i = 0; i < pts.length; i++) {
//       final x = leftPadding + chartW * (i / (pts.length - 1));
//       final y = topPadding + chartH - ((pts[i] - minV) / range * chartH);
//       points.add(Offset(x, y));
//     }

//     Path curve = Path()..moveTo(points.first.dx, points.first.dy);
//     for (int i = 0; i < points.length - 1; i++) {
//       final p0 = i == 0 ? points[i] : points[i - 1],
//           p1 = points[i],
//           p2 = points[i + 1],
//           p3 = i + 2 < points.length ? points[i + 2] : points[i + 1];
//       for (double t = 0; t < 1; t += 0.05) {
//         final tt = t * t, ttt = tt * t;
//         double x = 0.5 *
//             ((2 * p1.dx) +
//                 (-p0.dx + p2.dx) * t +
//                 (2 * p0.dx - 5 * p1.dx + 4 * p2.dx - p3.dx) * tt +
//                 (-p0.dx + 3 * p1.dx - 3 * p2.dx + p3.dx) * ttt);
//         double y = 0.5 *
//             ((2 * p1.dy) +
//                 (-p0.dy + p2.dy) * t +
//                 (2 * p0.dy - 5 * p1.dy + 4 * p2.dy - p3.dy) * tt +
//                 (-p0.dy + 3 * p1.dy - 3 * p2.dy + p3.dy) * ttt);
//         curve.lineTo(x, y);
//       }
//     }

//     Path fillPath = Path.from(curve)
//       ..lineTo(points.last.dx, topPadding + chartH)
//       ..lineTo(points.first.dx, topPadding + chartH)
//       ..close();
//     final gradient = const LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0x33FF6B00), Color(0x00FF6B00)])
//         .createShader(Rect.fromLTWH(0, 0, w, h));
//     canvas.drawPath(fillPath, Paint()..shader = gradient);
//     canvas.drawPath(
//         curve,
//         Paint()
//           ..color = const Color(0xFFFF6B00)
//           ..strokeWidth = 2.4
//           ..style = PaintingStyle.stroke
//           ..strokeCap = StrokeCap.round);
//     final dotPaint = Paint()..color = const Color(0xFFFF6B00);
//     for (final p in points) canvas.drawCircle(p, 4, dotPaint);

//     const xLabels = [
//       "5k",
//       "10k",
//       "15k",
//       "20k",
//       "25k",
//       "30k",
//       "35k",
//       "40k",
//       "45k",
//       "50k",
//       "55k",
//       "60k"
//     ];
//     for (int i = 0; i < xLabels.length; i++) {
//       final x = leftPadding + (chartW / (xLabels.length - 1)) * i;
//       final tp2 = TextPainter(
//           text: TextSpan(text: xLabels[i], style: labelStyle),
//           textDirection: TextDirection.ltr)
//         ..layout();
//       tp2.paint(canvas, Offset(x - tp2.width / 2, topPadding + chartH + 10));
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _SalesPainter old) => old.pts != pts;
// }
// import 'dart:math';
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class RestaurantDashboardScreen extends StatelessWidget {
//   const RestaurantDashboardScreen({super.key});

//   static const double pageHorizontalPadding = 20.0;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isWeb = width >= 1000;
//     final isTablet = width >= 600 && width < 1000;

//     final List<double> points = [
//       10, 28, 40, 35, 60, 48, 70, 45, 65, 80, 60, 70, 50, 60
//     ];

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),

//       /// ---- MOBILE TOP BAR ----
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,

//       /// ---- MOBILE DRAWER ----
//       drawer: (!isWeb && !isTablet)
//           ? Drawer(child: LeftSidebar(width: 220, showLabels: true))
//           : null,

//       body: SafeArea(
//         child: Row(
//           children: [
//             /// ---- FIXED LEFT SIDEBAR (WEB/TABLET) ----
//             if (isWeb || isTablet)
//               LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),

//             /// ---- CONTENT AREA ----
//                  Expanded(
//             child: Column(
//               children: [
//                 /// 🔝 Top NavBar (Attached with no spacing)
//                 if (isWeb || isTablet)
//                   const TopNavBar(isWeb: true),

//                   /// ---- SCROLLABLE CONTENT ----
//                   Expanded(
//                     child: Center(
//                       child: ConstrainedBox(
//                         constraints: const BoxConstraints(maxWidth: 1200),
//                         child: SingleChildScrollView(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: pageHorizontalPadding, vertical: 18),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(height: 10),

//                               Text(
//                                 'Dashboard',
//                                 style: TextStyle(
//                                   fontSize: isWeb ? 28 : 24,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               const SizedBox(height: 18),

//                               _MetricsRow(isWeb: isWeb, isTablet: isTablet),
//                               const SizedBox(height: 20),

//                               const _ActiveDeals(),
//                               const SizedBox(height: 22),

//                               _SalesChart(points: points),
//                               const SizedBox(height: 20),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:dealdine_application/widgets/left_sidebar.dart';
import 'package:dealdine_application/widgets/mobile_appbar.dart';
import 'package:dealdine_application/widgets/top_navbar.dart';
import 'package:flutter/material.dart';

class RestaurantDashboardScreen extends StatelessWidget {
  const RestaurantDashboardScreen({super.key});

  static const double pageHorizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWeb = width >= 1000;
    final isTablet = width >= 600 && width < 1000;
    final isMobile = !isWeb && !isTablet;

    final List<double> points = [
      10, 28, 40, 35, 60, 48, 70, 45, 65, 80, 60, 70, 50, 60
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFDEDECC),

      // --------------------------
      // MOBILE APPBAR + DRAWER
      // --------------------------
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile
          ? Drawer(child: LeftSidebar(width: 220, showLabels: true))
          : null,

      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT SIDEBAR (Web/Tablet)
            if (isWeb || isTablet)
              LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),

            // MAIN CONTENT AREA
            Expanded(
              child: Column(
                children: [
                  // TOP NAV BAR (Web/Tablet)
                  if (!isMobile) const TopNavBar(isWeb: true),

                  // SEARCH FIELD BELOW APPBAR (Mobile Only)
                  if (isMobile)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search deals...',
                          prefixIcon: const Icon(Icons.search),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),


                  // SCROLLABLE CONTENT
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: pageHorizontalPadding, vertical: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 1),

                              Text(
                                'Dashboard',
                                style: TextStyle(
                                  fontSize: isWeb ? 28 : 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 18),

                              _MetricsRow(isWeb: isWeb, isTablet: isTablet),
                              const SizedBox(height: 20),

                              const _ActiveDeals(),
                              const SizedBox(height: 22),

                              _SalesChart(points: points),
                              const SizedBox(height: 20),
                            ],
                          ),
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

// -------------------------
// METRICS ROW, METRIC CARD, ACTIVE DEALS, SALES CHART


/* ----------------------- METRICS ROW ----------------------- */
class _MetricsRow extends StatelessWidget {
  final bool isWeb;
  final bool isTablet;
  const _MetricsRow({required this.isWeb, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final spacing = 14.0;

    final cards = [
      _MetricCard(
          title: 'Active Deals',
          value: '200',
          foot: '8.5% Up from yesterday',
          accent: const Color(0xFF8280FF),
          icon: Icons.local_offer_outlined),
      _MetricCard(
          title: 'Total Views',
          value: '10293',
          foot: '1.3% Up from past week',
          accent: const Color(0xFFFEC53D),
          icon: Icons.remove_red_eye_outlined),
      _MetricCard(
          title: 'Redemptions',
          value: '200',
          foot: '4.3% Down from yesterday',
          accent: const Color(0xFF4AD991),
          icon: Icons.redeem_outlined),
      _MetricCard(
          title: 'Conversion Rate',
          value: '6.8%',
          foot: '1.8% Up from yesterday',
          accent: const Color(0xFFFF9066),
          icon: Icons.pie_chart_outline),
    ];

    if (isWeb) {
      return Row(
        children: [
          for (int i = 0; i < cards.length; i++)
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: i == 0 ? 0 : spacing),
                    child: cards[i])),
        ],
      );
    } else {
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: cards
            .map((c) => SizedBox(
                width: MediaQuery.of(context).size.width /
                    (isTablet ? 2.2 : 1.05),
                child: c))
            .toList(),
      );
    }
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String foot;
  final Color accent;
  final IconData icon;

  const _MetricCard(
      {required this.title,
      required this.value,
      required this.foot,
      required this.accent,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 6))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Color(0xFF6B7180), fontSize: 13)),
                  const SizedBox(height: 6),
                  Text(value,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text(foot,
                      style: const TextStyle(
                          color: Color(0xFF3AA374), fontSize: 12)),
                ]),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
                color: accent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: accent, size: 22),
          ),
        ],
      ),
    );
  }
}

/* ----------------------- ACTIVE DEALS ----------------------- */
class _ActiveDeals extends StatelessWidget {
  const _ActiveDeals();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 6))
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Active Deals',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          SizedBox(height: 12),
          _DealRow(
              title: '20% Off Burgers',
              subtitle: 'Get 20% off all burgers meals',
              expiry: 'Expires: 2025-08-15',
              views: '1250 views',
              redeemed: '86 redeemed'),
          _DealRow(
              title: '20% Off Pizza',
              subtitle: 'Get 15% off pizza combos',
              expiry: 'Expires: 2025-08-20',
              views: '980 views',
              redeemed: '72 redeemed'),
          _DealRow(
              title: 'Buy 1 Get 1 Free',
              subtitle: 'Special on fries',
              expiry: 'Expires: 2025-08-25',
              views: '450 views',
              redeemed: '34 redeemed'),
        ],
      ),
    );
  }
}

class _DealRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String expiry;
  final String views;
  final String redeemed;

  const _DealRow(
      {required this.title,
      required this.subtitle,
      required this.expiry,
      required this.views,
      required this.redeemed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
          color: const Color(0xFFF6F9FB),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text(subtitle,
                    style:
                        const TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
                const SizedBox(height: 8),
                Text(expiry,
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xFF9DA6B0))),
              ])),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(views,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Color(0xFF23303B))),
            const SizedBox(height: 6),
            Text(redeemed,
                style: const TextStyle(fontSize: 12, color: Color(0xFF3AA374))),
          ])
        ],
      ),
    );
  }
}

/* ----------------------- SALES CHART ----------------------- */

class _SalesChart extends StatelessWidget {
  final List<double> points;
  const _SalesChart({required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 6))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Sales Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: const Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: const [
                    Text('October',
                        style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
                    Icon(Icons.keyboard_arrow_down,
                        size: 18, color: Color(0xFF6B7180))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
              height: 260,
              child: CustomPaint(
                  painter: _SalesPainter(points), child: Container())),
        ],
      ),
    );
  }
}

/* ----------------------- SALES PAINTER ----------------------- */
class _SalesPainter extends CustomPainter {
  final List<double> pts;
  _SalesPainter(this.pts);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    const leftPadding = 45.0,
        rightPadding = 20.0,
        topPadding = 25.0,
        bottomPadding = 35.0;
    final chartW = w - leftPadding - rightPadding,
        chartH = h - topPadding - bottomPadding;

    const yLabels = ["100%", "80%", "60%", "40%", "20%"];
    final labelStyle = TextStyle(color: Color(0xFF9DA6B0), fontSize: 11);
    final gridPaint = Paint()..color = const Color(0xFFE8EBEF)..strokeWidth = 1;

    for (int i = 0; i < yLabels.length; i++) {
      final y = topPadding + (chartH / (yLabels.length - 1)) * i;
      canvas.drawLine(Offset(leftPadding, y), Offset(leftPadding + chartW, y),
          gridPaint);
      final tp = TextPainter(
          text: TextSpan(text: yLabels[i], style: labelStyle),
          textDirection: TextDirection.ltr)
        ..layout();
      tp.paint(canvas, Offset(leftPadding - tp.width - 8, y - tp.height / 2));
    }

    if (pts.isEmpty) return;

    final maxV = pts.reduce(max),
        minV = pts.reduce(min),
        range = (maxV - minV == 0) ? 1 : maxV - minV;
    List<Offset> points = [];
    for (int i = 0; i < pts.length; i++) {
      final x = leftPadding + chartW * (i / (pts.length - 1));
      final y = topPadding + chartH - ((pts[i] - minV) / range * chartH);
      points.add(Offset(x, y));
    }

    Path curve = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 0; i < points.length - 1; i++) {
      final p0 = i == 0 ? points[i] : points[i - 1],
          p1 = points[i],
          p2 = points[i + 1],
          p3 = i + 2 < points.length ? points[i + 2] : points[i + 1];
      for (double t = 0; t < 1; t += 0.05) {
        final tt = t * t, ttt = tt * t;
        double x = 0.5 *
            ((2 * p1.dx) +
                (-p0.dx + p2.dx) * t +
                (2 * p0.dx - 5 * p1.dx + 4 * p2.dx - p3.dx) * tt +
                (-p0.dx + 3 * p1.dx - 3 * p2.dx + p3.dx) * ttt);
        double y = 0.5 *
            ((2 * p1.dy) +
                (-p0.dy + p2.dy) * t +
                (2 * p0.dy - 5 * p1.dy + 4 * p2.dy - p3.dy) * tt +
                (-p0.dy + 3 * p1.dy - 3 * p2.dy + p3.dy) * ttt);
        curve.lineTo(x, y);
      }
    }

    Path fillPath = Path.from(curve)
      ..lineTo(points.last.dx, topPadding + chartH)
      ..lineTo(points.first.dx, topPadding + chartH)
      ..close();
    final gradient = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x33FF6B00), Color(0x00FF6B00)])
        .createShader(Rect.fromLTWH(0, 0, w, h));
    canvas.drawPath(fillPath, Paint()..shader = gradient);
    canvas.drawPath(
        curve,
        Paint()
          ..color = const Color(0xFFFF6B00)
          ..strokeWidth = 2.4
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round);
    final dotPaint = Paint()..color = const Color(0xFFFF6B00);
    for (final p in points) canvas.drawCircle(p, 4, dotPaint);

    const xLabels = [
      "5k",
      "10k",
      "15k",
      "20k",
      "25k",
      "30k",
      "35k",
      "40k",
      "45k",
      "50k",
      "55k",
      "60k"
    ];
    for (int i = 0; i < xLabels.length; i++) {
      final x = leftPadding + (chartW / (xLabels.length - 1)) * i;
      final tp2 = TextPainter(
          text: TextSpan(text: xLabels[i], style: labelStyle),
          textDirection: TextDirection.ltr)
        ..layout();
      tp2.paint(canvas, Offset(x - tp2.width / 2, topPadding + chartH + 10));
    }
  }

  @override
  bool shouldRepaint(covariant _SalesPainter old) => old.pts != pts;
}