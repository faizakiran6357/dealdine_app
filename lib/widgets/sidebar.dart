
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current route location
    final String currentLocation = GoRouterState.of(context).uri.path;
    
    return Container(
      width: 230,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset("assets/splash1.png", height: 35),
          const SizedBox(height: 30),

          // ⭐ Dashboard item (custom margins to shrink width)
          _menuItem(
            context,
            Icons.dashboard,
            "Dashboard",
            '/admin/dashboard',
            selected: currentLocation == '/admin/dashboard',
            leftMargin: 15,     // 👈 Left side space
            rightMargin: 15,    // 👈 Right side space
          ),

          // ⭐ Other items untouched
          _menuItem(
            context,
            Icons.check_circle,
            "Approvals",
            '/admin/approvals',
            selected: currentLocation == '/admin/approvals',
          ),
          _menuItem(
            context,
            Icons.analytics,
            "Analytics",
            '/admin/analytics',
            selected: currentLocation == '/admin/analytics',
          ),
          _menuItem(
            context,
            Icons.notifications,
            "Notifications",
            '/admin/notifications',
            selected: currentLocation == '/admin/notifications',
          ),

          const Spacer(),
        ],
      ),
    );
  }

  Widget _menuItem(
    BuildContext context,
    IconData icon,
    String title,
    String route, {
    bool selected = false,
    double leftMargin = 0,
    double rightMargin = 0,
  }) {
    return InkWell(
      onTap: () {
        context.go(route);
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: EdgeInsets.only(
          left: leftMargin,
          right: rightMargin,
          top: 8,
          bottom: 8,
        ), // 👈 BUTTON SHIFTS INWARD (SMALLER WIDTH)
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: selected ? const Color(0xffff6a00) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? Colors.white : Colors.black54,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}