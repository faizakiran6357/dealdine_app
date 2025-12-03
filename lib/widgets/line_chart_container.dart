import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartContainer extends StatelessWidget {
  const LineChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 500;

    return Container(
      height: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _SectionTitle(),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _MonthDropdown(),
                ),
              ],
            )
          else
            Row(
              children: const [
                Expanded(child: _SectionTitle()),
                SizedBox(width: 12),
                _MonthDropdown(),
              ],
            ),

          const SizedBox(height: 20),

          // Chart Section
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Make chart responsive based on available width
                final chartWidth = isMobile ? screenWidth * 2 : constraints.maxWidth;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: chartWidth,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        // Background Asset Image
                        Positioned.fill(
                          child: Image.asset(
                            "assets/graph.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        // LineChart Overlay
                        LineChart(
                          LineChartData(
                            minX: 0,
                            maxX: 13,
                            minY: 0,
                            maxY: 100,
                            gridData: FlGridData(
                              show: true,
                              horizontalInterval: 20,
                              getDrawingHorizontalLine: (value) => FlLine(
                                color: Colors.grey.shade300,
                                strokeWidth: 1,
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            titlesData: FlTitlesData(
                              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 40,
                                  interval: 20,
                                  getTitlesWidget: (value, meta) {
                                    if (value < 20) return const SizedBox();
                                    return Text(
                                      "${value.toInt()}%",
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                                    );
                                  },
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 30,
                                  interval: 1,
                                  getTitlesWidget: (value, meta) {
                                    switch (value.toInt()) {
                                      case 1:
                                        return const Text("5k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 2:
                                        return const Text("10k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 3:
                                        return const Text("15k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 4:
                                        return const Text("20k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 5:
                                        return const Text("25k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 6:
                                        return const Text("30k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 7:
                                        return const Text("35k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 8:
                                        return const Text("40k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 9:
                                        return const Text("45k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 10:
                                        return const Text("50k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 11:
                                        return const Text("55k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                      case 12:
                                        return const Text("60k", style: TextStyle(fontSize: 12, color: Colors.grey));
                                    }
                                    return const SizedBox();
                                  },
                                ),
                              ),
                            ),
                            lineBarsData: [],
                            lineTouchData: LineTouchData(enabled: false),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Revenue & Deals Trend",
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _MonthDropdown extends StatelessWidget {
  const _MonthDropdown();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "October",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 6),
          Icon(
            Icons.keyboard_arrow_down,
            size: 18,
            color: Colors.grey.shade700,
          ),
        ],
      ),
    );
  }
}