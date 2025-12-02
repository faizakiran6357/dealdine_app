// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class CityPieChart extends StatelessWidget {
//   const CityPieChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 320,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Register Restaurant Cities",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 50),
//           Expanded(
//             child: PieChart(
//               PieChartData(
//                 sectionsSpace: 0,
//                 centerSpaceRadius: 20,
//                 sections: [
//                   PieChartSectionData(
//                       value: 40, 
//                       color: Colors.orange, 
//                       radius: 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 30, 
//                       color: Colors.blueGrey, 
//                       radius: 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 20, 
//                       color: Colors.yellow, 
//                       radius: 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 10, 
//                       color: Colors.green, 
//                       radius: 60,
//                       showTitle: false),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 65),
//           // Legend
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // City 1 (40%)
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 12,
//                           height: 12,
//                           decoration: BoxDecoration(
//                             color: Colors.orange,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         const Text(
//                           "Lahore",
//                           style: TextStyle(fontSize: 12, color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18),
//                       child: Text(
//                         "12,423",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // City 2 (20%)
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 12,
//                           height: 12,
//                           decoration: BoxDecoration(
//                             color: Colors.yellow,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         const Text(
//                           "Karachi",
//                           style: TextStyle(fontSize: 12, color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18),
//                       child: Text(
//                         "12,423",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // City 3 (30%)
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 12,
//                           height: 12,
//                           decoration: BoxDecoration(
//                             color: Colors.blueGrey,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         const Text(
//                           "Islamabad",
//                           style: TextStyle(fontSize: 12, color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18),
//                       child: Text(
//                         "12,423",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // City 4 (10%)
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 12,
//                           height: 12,
//                           decoration: BoxDecoration(
//                             color: Colors.green,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         const Text(
//                           "Others",
//                           style: TextStyle(fontSize: 12, color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18),
//                       child: Text(
//                         "12,423",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class CityPieChart extends StatelessWidget {
//   const CityPieChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final bool isMobile = screenWidth < 600;

//     return Container(
//       height: isMobile ? 280 : 320, // Mobile ke liye height reduce
//       padding: EdgeInsets.all(isMobile ? 15 : 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Register Restaurant Cities",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: isMobile ? 20 : 50), // Mobile spacing reduce
//           Expanded(
//             child: PieChart(
//               PieChartData(
//                 sectionsSpace: 0,
//                 centerSpaceRadius: isMobile ? 15 : 20,
//                 sections: [
//                   PieChartSectionData(
//                       value: 40,
//                       color: Colors.orange,
//                       radius: isMobile ? 50 : 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 30,
//                       color: Colors.blueGrey,
//                       radius: isMobile ? 50 : 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 20,
//                       color: Colors.yellow,
//                       radius: isMobile ? 50 : 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 10,
//                       color: Colors.green,
//                       radius: isMobile ? 50 : 60,
//                       showTitle: false),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: isMobile ? 40 : 65), // Mobile spacing reduce
//           // Legend
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 12,
//                           height: 12,
//                           decoration: BoxDecoration(
//                             color: Colors.orange,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         const Text(
//                           "Lahore",
//                           style: TextStyle(fontSize: 12, color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18),
//                       child: Text(
//                         "12,423",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 12,
//                           height: 12,
//                           decoration: BoxDecoration(
//                             color: Colors.yellow,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         const Text(
//                           "Karachi",
//                           style: TextStyle(fontSize: 12, color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18),
//                       child: Text(
//                         "12,423",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: isMobile ? 12 : 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 12,
//                           height: 12,
//                           decoration: BoxDecoration(
//                             color: Colors.blueGrey,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         const Text(
//                           "Islamabad",
//                           style: TextStyle(fontSize: 12, color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18),
//                       child: Text(
//                         "12,423",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 12,
//                           height: 12,
//                           decoration: BoxDecoration(
//                             color: Colors.green,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         const Text(
//                           "Others",
//                           style: TextStyle(fontSize: 12, color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18),
//                       child: Text(
//                         "12,423",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class CityPieChart extends StatelessWidget {
//   const CityPieChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final bool isMobile = screenWidth < 600;

//     return Container(
//       height: isMobile ? 260 : 320, // Mobile ke liye height reduce
//       padding: EdgeInsets.all(isMobile ? 15 : 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Register Restaurant Cities",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: isMobile ? 15 : 50), // Mobile spacing reduce
//           Expanded(
//             child: PieChart(
//               PieChartData(
//                 sectionsSpace: 0,
//                 centerSpaceRadius: isMobile ? 12 : 20,
//                 sections: [
//                   PieChartSectionData(
//                       value: 40,
//                       color: Colors.orange,
//                       radius: isMobile ? 45 : 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 30,
//                       color: Colors.blueGrey,
//                       radius: isMobile ? 45 : 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 20,
//                       color: Colors.yellow,
//                       radius: isMobile ? 45 : 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 10,
//                       color: Colors.green,
//                       radius: isMobile ? 45 : 60,
//                       showTitle: false),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: isMobile ? 30 : 65), // Mobile spacing reduce
//           // Legend - Top Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildLegendItem(Colors.orange, "Lahore", "12,423"),
//               _buildLegendItem(Colors.yellow, "Karachi", "12,423"),
//             ],
//           ),
//           SizedBox(height: isMobile ? 10 : 12),
//           // Legend - Bottom Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildLegendItem(Colors.blueGrey, "Islamabad", "12,423"),
//               _buildLegendItem(Colors.green, "Others", "12,423"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLegendItem(Color color, String label, String value) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 12,
//                 height: 12,
//                 decoration: BoxDecoration(
//                   color: color,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               const SizedBox(width: 6),
//               Flexible(
//                 child: Text(
//                   label,
//                   style: const TextStyle(fontSize: 12, color: Colors.black87),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 18, top: 2),
//             child: Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class CityPieChart extends StatelessWidget {
//   const CityPieChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final bool isMobile = screenWidth < 600;

//     return Container(
//       height: isMobile ? 280 : 320, // Mobile ke liye height adjust
//       padding: EdgeInsets.all(isMobile ? 12 : 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Register Restaurant Cities",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: isMobile ? 10 : 50), // Mobile spacing reduce
//           Expanded(
//             child: PieChart(
//               PieChartData(
//                 sectionsSpace: 0,
//                 centerSpaceRadius: isMobile ? 10 : 20,
//                 sections: [
//                   PieChartSectionData(
//                       value: 40,
//                       color: Colors.orange,
//                       radius: isMobile ? 40 : 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 30,
//                       color: Colors.blueGrey,
//                       radius: isMobile ? 40 : 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 20,
//                       color: Colors.yellow,
//                       radius: isMobile ? 40 : 60,
//                       showTitle: false),
//                   PieChartSectionData(
//                       value: 10,
//                       color: Colors.green,
//                       radius: isMobile ? 40 : 60,
//                       showTitle: false),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: isMobile ? 20 : 65), // Mobile spacing reduce
//           // Legend - Top Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildLegendItem(Colors.orange, "Lahore", "12,423"),
//               _buildLegendItem(Colors.yellow, "Karachi", "12,423"),
//             ],
//           ),
//           SizedBox(height: isMobile ? 8 : 12),
//           // Legend - Bottom Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildLegendItem(Colors.blueGrey, "Islamabad", "12,423"),
//               _buildLegendItem(Colors.green, "Others", "12,423"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLegendItem(Color color, String label, String value) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 12,
//                 height: 12,
//                 decoration: BoxDecoration(
//                   color: color,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               const SizedBox(width: 6),
//               Flexible(
//                 child: Text(
//                   label,
//                   style: const TextStyle(fontSize: 12, color: Colors.black87),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 18, top: 2),
//             child: Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class CityPieChart extends StatelessWidget {
//   const CityPieChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final bool isMobile = screenWidth < 600;

//     return Container(
//       height: isMobile ? 280 : 320, // Mobile ke liye adjust
//       padding: EdgeInsets.all(isMobile ? 12 : 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Register Restaurant Cities",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: isMobile ? 10 : 25), // Web spacing reduce
//           Expanded(
//             child: Center(
//               child: SizedBox(
//                 height: isMobile ? 150 : 180,
//                 width: isMobile ? 150 : 180,
//                 child: PieChart(
//                   PieChartData(
//                     sectionsSpace: 0,
//                     centerSpaceRadius: isMobile ? 12 : 20,
//                     sections: [
//                       PieChartSectionData(
//                           value: 40,
//                           color: Colors.orange,
//                           radius: isMobile ? 40 : 60,
//                           showTitle: false),
//                       PieChartSectionData(
//                           value: 30,
//                           color: Colors.blueGrey,
//                           radius: isMobile ? 40 : 60,
//                           showTitle: false),
//                       PieChartSectionData(
//                           value: 20,
//                           color: Colors.yellow,
//                           radius: isMobile ? 40 : 60,
//                           showTitle: false),
//                       PieChartSectionData(
//                           value: 10,
//                           color: Colors.green,
//                           radius: isMobile ? 40 : 60,
//                           showTitle: false),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: isMobile ? 18 : 25),
//           // Legend - Top Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildLegendItem(Colors.orange, "Lahore", "12,423"),
//               _buildLegendItem(Colors.yellow, "Karachi", "12,423"),
//             ],
//           ),
//           SizedBox(height: isMobile ? 8 : 12),
//           // Legend - Bottom Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildLegendItem(Colors.blueGrey, "Islamabad", "12,423"),
//               _buildLegendItem(Colors.green, "Others", "12,423"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLegendItem(Color color, String label, String value) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 12,
//                 height: 12,
//                 decoration: BoxDecoration(
//                   color: color,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               const SizedBox(width: 6),
//               Flexible(
//                 child: Text(
//                   label,
//                   style: const TextStyle(fontSize: 12, color: Colors.black87),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 18, top: 2),
//             child: Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CityPieChart extends StatelessWidget {
  const CityPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      constraints: BoxConstraints(minHeight: isMobile ? 280 : 320),
      padding: EdgeInsets.all(isMobile ? 15 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Register Restaurant Cities",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: isMobile ? 15 : 20), // Spacing title-PieChart
          SizedBox(
            height: isMobile ? 140 : 170, // Web card size same as CategoryPieChart
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: isMobile ? 30 : 40,
                sections: [
                  PieChartSectionData(
                      value: 40,
                      color: Colors.orange,
                      radius: isMobile ? 38 : 42,
                      showTitle: false),
                  PieChartSectionData(
                      value: 30,
                      color: Colors.blueGrey,
                      radius: isMobile ? 38 : 42,
                      showTitle: false),
                  PieChartSectionData(
                      value: 20,
                      color: Colors.yellow,
                      radius: isMobile ? 38 : 42,
                      showTitle: false),
                  PieChartSectionData(
                      value: 10,
                      color: Colors.green,
                      radius: isMobile ? 38 : 42,
                      showTitle: false),
                ],
              ),
            ),
          ),
          SizedBox(height: isMobile ? 12 : 18), // Chart-Legend spacing
          // Legend - Row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(
                child: _LegendEntry(
                  color: Colors.orange,
                  label: "Lahore (40%)",
                  value: "12,423",
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _LegendEntry(
                  color: Colors.yellow,
                  label: "Karachi (20%)",
                  value: "12,423",
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 8 : 12),
          // Legend - Row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(
                child: _LegendEntry(
                  color: Colors.blueGrey,
                  label: "Islamabad (30%)",
                  value: "12,423",
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _LegendEntry(
                  color: Colors.green,
                  label: "Others (10%)",
                  value: "12,423",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendEntry extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const _LegendEntry({
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 220),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 4),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
