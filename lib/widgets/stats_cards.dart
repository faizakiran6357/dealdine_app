
import 'package:flutter/material.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _StatCard(
            title: "Total Restaurants",
            value: "2400",
            percentage: "+8.5%",
            iconAsset: "assets/total_hotel.png",
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: _StatCard(
            title: "Active Deals",
            value: "10293",
            percentage: "+1.3%",
            iconAsset: "assets/active_deals.png",
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: _StatCard(
            title: "Video Content",
            value: "200",
            percentage: "-4.3%",
            iconAsset: "assets/video_content.png",
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: _StatCard(
            title: "Approval Rate",
            value: "6.8%",
            percentage: "+1.8%",
            iconAsset: "assets/approval_rate.png",
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title, value, percentage, iconAsset;

  const _StatCard({
    required this.title,
    required this.value,
    required this.percentage,
    required this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
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
          // ---- Asset icon instead of Flutter icon ----
          Image.asset(
            iconAsset,
            height: 32,
            width: 32,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          Text(
            percentage,
            style: TextStyle(
              fontSize: 13,
              color: percentage.contains('-')
                  ? Colors.red
                  : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
