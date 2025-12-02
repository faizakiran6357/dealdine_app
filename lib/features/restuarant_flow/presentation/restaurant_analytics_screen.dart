
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';


// class RestaurantAnalyticsScreen extends StatelessWidget {
//   const RestaurantAnalyticsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final bool isWeb = width > 950;
//     final bool isTablet = width > 650 && width <= 950;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       body: Row(
//         children: [
//           LeftSidebar(
//             width: isWeb ? 220 : isTablet ? 200 : 70,
//             showLabels: isWeb || isTablet,
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TopNavBar(isWeb: isWeb),
//                   const SizedBox(height: 25),
//                   const Text(
//                     "Analytics Dashboard",
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 25),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           _performanceMetricsCard(),
//                           const SizedBox(height: 25),
//                           LayoutBuilder(builder: (context, constraints) {
//                             bool wide = constraints.maxWidth > 900;
//                             return Flex(
//                               direction: wide ? Axis.horizontal : Axis.vertical,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Left: Pie card width smaller in wide layout (approx 40%)
//                                 Flexible(
//                                   flex: wide ? 4 : 0,
//                                   child: _pieChartCard(),
//                                 ),
//                                 SizedBox(width: wide ? 20 : 0, height: wide ? 0 : 20),
//                                 // Right: Bar card
//                                 Flexible(
//                                   flex: 6,
//                                   child: _barChartCard(),
//                                 ),
//                               ],
//                             );
//                           }),
//                           const SizedBox(height: 30),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _performanceMetricsCard() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Row(
//         children: [
//           Expanded(
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Performance Metrics",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//                 SizedBox(height: 18),
//                 Text("Total Impressions", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Click-through Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Conversion Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Revenue Generated", style: TextStyle(fontSize: 14)),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: const [
//               Text("12.4K", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text("3.2%", style: TextStyle(fontSize: 20, color: Color(0xFF00B69B),fontWeight: FontWeight.bold)), // teal-green
//               SizedBox(height: 10),
//               Text("5.4%", style: TextStyle(fontSize: 20, color: Color(0xFF3D42DF),fontWeight: FontWeight.bold)), // blue
//               SizedBox(height: 10),
//               Text("\$2,847", style: TextStyle(fontSize: 22, color: Color(0xFFF93C65),fontWeight: FontWeight.bold)) // red
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//    Widget _pieChartCard() {
//   return Container(
//     padding: const EdgeInsets.all(22),
//     decoration: _cardStyle(),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Redemptions by Deal",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 18),

//         // Center the PNG image instead of pie chart
//         Center(
//           child: SizedBox(
//             width: 269.13,
//             height: 259.67,
//             child: Image.asset(
//               "assets/redemptions.png",
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

//   Widget _barChartCard() {
//     // sample legend placed top-right inside card
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // header row with title and legend
//           Row(
//             children: [
//               const Expanded(
//                 child: Text("Weekly Impressions",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//               ),
//               Row(
//                 children: [
//                   _legendDot(Color(0XFFFF4B00), "Videos"),
//                   const SizedBox(width: 12),
//                   _legendDot(const Color(0xFF00B69B), "Posts"),
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 18),

//           SizedBox(
//             height: 280,
//             child: BarChart(
//               BarChartData(
//                 maxY: 520,
//                 groupsSpace: 14,
//                 barTouchData: BarTouchData(enabled: false),
//                 gridData: FlGridData(
//                   show: true,
//                   drawVerticalLine: false,
//                   getDrawingHorizontalLine: (value) => FlLine(
//                     color: Colors.grey.withOpacity(0.12),
//                     strokeWidth: 1,
//                   ),
//                 ),
//                 titlesData: FlTitlesData(
//                   leftTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 36,
//                       interval: 100,
//                       getTitlesWidget: (value, meta) {
//                         // show numeric ticks 0,100,200,... if desired
//                         if (value % 100 == 0) {
//                           return Text(value.toInt().toString(), style: const TextStyle(fontSize: 11));
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                   topTitles: AxisTitles(),
//                   rightTitles: AxisTitles(),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: (value, meta) {
//                         const days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
//                         final idx = value.toInt();
//                         if (idx >= 0 && idx < days.length) {
//                           return Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child: Text(days[idx], style: const TextStyle(fontSize: 12)),
//                           );
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                 ),
//                 borderData: FlBorderData(show: false),
//                 barGroups: [
//                   _makeGroup(0, 450, 220),
//                   _makeGroup(1, 330, 100),
//                   _makeGroup(2, 310, 180),
//                   _makeGroup(3, 480, 260),
//                   _makeGroup(4, 200, 140),
//                   _makeGroup(5, 390, 230),
//                   _makeGroup(6, 350, 270),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // helper for legend
//   Widget _legendDot(Color color, String label) {
//     return Row(children: [
//       Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
//       const SizedBox(width: 6),
//       Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
//     ]);
//   }

//   BarChartGroupData _makeGroup(int x, double leftValue, double rightValue) {
//     return BarChartGroupData(
//       x: x,
//       barsSpace: 6,
//       barRods: [
//         BarChartRodData(
//           toY: leftValue,
//           width: 16,
//           borderRadius: BorderRadius.circular(6),
//           color: Color(0XFFFF4B00),
//           rodStackItems: [],
//         ),
//         BarChartRodData(
//           toY: rightValue,
//           width: 16,
//           borderRadius: BorderRadius.circular(6),
//           color: const Color(0xFF00B69B),
//           rodStackItems: [],
//         ),
//       ],
//     );
//   }

//   BoxDecoration _cardStyle() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(14),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.15),
//           blurRadius: 6,
//           offset: const Offset(0, 3),
//         )
//       ],
//     );
//   }
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class RestaurantAnalyticsScreen extends StatelessWidget {
//   const RestaurantAnalyticsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final bool isWeb = width >= 950;
//     final bool isTablet = width >= 650 && width < 950;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),
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
//                         horizontal: 20, vertical: 18),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Top nav for web/tablet
//                         if (isWeb || isTablet) const TopNavBar(isWeb: true),
//                         const SizedBox(height: 25),

//                         // Page title
//                         const Text(
//                           "Analytics Dashboard",
//                           style: TextStyle(
//                               fontSize: 26, fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(height: 25),

//                         // Performance metrics card
//                         _performanceMetricsCard(),
//                         const SizedBox(height: 25),

//                         // Pie + Bar charts responsive
//                         LayoutBuilder(builder: (context, constraints) {
//                           bool wide = constraints.maxWidth > 900;
//                           if (wide) {
//                             // Horizontal layout
//                             return Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Flexible(flex: 4, child: _pieChartCard()),
//                                 const SizedBox(width: 20),
//                                 Flexible(flex: 6, child: _barChartCard()),
//                               ],
//                             );
//                           } else {
//                             // Vertical layout for mobile/tablet
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 _pieChartCard(),
//                                 const SizedBox(height: 20),
//                                 _barChartCard(),
//                               ],
//                             );
//                           }
//                         }),
//                         const SizedBox(height: 30),
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

//   Widget _performanceMetricsCard() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Row(
//         children: [
//           Expanded(
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Performance Metrics",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//                 SizedBox(height: 18),
//                 Text("Total Impressions", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Click-through Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Conversion Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Revenue Generated", style: TextStyle(fontSize: 14)),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: const [
//               Text("12.4K",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text("3.2%",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color(0xFF00B69B),
//                       fontWeight: FontWeight.bold)), // teal-green
//               SizedBox(height: 10),
//               Text("5.4%",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color(0xFF3D42DF),
//                       fontWeight: FontWeight.bold)), // blue
//               SizedBox(height: 10),
//               Text("\$2,847",
//                   style: TextStyle(
//                       fontSize: 22,
//                       color: Color(0xFFF93C65),
//                       fontWeight: FontWeight.bold)), // red
//             ],
//           ),
//         ],
//       ),
//     );
//   }


//   Widget _pieChartCard() {
//   return Container(
//     padding: const EdgeInsets.all(22),
//     decoration: _cardStyle(),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Redemptions by Deal",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 18),

//         Center(
//           child: SizedBox(
//             height: 340,   // 🔥 Increased height so wedges become bigger
//             width: 340,    // 🔥 Square so pie stays proportional
//             child: PieChart(
//               PieChartData(
//                 sectionsSpace: 4,
//                 centerSpaceRadius: 0,
//                 startDegreeOffset: -20,

//                 sections: [
//                   _pieSection(
//                     color: const Color(0xFF1D2D50),
//                     value: 25,
//                     label: "25%\nPizza Deal",
//                   ),
//                   _pieSection(
//                     color: const Color(0xFFFF8A00),
//                     value: 15,
//                     label: "15%\nAppetizer Deal",
//                   ),
//                   _pieSection(
//                     color: const Color(0xFF0070FF),
//                     value: 35,
//                     label: "35%\nPasta Special",
//                   ),
//                   _pieSection(
//                     color: const Color(0xFFFF00E0),
//                     value: 20,
//                     label: "20%\nDessert Combo",
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
// PieChartSectionData _pieSection({
//   required Color color,
//   required double value,
//   required String label,
// }) {
//   return PieChartSectionData(
//     value: value,
//     color: color,

//     radius: 130,   // 🔥 Increased from 80 → 110 (gives bigger wedges)

//     title: label,
//     titleStyle: const TextStyle(
//       color: Colors.white,
//       fontSize: 9,   // slightly bigger
//       fontWeight: FontWeight.w600,
//       height: 1.2,
//     ),

//     titlePositionPercentageOffset: 0.5,   // 🔥 Moves text more inside wedge
//   );
// }

//   Widget _barChartCard() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Expanded(
//                 child: Text("Weekly Impressions",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//               ),
//               Row(
//                 children: [
//                   _legendDot(Color(0XFFFF4B00), "Videos"),
//                   const SizedBox(width: 12),
//                   _legendDot(const Color(0xFF00B69B), "Posts"),
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 18),
//           SizedBox(
//             height: 280,
//             child: BarChart(
//               BarChartData(
//                 maxY: 520,
//                 groupsSpace: 14,
//                 barTouchData: BarTouchData(enabled: false),
//                 gridData: FlGridData(
//                   show: true,
//                   drawVerticalLine: false,
//                   getDrawingHorizontalLine: (value) => FlLine(
//                     color: Colors.grey.withOpacity(0.12),
//                     strokeWidth: 1,
//                   ),
//                 ),
//                 titlesData: FlTitlesData(
//                   leftTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 36,
//                       interval: 100,
//                       getTitlesWidget: (value, meta) {
//                         if (value % 100 == 0) {
//                           return Text(value.toInt().toString(),
//                               style: const TextStyle(fontSize: 11));
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                   topTitles: AxisTitles(),
//                   rightTitles: AxisTitles(),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: (value, meta) {
//                         const days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
//                         final idx = value.toInt();
//                         if (idx >= 0 && idx < days.length) {
//                           return Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child:
//                                 Text(days[idx], style: const TextStyle(fontSize: 12)),
//                           );
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                 ),
//                 borderData: FlBorderData(show: false),
//                 barGroups: [
//                   _makeGroup(0, 450, 220),
//                   _makeGroup(1, 330, 100),
//                   _makeGroup(2, 310, 180),
//                   _makeGroup(3, 480, 260),
//                   _makeGroup(4, 200, 140),
//                   _makeGroup(5, 390, 230),
//                   _makeGroup(6, 350, 270),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _legendDot(Color color, String label) {
//     return Row(
//       children: [
//         Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
//         const SizedBox(width: 6),
//         Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
//       ],
//     );
//   }

//   BarChartGroupData _makeGroup(int x, double leftValue, double rightValue) {
//     return BarChartGroupData(
//       x: x,
//       barsSpace: 6,
//       barRods: [
//         BarChartRodData(toY: leftValue, width: 16, borderRadius: BorderRadius.circular(6), color: Color(0XFFFF4B00)),
//         BarChartRodData(toY: rightValue, width: 16, borderRadius: BorderRadius.circular(6), color: const Color(0xFF00B69B)),
//       ],
//     );
//   }

//   BoxDecoration _cardStyle() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(14),
//       boxShadow: [
//         BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 6, offset: const Offset(0, 3)),
//       ],
//     );
//   }
// }

// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class RestaurantAnalyticsScreen extends StatelessWidget {
//   const RestaurantAnalyticsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final bool isWeb = width >= 950;
//     final bool isTablet = width >= 650 && width < 950;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),
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
//                         horizontal: 20, vertical: 18),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Top nav for web/tablet
//                         if (isWeb || isTablet) const TopNavBar(isWeb: true),
//                         const SizedBox(height: 25),

//                         // Page title
//                         const Text(
//                           "Analytics Dashboard",
//                           style: TextStyle(
//                               fontSize: 26, fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(height: 25),

//                         // Performance metrics card
//                         _performanceMetricsCard(),
//                         const SizedBox(height: 25),

//                         // Pie + Bar charts responsive
//                         LayoutBuilder(builder: (context, constraints) {
//                           bool wide = constraints.maxWidth > 900;
//                           if (wide) {
//                             // Horizontal layout
//                             return Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Flexible(flex: 4, child: _pieChartCard()),
//                                 const SizedBox(width: 20),
//                                 Flexible(flex: 6, child: _barChartCard()),
//                               ],
//                             );
//                           } else {
//                             // Vertical layout for mobile/tablet
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 _pieChartCard(),
//                                 const SizedBox(height: 20),
//                                 _barChartCard(),
//                               ],
//                             );
//                           }
//                         }),
//                         const SizedBox(height: 30),
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

//   Widget _performanceMetricsCard() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Row(
//         children: [
//           Expanded(
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Performance Metrics",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//                 SizedBox(height: 18),
//                 Text("Total Impressions", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Click-through Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Conversion Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Revenue Generated", style: TextStyle(fontSize: 14)),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: const [
//               Text("12.4K",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text("3.2%",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color(0xFF00B69B),
//                       fontWeight: FontWeight.bold)), // teal-green
//               SizedBox(height: 10),
//               Text("5.4%",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color(0xFF3D42DF),
//                       fontWeight: FontWeight.bold)), // blue
//               SizedBox(height: 10),
//               Text("\$2,847",
//                   style: TextStyle(
//                       fontSize: 22,
//                       color: Color(0xFFF93C65),
//                       fontWeight: FontWeight.bold)), // red
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ----------------- PIE CARD (DESIGNED TO MATCH SAMPLE) -----------------
//   Widget _pieChartCard() {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Responsive sizing: smaller on mobile, larger on web
//         final double chartSize = constraints.maxWidth > 600 ? 360 : 280;
//         final double radius = constraints.maxWidth > 600 ? 140 : 110;
//         final double fontSize = constraints.maxWidth > 600 ? 13 : 11;
        
//         return Container(
//           padding: const EdgeInsets.all(22),
//           decoration: _cardStyle(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Redemptions by Deal",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 18),

//               // Responsive pie chart with text inside sections
//               Center(
//                 child: SizedBox(
//                   width: chartSize,
//                   height: chartSize,
//                   child: PieChart(
//                     PieChartData(
//                       sectionsSpace: 6,
//                       centerSpaceRadius: 0,
//                       startDegreeOffset: -40,
//                       sections: [
//                         // 25% Pizza Deal — dark blue (#343C6A)
//                         PieChartSectionData(
//                           value: 25,
//                           color: const Color(0xFF343C6A),
//                           radius: radius,
//                           title: "25%\nPizza Deal",
//                           titleStyle: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             fontSize: fontSize,
//                             height: 1.2,
//                           ),
//                           titlePositionPercentageOffset: 0.42,
//                         ),

//                         // 15% Appetizer — orange (#FC7900)
//                         PieChartSectionData(
//                           value: 15,
//                           color: const Color(0xFFFC7900),
//                           radius: radius + 8,
//                           title: "15%\nAppetizer Deal",
//                           titleStyle: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             fontSize: fontSize,
//                             height: 1.2,
//                           ),
//                           titlePositionPercentageOffset: 0.40,
//                         ),

//                         // 35% Pasta — deep blue (#1814F3)
//                         PieChartSectionData(
//                           value: 35,
//                           color: const Color(0xFF1814F3),
//                           radius: radius,
//                           title: "35%\nPasta Special",
//                           titleStyle: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             fontSize: fontSize,
//                             height: 1.2,
//                           ),
//                           titlePositionPercentageOffset: 0.40,
//                         ),

//                         // 20% Dessert — magenta (#FA00FF)
//                         PieChartSectionData(
//                           value: 20,
//                           color: const Color(0xFFFA00FF),
//                           radius: radius,
//                           title: "20%\nDessert\nCombo",
//                           titleStyle: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             fontSize: fontSize,
//                             height: 1.2,
//                           ),
//                           titlePositionPercentageOffset: 0.43,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _barChartCard() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Expanded(
//                 child: Text("Weekly Impressions",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//               ),
//               Row(
//                 children: [
//                   _legendDot(Color(0XFFFF4B00), "Videos"),
//                   const SizedBox(width: 12),
//                   _legendDot(const Color(0xFF00B69B), "Posts"),
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 18),
//           SizedBox(
//             height: 280,
//             child: BarChart(
//               BarChartData(
//                 maxY: 520,
//                 groupsSpace: 14,
//                 barTouchData: BarTouchData(enabled: false),
//                 gridData: FlGridData(
//                   show: true,
//                   drawVerticalLine: false,
//                   getDrawingHorizontalLine: (value) => FlLine(
//                     color: Colors.grey.withOpacity(0.12),
//                     strokeWidth: 1,
//                   ),
//                 ),
//                 titlesData: FlTitlesData(
//                   leftTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 36,
//                       interval: 100,
//                       getTitlesWidget: (value, meta) {
//                         if (value % 100 == 0) {
//                           return Text(value.toInt().toString(),
//                               style: const TextStyle(fontSize: 11));
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                   topTitles: AxisTitles(),
//                   rightTitles: AxisTitles(),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: (value, meta) {
//                         const days = [
//                           "Sat",
//                           "Sun",
//                           "Mon",
//                           "Tue",
//                           "Wed",
//                           "Thu",
//                           "Fri"
//                         ];
//                         final idx = value.toInt();
//                         if (idx >= 0 && idx < days.length) {
//                           return Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child:
//                                 Text(days[idx], style: const TextStyle(fontSize: 12)),
//                           );
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                 ),
//                 borderData: FlBorderData(show: false),
//                 barGroups: [
//                   _makeGroup(0, 450, 220),
//                   _makeGroup(1, 330, 100),
//                   _makeGroup(2, 310, 180),
//                   _makeGroup(3, 480, 260),
//                   _makeGroup(4, 200, 140),
//                   _makeGroup(5, 390, 230),
//                   _makeGroup(6, 350, 270),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _legendDot(Color color, String label) {
//     return Row(
//       children: [
//         Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
//         const SizedBox(width: 6),
//         Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
//       ],
//     );
//   }

//   BarChartGroupData _makeGroup(int x, double leftValue, double rightValue) {
//     return BarChartGroupData(
//       x: x,
//       barsSpace: 6,
//       barRods: [
//         BarChartRodData(toY: leftValue, width: 16, borderRadius: BorderRadius.circular(6), color: Color(0XFFFF4B00)),
//         BarChartRodData(toY: rightValue, width: 16, borderRadius: BorderRadius.circular(6), color: const Color(0xFF00B69B)),
//       ],
//     );
//   }

//   BoxDecoration _cardStyle() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(14),
//       boxShadow: [
//         BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 6, offset: const Offset(0, 3)),
//       ],
//     );
//   }
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class RestaurantAnalyticsScreen extends StatelessWidget {
//   const RestaurantAnalyticsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final bool isWeb = width >= 950;
//     final bool isTablet = width >= 650 && width < 950;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),
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
//                         horizontal: 20, vertical: 18),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Top nav for web/tablet
//                         if (isWeb || isTablet) const TopNavBar(isWeb: true),
//                         const SizedBox(height: 25),

//                         // Page title
//                         const Text(
//                           "Analytics Dashboard",
//                           style: TextStyle(
//                               fontSize: 26, fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(height: 25),

//                         // Performance metrics card
//                         _performanceMetricsCard(),
//                         const SizedBox(height: 25),

//                         // Pie + Bar charts responsive
//                         LayoutBuilder(builder: (context, constraints) {
//                           bool wide = constraints.maxWidth > 900;
//                           if (wide) {
//                             // Horizontal layout
//                             return Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Flexible(flex: 4, child: _pieChartCard()),
//                                 const SizedBox(width: 20),
//                                 Flexible(flex: 6, child: _barChartCard()),
//                               ],
//                             );
//                           } else {
//                             // Vertical layout for mobile/tablet
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 _pieChartCard(),
//                                 const SizedBox(height: 20),
//                                 _barChartCard(),
//                               ],
//                             );
//                           }
//                         }),
//                         const SizedBox(height: 30),
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

//   Widget _performanceMetricsCard() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Row(
//         children: [
//           Expanded(
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Performance Metrics",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//                 SizedBox(height: 18),
//                 Text("Total Impressions", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Click-through Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Conversion Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Revenue Generated", style: TextStyle(fontSize: 14)),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: const [
//               Text("12.4K",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text("3.2%",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color(0xFF00B69B),
//                       fontWeight: FontWeight.bold)), // teal-green
//               SizedBox(height: 10),
//               Text("5.4%",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color(0xFF3D42DF),
//                       fontWeight: FontWeight.bold)), // blue
//               SizedBox(height: 10),
//               Text("\$2,847",
//                   style: TextStyle(
//                       fontSize: 22,
//                       color: Color(0xFFF93C65),
//                       fontWeight: FontWeight.bold)), // red
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ----------------- PIE CARD (DESIGNED TO MATCH SAMPLE) -----------------
//   Widget _pieChartCard() {
//   return LayoutBuilder(
//     builder: (context, constraints) {
//       final bool isMobile = constraints.maxWidth <= 600;

//       final double chartSize = isMobile ? 280 : 360;
//       final double radius = 130; // keep same as web
//       final double fontSize = isMobile ? 10 : 13;

//       // Reduce titlePositionPercentageOffset for mobile slices
//       final double pizzaOffset = isMobile ? 0.49 : 0.42;
//       final double appetizerOffset = isMobile ? 0.49 : 0.49;
//       final double pastaOffset = isMobile ? 0.49 : 0.40;
//       final double dessertOffset = isMobile ? 0.49 : 0.43;

//       return Container(
//         padding: const EdgeInsets.all(22),
//         decoration: _cardStyle(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Redemptions by Deal",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 18),
//             Center(
//               child: SizedBox(
//                 width: chartSize,
//                 height: chartSize,
//                 child: PieChart(
//                   PieChartData(
//                     sectionsSpace: 6,
//                     centerSpaceRadius: 0,
//                     startDegreeOffset: -40,
//                     sections: [
//                       PieChartSectionData(
//                         value: 25,
//                         color: const Color(0xFF343C6A),
//                         radius: radius,
//                         title: "25%\nPizza Deal",
//                         titleStyle: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w700,
//                           fontSize: fontSize,
//                           height: 1.1,
//                         ),
//                         titlePositionPercentageOffset: pizzaOffset,
//                       ),
//                       PieChartSectionData(
//                         value: 15,
//                         color: const Color(0xFFFC7900),
//                         radius: radius,
//                         title: "15%\nAppetizer\nDeal",
//                         titleStyle: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w700,
//                           fontSize: fontSize,
//                           height: 1.05,
//                         ),
//                         titlePositionPercentageOffset: appetizerOffset,
//                       ),
//                       PieChartSectionData(
//                         value: 35,
//                         color: const Color(0xFF1814F3),
//                         radius: radius,
//                         title: "35%\nPasta Special",
//                         titleStyle: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w700,
//                           fontSize: fontSize,
//                           height: 1.1,
//                         ),
//                         titlePositionPercentageOffset: pastaOffset,
//                       ),
//                       PieChartSectionData(
//                         value: 20,
//                         color: const Color(0xFFFA00FF),
//                         radius: radius,
//                         title: "20%\nDessert\nCombo",
//                         titleStyle: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w700,
//                           fontSize: fontSize,
//                           height: 1.05,
//                         ),
//                         titlePositionPercentageOffset: dessertOffset,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }


//   Widget _barChartCard() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Expanded(
//                 child: Text("Weekly Impressions",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//               ),
//               Row(
//                 children: [
//                   _legendDot(Color(0XFFFF4B00), "Videos"),
//                   const SizedBox(width: 12),
//                   _legendDot(const Color(0xFF00B69B), "Posts"),
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 18),
//           SizedBox(
//             height: 280,
//             child: BarChart(
//               BarChartData(
//                 maxY: 520,
//                 groupsSpace: 14,
//                 barTouchData: BarTouchData(enabled: false),
//                 gridData: FlGridData(
//                   show: true,
//                   drawVerticalLine: false,
//                   getDrawingHorizontalLine: (value) => FlLine(
//                     color: Colors.grey.withOpacity(0.12),
//                     strokeWidth: 1,
//                   ),
//                 ),
//                 titlesData: FlTitlesData(
//                   leftTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 36,
//                       interval: 100,
//                       getTitlesWidget: (value, meta) {
//                         if (value % 100 == 0) {
//                           return Text(value.toInt().toString(),
//                               style: const TextStyle(fontSize: 11));
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                   topTitles: AxisTitles(),
//                   rightTitles: AxisTitles(),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: (value, meta) {
//                         const days = [
//                           "Sat",
//                           "Sun",
//                           "Mon",
//                           "Tue",
//                           "Wed",
//                           "Thu",
//                           "Fri"
//                         ];
//                         final idx = value.toInt();
//                         if (idx >= 0 && idx < days.length) {
//                           return Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child:
//                                 Text(days[idx], style: const TextStyle(fontSize: 12)),
//                           );
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                 ),
//                 borderData: FlBorderData(show: false),
//                 barGroups: [
//                   _makeGroup(0, 450, 220),
//                   _makeGroup(1, 330, 100),
//                   _makeGroup(2, 310, 180),
//                   _makeGroup(3, 480, 260),
//                   _makeGroup(4, 200, 140),
//                   _makeGroup(5, 390, 230),
//                   _makeGroup(6, 350, 270),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _legendDot(Color color, String label) {
//     return Row(
//       children: [
//         Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
//         const SizedBox(width: 6),
//         Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
//       ],
//     );
//   }

//   BarChartGroupData _makeGroup(int x, double leftValue, double rightValue) {
//     return BarChartGroupData(
//       x: x,
//       barsSpace: 6,
//       barRods: [
//         BarChartRodData(toY: leftValue, width: 16, borderRadius: BorderRadius.circular(6), color: Color(0XFFFF4B00)),
//         BarChartRodData(toY: rightValue, width: 16, borderRadius: BorderRadius.circular(6), color: const Color(0xFF00B69B)),
//       ],
//     );
//   }

//   BoxDecoration _cardStyle() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(14),
//       boxShadow: [
//         BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 6, offset: const Offset(0, 3)),
//       ],
//     );
//   }
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class RestaurantAnalyticsScreen extends StatelessWidget {
//   const RestaurantAnalyticsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final bool isWeb = width >= 950;
//     final bool isTablet = width >= 650 && width < 950;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               toolbarHeight: 70,
//               titleSpacing: 0,
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
//             /// --- LEFT SIDEBAR (WEB/TABLET) ---
//             if (isWeb || isTablet)
//               LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),

//             /// --- MAIN CONTENT AREA ---
//             Expanded(
//               child: Column(
//                 children: [
//                   /// --- TOP NAVBAR STICKY ALWAYS ----
//                   if (isWeb || isTablet)
//                     const SizedBox(
//                       height: 70, // fixed height same as dashboard
//                       child: TopNavBar(isWeb: true),
//                     ),

//                   /// --- SCROLLABLE CONTENT BELOW ---
//                   Expanded(
//                     child: Center(
//                       child: ConstrainedBox(
//                         constraints: const BoxConstraints(maxWidth: 1200),
//                         child: SingleChildScrollView(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(height: 10),

//                               /// PAGE TITLE
//                               const Text(
//                                 "Analytics Dashboard",
//                                 style: TextStyle(
//                                     fontSize: 26, fontWeight: FontWeight.w600),
//                               ),
//                               const SizedBox(height: 25),

//                               _performanceMetricsCard(),
//                               const SizedBox(height: 25),

//                               /// RESPONSIVE PIE + BAR CHARTS
//                               LayoutBuilder(builder: (context, c) {
//                                 bool wide = c.maxWidth > 900;

//                                 if (wide) {
//                                   return Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Flexible(
//                                           flex: 4, child: _pieChartCard()),
//                                       const SizedBox(width: 20),
//                                       Flexible(
//                                           flex: 6, child: _barChartCard()),
//                                     ],
//                                   );
//                                 }

//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     _pieChartCard(),
//                                     const SizedBox(height: 20),
//                                     _barChartCard(),
//                                   ],
//                                 );
//                               }),

//                               const SizedBox(height: 30),
//                             ],
//                           ),
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

//   /// -------------------------------------------------------
//   /// PERFORMANCE CARD
//   /// -------------------------------------------------------
//   Widget _performanceMetricsCard() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Row(
//         children: [
//           Expanded(
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Performance Metrics",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//                 SizedBox(height: 18),
//                 Text("Total Impressions", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Click-through Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Conversion Rate", style: TextStyle(fontSize: 14)),
//                 SizedBox(height: 12),
//                 Text("Revenue Generated", style: TextStyle(fontSize: 14)),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: const [
//               Text("12.4K",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text("3.2%",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color(0xFF00B69B),
//                       fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text("5.4%",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color(0xFF3D42DF),
//                       fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text("\$2,847",
//                   style: TextStyle(
//                       fontSize: 22,
//                       color: Color(0xFFF93C65),
//                       fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   /// -------------------------------------------------------
//   /// PIE CHART CARD
//   /// -------------------------------------------------------
//   Widget _pieChartCard() {
//     return LayoutBuilder(
//       builder: (context, c) {
//         final bool mobile = c.maxWidth <= 600;

//         final double chartSize = mobile ? 280 : 360;
//         final double radius = 130;
//         final double fontSize = mobile ? 10 : 13;

//         final double pizzaOffset = mobile ? 0.49 : 0.42;
//         final double appetizerOffset = mobile ? 0.49 : 0.49;
//         final double pastaOffset = mobile ? 0.49 : 0.40;
//         final double dessertOffset = mobile ? 0.49 : 0.43;

//         return Container(
//           padding: const EdgeInsets.all(22),
//           decoration: _cardStyle(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Redemptions by Deal",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 18),

//               Center(
//                 child: SizedBox(
//                   width: chartSize,
//                   height: chartSize,
//                   child: PieChart(
//                     PieChartData(
//                       sectionsSpace: 6,
//                       centerSpaceRadius: 0,
//                       startDegreeOffset: -40,
//                       sections: [
//                         PieChartSectionData(
//                           value: 25,
//                           color: const Color(0xFF343C6A),
//                           radius: radius,
//                           title: "25%\nPizza Deal",
//                           titleStyle: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                               fontSize: fontSize),
//                           titlePositionPercentageOffset: pizzaOffset,
//                         ),
//                         PieChartSectionData(
//                           value: 15,
//                           color: const Color(0xFFFC7900),
//                           radius: radius,
//                           title: "15%\nAppetizer\nDeal",
//                           titleStyle: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                               fontSize: fontSize),
//                           titlePositionPercentageOffset: appetizerOffset,
//                         ),
//                         PieChartSectionData(
//                           value: 35,
//                           color: const Color(0xFF1814F3),
//                           radius: radius,
//                           title: "35%\nPasta Special",
//                           titleStyle: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                               fontSize: fontSize),
//                           titlePositionPercentageOffset: pastaOffset,
//                         ),
//                         PieChartSectionData(
//                           value: 20,
//                           color: const Color(0xFFFA00FF),
//                           radius: radius,
//                           title: "20%\nDessert\nCombo",
//                           titleStyle: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                               fontSize: fontSize),
//                           titlePositionPercentageOffset: dessertOffset,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   /// -------------------------------------------------------
//   /// BAR CHART CARD

//  Widget _barChartCard() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: _cardStyle(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Expanded(
//                 child: Text("Weekly Impressions",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//               ),
//               Row(
//                 children: [
//                   _legendDot(Color(0XFFFF4B00), "Videos"),
//                   const SizedBox(width: 12),
//                   _legendDot(const Color(0xFF00B69B), "Posts"),
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 18),
//           SizedBox(
//             height: 280,
//             child: BarChart(
//               BarChartData(
//                 maxY: 520,
//                 groupsSpace: 14,
//                 barTouchData: BarTouchData(enabled: false),
//                 gridData: FlGridData(
//                   show: true,
//                   drawVerticalLine: false,
//                   getDrawingHorizontalLine: (value) => FlLine(
//                     color: Colors.grey.withOpacity(0.12),
//                     strokeWidth: 1,
//                   ),
//                 ),
//                 titlesData: FlTitlesData(
//                   leftTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 36,
//                       interval: 100,
//                       getTitlesWidget: (value, meta) {
//                         if (value % 100 == 0) {
//                           return Text(value.toInt().toString(),
//                               style: const TextStyle(fontSize: 11));
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                   topTitles: AxisTitles(),
//                   rightTitles: AxisTitles(),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: (value, meta) {
//                         const days = [
//                           "Sat",
//                           "Sun",
//                           "Mon",
//                           "Tue",
//                           "Wed",
//                           "Thu",
//                           "Fri"
//                         ];
//                         final idx = value.toInt();
//                         if (idx >= 0 && idx < days.length) {
//                           return Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child:
//                                 Text(days[idx], style: const TextStyle(fontSize: 12)),
//                           );
//                         }
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                 ),
//                 borderData: FlBorderData(show: false),
//                 barGroups: [
//                   _makeGroup(0, 450, 220),
//                   _makeGroup(1, 330, 100),
//                   _makeGroup(2, 310, 180),
//                   _makeGroup(3, 480, 260),
//                   _makeGroup(4, 200, 140),
//                   _makeGroup(5, 390, 230),
//                   _makeGroup(6, 350, 270),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _legendDot(Color color, String label) {
//     return Row(
//       children: [
//         Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
//         const SizedBox(width: 6),
//         Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
//       ],
//     );
//   }

//   BarChartGroupData _makeGroup(int x, double leftValue, double rightValue) {
//     return BarChartGroupData(
//       x: x,
//       barsSpace: 6,
//       barRods: [
//         BarChartRodData(toY: leftValue, width: 16, borderRadius: BorderRadius.circular(6), color: Color(0XFFFF4B00)),
//         BarChartRodData(toY: rightValue, width: 16, borderRadius: BorderRadius.circular(6), color: const Color(0xFF00B69B)),
//       ],
//     );
//   }

//   BoxDecoration _cardStyle() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(14),
//       boxShadow: [
//         BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 6, offset: const Offset(0, 3)),
//       ],
//     );
//   }
// }
import 'package:dealdine_application/widgets/left_sidebar.dart';
import 'package:dealdine_application/widgets/top_navbar.dart';
import 'package:dealdine_application/widgets/mobile_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RestaurantAnalyticsScreen extends StatelessWidget {
  const RestaurantAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isWeb = width >= 950;
    final bool isTablet = width >= 650 && width < 950;
    final bool isMobile = !isWeb && !isTablet;

    return Scaffold(
      backgroundColor: const Color(0xFFDEDECC),

      // --------------------------
      // MOBILE APPBAR + DRAWER
      // --------------------------
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile ? Drawer(child: LeftSidebar(width: 220, showLabels: true)) : null,

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // LEFT SIDEBAR (Web/Tablet)
          if (isWeb || isTablet)
            LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),

          // MAIN CONTENT
          Expanded(
            child: Column(
              children: [
                // TOP NAVBAR (Web/Tablet)
                if (!isMobile)
                  const SizedBox(
                    height: 70,
                    child: TopNavBar(isWeb: true),
                  ),

                // SEARCH FIELD BELOW APPBAR (Mobile Only)
                if (isMobile)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search analytics...',
                        prefixIcon: const Icon(Icons.search),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 1),
                            const Text(
                              "Analytics Dashboard",
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 25),

                            _performanceMetricsCard(),
                            const SizedBox(height: 25),

                            // RESPONSIVE PIE + BAR CHARTS
                            LayoutBuilder(builder: (context, c) {
                              bool wide = c.maxWidth > 900;

                              if (wide) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(flex: 4, child: _pieChartCard()),
                                    const SizedBox(width: 20),
                                    Flexible(flex: 6, child: _barChartCard()),
                                  ],
                                );
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _pieChartCard(),
                                  const SizedBox(height: 20),
                                  _barChartCard(),
                                ],
                              );
                            }),
                            const SizedBox(height: 30),
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
    );
  }

  // ---------------- PERFORMANCE METRICS CARD ----------------
  Widget _performanceMetricsCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: _cardStyle(),
      child: Row(
        children: [
          Expanded(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Performance Metrics", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 18),
                Text("Total Impressions", style: TextStyle(fontSize: 14)),
                SizedBox(height: 12),
                Text("Click-through Rate", style: TextStyle(fontSize: 14)),
                SizedBox(height: 12),
                Text("Conversion Rate", style: TextStyle(fontSize: 14)),
                SizedBox(height: 12),
                Text("Revenue Generated", style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text("12.4K", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("3.2%", style: TextStyle(fontSize: 20, color: Color(0xFF00B69B), fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("5.4%", style: TextStyle(fontSize: 20, color: Color(0xFF3D42DF), fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("\$2,847", style: TextStyle(fontSize: 22, color: Color(0xFFF93C65), fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- PIE CHART CARD ----------------
  Widget _pieChartCard() {
    return LayoutBuilder(
      builder: (context, c) {
        final bool mobile = c.maxWidth <= 600;
        final double chartSize = mobile ? 280 : 360;
        final double radius = 130;
        final double fontSize = mobile ? 10 : 13;

        final double pizzaOffset = mobile ? 0.49 : 0.42;
        final double appetizerOffset = mobile ? 0.49 : 0.49;
        final double pastaOffset = mobile ? 0.49 : 0.40;
        final double dessertOffset = mobile ? 0.49 : 0.43;

        return Container(
          padding: const EdgeInsets.all(22),
          decoration: _cardStyle(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Redemptions by Deal", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 18),
              Center(
                child: SizedBox(
                  width: chartSize,
                  height: chartSize,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 6,
                      centerSpaceRadius: 0,
                      startDegreeOffset: -40,
                      sections: [
                        PieChartSectionData(
                          value: 25,
                          color: const Color(0xFF343C6A),
                          radius: radius,
                          title: "25%\nPizza Deal",
                          titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: fontSize),
                          titlePositionPercentageOffset: pizzaOffset,
                        ),
                        PieChartSectionData(
                          value: 15,
                          color: const Color(0xFFFC7900),
                          radius: radius,
                          title: "15%\nAppetizer\nDeal",
                          titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: fontSize),
                          titlePositionPercentageOffset: appetizerOffset,
                        ),
                        PieChartSectionData(
                          value: 35,
                          color: const Color(0xFF1814F3),
                          radius: radius,
                          title: "35%\nPasta Special",
                          titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: fontSize),
                          titlePositionPercentageOffset: pastaOffset,
                        ),
                        PieChartSectionData(
                          value: 20,
                          color: const Color(0xFFFA00FF),
                          radius: radius,
                          title: "20%\nDessert\nCombo",
                          titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: fontSize),
                          titlePositionPercentageOffset: dessertOffset,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ---------------- BAR CHART CARD ----------------
  Widget _barChartCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: _cardStyle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text("Weekly Impressions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              Row(
                children: [
                  _legendDot(Color(0XFFFF4B00), "Videos"),
                  const SizedBox(width: 12),
                  _legendDot(const Color(0xFF00B69B), "Posts"),
                ],
              )
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 280,
            child: BarChart(
              BarChartData(
                maxY: 520,
                groupsSpace: 14,
                barTouchData: BarTouchData(enabled: false),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.withOpacity(0.12), strokeWidth: 1),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 36,
                      interval: 100,
                      getTitlesWidget: (value, meta) {
                        if (value % 100 == 0) return Text(value.toInt().toString(), style: const TextStyle(fontSize: 11));
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  topTitles: AxisTitles(),
                  rightTitles: AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ["Sat","Sun","Mon","Tue","Wed","Thu","Fri"];
                        final idx = value.toInt();
                        if (idx >= 0 && idx < days.length) return Padding(padding: const EdgeInsets.only(top: 8.0), child: Text(days[idx], style: const TextStyle(fontSize: 12)));
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _makeGroup(0, 450, 220),
                  _makeGroup(1, 330, 100),
                  _makeGroup(2, 310, 180),
                  _makeGroup(3, 480, 260),
                  _makeGroup(4, 200, 140),
                  _makeGroup(5, 390, 230),
                  _makeGroup(6, 350, 270),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
      ],
    );
  }

  BarChartGroupData _makeGroup(int x, double leftValue, double rightValue) {
    return BarChartGroupData(
      x: x,
      barsSpace: 6,
      barRods: [
        BarChartRodData(toY: leftValue, width: 16, borderRadius: BorderRadius.circular(6), color: Color(0XFFFF4B00)),
        BarChartRodData(toY: rightValue, width: 16, borderRadius: BorderRadius.circular(6), color: const Color(0xFF00B69B)),
      ],
    );
  }

  BoxDecoration _cardStyle() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 6, offset: const Offset(0, 3))],
    );
  }
}
