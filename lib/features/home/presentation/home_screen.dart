
import 'package:flutter/material.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/dine.png", width: 150),
                Image.asset("assets/notification.png", width: 30),
              ],
            ),

            const SizedBox(height: 15),

            // Greeting: "Hey Halal," normal + "Good Afternoon!" bold
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
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "All Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                GestureDetector(
                  onTap: () => _showAllCategoriesDialog(context),
                  child: const Text(
                    "See All >", // Updated with >
                    style: TextStyle(fontSize: 14, color: Colors.black,

),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Open Restaurants",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                Text(
                  "See All >", // Updated with >
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _restaurantCard(),
            const SizedBox(height: 15),
            _restaurantCard(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _categoryItem(String title, String img, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
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
          CircleAvatar(backgroundImage: AssetImage(img), radius: 20),
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

  Widget _restaurantCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/resto.png", width: 65),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Panda Express",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 3),
                    const Text(
                      "Coffe + Pasta Combo", // full text in single line
                      style: TextStyle(color: Colors.grey,fontSize: 10),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Image.asset(
                      "assets/off.png",
                      height: 30,
                    ),
                  ],
                ),
              ),
              Image.asset("assets/bbb.png", width: 45),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/aaa.png",
                    height: 36,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Image.asset("assets/heart.png", height: 35),
            ],
          ),
        ],
      ),
    );
  }

  // DIALOG — NO OVERFLOW
  void _showAllCategoriesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("All Categories"),
        content: SizedBox(
          width: double.maxFinite,
          height: 260,
          child: GridView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            children: [
              _dialogCategoryItem("All", "assets/xxx.png"),
              _dialogCategoryItem("Hot Dog", "assets/yyy.png"),
              _dialogCategoryItem("Burger", "assets/zzz.png"),
              _dialogCategoryItem("Pizza", "assets/pizza.png"),
              _dialogCategoryItem("Fries", "assets/fries.png"),
              _dialogCategoryItem("Cock", "assets/cock.png"),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  Widget _dialogCategoryItem(String title, String img) {
    return Column(
      children: [
        CircleAvatar(backgroundImage: AssetImage(img), radius: 25),
        const SizedBox(height: 5),
        Text(title),
      ],
    );
  }
}