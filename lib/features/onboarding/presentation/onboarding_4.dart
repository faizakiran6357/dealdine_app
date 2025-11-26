
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60), // top spacing same as Onboarding1

              /// -------------------- IMAGE --------------------
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/onboarding4.png',
                  width: 240,
                  height: 292,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 30),

              /// -------------------- TITLE --------------------
              const Text(
                "Free delivery offers",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900, // ExtraBold
                  color: Color(0xFF32343E),
                ),
              ),
              const SizedBox(height: 14),

              /// -------------------- SUBTITLE --------------------
              const Text(
                "Get all your loved foods in one once\nplace, you just place the order we do the rest",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  fontWeight: FontWeight.w400, // Regular
                  color: Color(0xFF646982),
                ),
              ),
              const SizedBox(height: 25),

              /// -------------------- INDICATORS --------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/slide3.png', // indicator for page 4
                    width: 76,
                    height: 10,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              const Spacer(flex: 2), // <-- Spacer increased to move button slightly up

              /// -------------------- ASSET BUTTON --------------------
              GestureDetector(
                onTap: () => context.go('/login'),
                child: Image.asset(
                  'assets/button1.png', // Get Started button
                  width: 330,
                  height: 65,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 50), // extra spacing below button if needed
            ],
          ),
        ),
      ),
    );
  }
}