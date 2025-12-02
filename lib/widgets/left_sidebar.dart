import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LeftSidebar extends StatelessWidget {
  final double width;
  final bool showLabels;

  const LeftSidebar({required this.width, required this.showLabels, super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      _MenuItemData(icon: Icons.dashboard_outlined, label: "Dashboard", path: '/restaurant/dashboard'),
      _MenuItemData(icon: Icons.add_box_outlined, label: "Add Deal", path: '/restaurant/add-deal'),
      _MenuItemData(icon: Icons.video_collection_outlined, label: "Upload Video", path: '/restaurant/upload-video'),
      _MenuItemData(icon: Icons.bar_chart_outlined, label: "Analytics", path: '/restaurant/analytics'),
      _MenuItemData(icon: Icons.person_outline, label: "Profile", path: '/restaurant/profile'),
    ];

    return Container(
      width: width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12),
            child: Image.asset(
              'assets/splash1.png',
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 4), // Less space between logo and menu

          Builder(builder: (context) {
            final currentLocation = GoRouterState.of(context).uri.toString();

            return Column(
              children: menuItems.map((item) {
                final isActive = currentLocation == item.path;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6),
                  child: GestureDetector(
                    onTap: () => GoRouter.of(context).go(item.path),
                    child: Container(
                      decoration: isActive
                          ? BoxDecoration(
                              color: const Color(0xFFFF4B00),
                              borderRadius: BorderRadius.circular(8),
                            )
                          : null,
                      child: ListTile(
                        leading: Icon(item.icon, color: isActive ? Colors.white : const Color(0xFF727272)),
                        title: showLabels
                            ? Text(item.label,
                                style: TextStyle(
                                    color: isActive ? Colors.white : const Color(0xFF727272)))
                            : null,
                        dense: true,
                        horizontalTitleGap: 6,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String label;
  final String path;

  _MenuItemData({required this.icon, required this.label, required this.path});
}
