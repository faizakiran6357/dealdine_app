
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final List<Map<String, String>> notifications = [
    {
      "title": "Pizza Feast",
      "subtitle": "Placed a new deal",
      "time": "20 min ago",
      "avatar":
          "http://e7.pngegg.com/pngimages/544/160/png-clipart-pizza-hut-restaurant-pizza-delivery-pizza-food-cheese-thumbnail.png",
      "box_info": "new",
    },
    {
      "title": "Burger Point",
      "subtitle": "5 burger deal expire",
      "time": "20 min ago",
      "avatar":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?w=400",
      "box_info": "5",
    },
    {
      "title": "Sandwich Point",
      "subtitle": "Sandwich deal expire",
      "time": "20 min ago",
      "avatar":
          "https://www.cookedbyjulie.com/wp-content/uploads/2025/06/chicken-club-sandwiches-one-500x500.jpg",
      "box_info": "5",
    },
    {
      "title": "BBQ Plater",
      "subtitle": "BBQ new deal expire",
      "time": "20 min ago",
      "avatar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ka-uKuCtT9PK9XJkVVHv9Gj6-iFf5ZqmhQ&s",
      "box_info": "5",
    },
    {
      "title": "Pizza Point",
      "subtitle": " Large pizza deal expire",
      "time": "20 min ago",
      "avatar":
          "https://media.istockphoto.com/id/521403691/photo/hot-homemade-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=PaISuuHcJWTEVoDKNnxaHy7L2BTUkyYZ06hYgzXmTbo=",
      "box_info": "5",
    },
  ];

  String subtitleWithLastWordOnNextLine(String subtitle) {
    final parts = subtitle.trim().split(RegExp(r'\s+'));
    if (parts.length <= 1) return subtitle;
    final last = parts.removeLast();
    return '${parts.join(' ')}\n$last';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 36),

              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final item = notifications[index];
                    final subtitleRaw = item["subtitle"] ?? "";
                    final subtitleFormatted =
                        subtitleWithLastWordOnNextLine(subtitleRaw);

                    final words = subtitleRaw.split(RegExp(r'\s+'));
                    final lastWord = words.isNotEmpty ? words.last : "";
                    final firstLineWords =
                        words.length > 1 ? words.sublist(0, words.length - 1) : words;
                    final firstLine = firstLineWords.join(" ");

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: const Color(0xFFEBEEF2),
                            backgroundImage: NetworkImage(item["avatar"]!),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${item["title"]} ",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF1B1B1B),
                                        ),
                                      ),
                                      TextSpan(
                                        text: firstLine,
                                        style: const TextStyle(
                                          fontSize: 17, // SAME SIZE
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF646982), // LIGHTER
                                        ),
                                      ),
                                    ],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                ),

                                if (words.length > 1)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                                    child: Text(
                                      lastWord,
                                      style: const TextStyle(
                                        fontSize: 13, // SAME SIZE
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF646982), // LIGHTER
                                      ),
                                    ),
                                  )
                                else
                                  const SizedBox(height: 6),

                                Text(
                                  item["time"] ?? "",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 12),

                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6EAF0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.local_offer_outlined,
                                    size: 18,
                                    color: Color(0xFF7F8B99),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item["box_info"] ?? "",
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF7F8B99),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
