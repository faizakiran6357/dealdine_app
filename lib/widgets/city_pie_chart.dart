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