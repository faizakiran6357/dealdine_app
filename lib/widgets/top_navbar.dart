import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isWeb;

  const TopNavBar({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,

      // 🔥 NO PADDING OUTSIDE — FULL EDGE ATTACHMENT
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            color: Colors.black12,
            offset: Offset(0, 1),
          )
        ],
      ),

      // 🔥 INTERNAL PADDING ONLY (Does not create outside gap)
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        children: [
          // ----------------------------
          // Search Box
          // ----------------------------
          Container(
            width: isWeb ? 380 : MediaQuery.of(context).size.width * 0.55,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 18, color: Color(0xFF9DA6B0)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      isCollapsed: true,
                      hintStyle: TextStyle(
                        color: Color(0xFF9DA6B0),
                        fontSize: 14,
                      ),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // ----------------------------
          // Notification Bell
          // ----------------------------
          Image.asset('assets/bell_icon.png', width: 26, height: 26),
          const SizedBox(width: 20),

          // ----------------------------
          // Language box
          // ----------------------------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset('assets/flag.png', width: 26, height: 26),
                const SizedBox(width: 6),
                const Text(
                  "English",
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7180)),
                ),
                const Icon(Icons.keyboard_arrow_down,
                    size: 18, color: Color(0xFF6B7180)),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // ----------------------------
          // Profile Row
          // ----------------------------
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/profile3.png'),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Moni Roy",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF6B7180),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 6),
              const Icon(Icons.keyboard_arrow_down,
                  size: 20, color: Color(0xFF6B7180)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}