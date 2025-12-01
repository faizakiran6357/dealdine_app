
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final bool showMenu;
  const TopBar({super.key, this.showMenu = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFF9C27B0), width: 2),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4)
        ],
      ),
      child: Row(
        children: [
          if (showMenu)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          if (showMenu) const SizedBox(width: 10),

          // Search Field
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),

          const SizedBox(width: 20),

          // Notifications Icon with Badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications,
                color: Colors.orange,
                size: 24,
              ),
              Positioned(
                right: -6,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF69B4),
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 20),

          // Language Selector (Updated: Asset Image Instead of Emoji)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    "assets/flag.png", // 🔥 Add your flag asset here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'English',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),

          const SizedBox(width: 20),

          // User Profile Section
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/profile3.png"),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Moni Roy',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
