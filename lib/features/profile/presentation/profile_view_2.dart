
import 'package:dealdine_application/application/providers/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class ProfileView2 extends StatelessWidget {
  const ProfileView2({super.key});

  Widget _infoRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: iconColor),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF32343E),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B6E82),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProfileProvider>().user;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: const Icon(Icons.arrow_back_ios, size: 24),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Personal Info',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF181C2E),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => context.push('/profile/3'),
                    child: const Text(
                      'EDIT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFF7622),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFFF7622),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  CircleAvatar(radius: 40, backgroundImage: AssetImage(user.avatarPath)),
                  const SizedBox(width: 16),
                  Text(
                    user.fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF32343E),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _infoRow(
              icon: Icons.person,
              iconColor: const Color(0xFFFB6F3D),
              title: 'FULL NAME',
              subtitle: user.fullName,
            ),
            _infoRow(
              icon: Icons.email,
              iconColor: const Color(0xFF413DFB),
              title: 'EMAIL',
              subtitle: user.email,
            ),
            _infoRow(
              icon: Icons.call,
              iconColor: const Color(0xFF369BFF),
              title: 'PHONE NUMBER',
              subtitle: user.phone,
            ),
          ],
        ),
      ),
    );
  }
}
