
import 'package:dealdine_application/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 114),

            // Location Image
            Center(
              child: Image.asset(
                'assets/location.png',
                width: 384,
                height: 353,
                fit: BoxFit.fill,
              ),
            ),

            const SizedBox(height: 40),

            // 🔥 Primary Button (replacing asset button)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton(
                text: "ACCESS LOCATION",
                radius: 12,
                padding: const EdgeInsets.symmetric(vertical: 16),
                onTap: () {
                  context.go('/home');
                },
              ),
            ),

            const SizedBox(height: 26),

            // Info text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Deal Dine WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF646982),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
