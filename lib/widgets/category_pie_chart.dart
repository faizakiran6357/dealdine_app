import 'package:flutter/material.dart';

class CategoryPieChart extends StatelessWidget {
  const CategoryPieChart({super.key});

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
            "Restaurant Categories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: isMobile ? 15 : 20),

          /// ------------------------------
          ///  Custom Pie Chart Added
          /// ------------------------------
          SizedBox(
            height: isMobile ? 140 : 170,
            child: Center(
              child: CustomPaint(
                size: Size(isMobile ? 140 : 170, isMobile ? 140 : 170),
                painter: _PieChartPainter(),
              ),
            ),
          ),

          SizedBox(height: isMobile ? 12 : 18),

          // Legend - Row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(
                child: _LegendEntry(
                  color: Colors.orange,
                  label: "Fast Food (35%)",
                  value: "12,423",
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _LegendEntry(
                  color: Colors.orangeAccent,
                  label: "Fine Dining (25%)",
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
                  label: "Casual Dining (30%)",
                  value: "12,423",
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _LegendEntry(
                  color: Colors.amber,
                  label: "Cafe (10%)",
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

/// 🎨 EXACT SAME PIE CHART FROM IMAGE
class _PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final double start = -90;

    // EXACT SAME COLORS & PERCENTAGES
    final segments = [
      {"color": Colors.orange, "percent": 35},
      {"color": Colors.blueGrey.shade900, "percent": 30},
      {"color": Colors.orangeAccent, "percent": 10},
      {"color": Colors.amber, "percent": 25},
    ];

    double currentAngle = start;

    for (var seg in segments) {
      final sweep = 360 * (seg["percent"] as int) / 100;

      paint.color = seg["color"] as Color;

      canvas.drawArc(
        rect,
        currentAngle * (3.14159 / 180),
        sweep * (3.14159 / 180),
        true,
        paint,
      );

      currentAngle += sweep;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}