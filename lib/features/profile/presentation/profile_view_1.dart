
import 'package:dealdine_application/application/providers/user_profile_provider.dart';
import 'package:dealdine_application/features/notifications/presentation/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class ProfileView1 extends StatelessWidget {
  const ProfileView1({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProfileProvider>().user;

    Widget _menuItem({
      required IconData icon,
      required String text,
      required Color iconColor,
      VoidCallback? onTap,
    }) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Row(
            children: [
              Icon(icon, size: 28, color: iconColor),
              const SizedBox(width: 16),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF32343E),
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF747783)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/dine.png', height: 36),

                  // Image.asset('assets/notification.png', height: 32),
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
              const SizedBox(height: 30),
              Row(
                children: [
                  CircleAvatar(radius: 40, backgroundImage: AssetImage(user.avatarPath)),
                  const SizedBox(width: 16),
                  Text(
                    user.fullName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF32343E)),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _menuItem(
                icon: Icons.person,
                text: 'Personal Info',
                iconColor: const Color(0xFFFB6F3D),
                onTap: () => context.push('/profile/2'),
              ),
              _menuItem(
                icon: Icons.bookmark,
                text: 'Saved',
                iconColor: const Color(0xFF2AE1E1),
              ),
              const SizedBox(height: 50),
              _menuItem(
                icon: Icons.logout,
                text: 'Log Out',
                iconColor: const Color(0xFFFB4A59),
                onTap: () => context.go('/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
