import 'package:flutter/material.dart';
import 'package:dealdine_application/features/restaurant/presentation/restaurant_detail_screen.dart';
import 'package:dealdine_application/widgets/primary_button.dart';

class AllRestaurantsScreen extends StatelessWidget {
  const AllRestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "All Restaurants",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: 8, // Repeat Panda Express 8 times
        separatorBuilder: (_, __) => const SizedBox(height: 18),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RestaurantDetailScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Image + Name + Deal + Off + BBB
                  Row(
                    children: [
                      Image.asset("assets/resto.png", width: 65),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Panda Express",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              "Coffee + Pasta Combo",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 10),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Image.asset("assets/off.png", height: 30),
                          ],
                        ),
                      ),
                      Image.asset("assets/bbb.png", width: 60),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Button + Heart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 235,
                        height: 42,
                        child: PrimaryButton(
                          text: "View Deal",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RestaurantDetailScreen()),
                            );
                          },
                          radius: 12,
                        ),
                      ),
                      Image.asset("assets/heart.png", width: 39, height: 39),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
