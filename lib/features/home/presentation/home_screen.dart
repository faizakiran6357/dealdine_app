
import 'package:dealdine_application/features/home/presentation/all_categories_screen.dart';
import 'package:dealdine_application/features/home/presentation/all_restaurants_screen.dart';
import 'package:dealdine_application/features/notifications/presentation/notifications_screen.dart';
import 'package:dealdine_application/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:dealdine_application/features/restaurant/presentation/restaurant_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            // ---------- TOP BAR ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/dine.png", width: 150),

                // 👉 CLICKABLE NOTIFICATION ICON
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NotificationsScreen(),
                      ),
                    );
                  },
                  child: Image.asset("assets/notification.png", width: 30),
                ),
              ],
            ),

            const SizedBox(height: 15),

            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(text: "Hey Halal, "),
                  TextSpan(
                    text: "Good Afternoon!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------- SEARCH BAR ----------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search dishes, restaurants",
                  hintStyle: TextStyle(fontSize: 14),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ---------- CATEGORIES HEADER ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("All Categories",
                    style: TextStyle(fontSize: 18)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AllCategoriesScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "See All >",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ---------- CATEGORY LIST ----------
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryItem("All", "assets/xxx.png", true),
                  _categoryItem("Hot Dog", "assets/yyy.png", false),
                  _categoryItem("Burger", "assets/zzz.png", false),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------- OPEN RESTAURANTS HEADER ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Open Restaurants",
                    style: TextStyle(fontSize: 18)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AllRestaurantsScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "See All >",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _restaurantCard(context),
            const SizedBox(height: 15),
            _restaurantCard(context),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ---------- CATEGORY ITEM ----------
  Widget _categoryItem(String title, String img, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected ? Colors.orange.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(img), radius: 30),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selected ? Colors.orange : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // ---------- RESTAURANT CARD ----------
  Widget _restaurantCard(BuildContext context) {
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
            // ---------- TOP ROW ----------
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
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        "Coffee + Pasta Combo",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                        maxLines: 1,
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

            // ---------- BUTTON + HEART ROW ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // View Deal Button
                SizedBox(
                  width: 235,
                  height: 42,
                  child: PrimaryButton(
                    text: "View Deal",
                    onTap: () {},
                    radius: 12,
                  ),
                ),

                // Heart Icon
                Image.asset("assets/heart.png", width: 39, height: 39),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
