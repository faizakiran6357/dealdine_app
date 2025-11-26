
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
                  'assets/onboarding3.png',
                  width: 240,
                  height: 292,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 30),

              /// -------------------- TITLE --------------------
              const Text(
                "Order from choosen chef",
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
                    'assets/slide2.png', // indicator for page 3
                    width: 76,
                    height: 10,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              const Spacer(),

              /// -------------------- ASSET BUTTON --------------------
              GestureDetector(
                onTap: () => context.push('/onboarding/4'),
                child: Image.asset(
                  'assets/button.png', // same button asset as Onboarding1
                  width: 330,
                  height: 65,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 15),

              /// -------------------- SKIP TEXT --------------------
              GestureDetector(
                onTap: () => context.go('/login'),
                child: const Center(
                  child: Text(
                    "Skip",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400, // Regular
                      color: Color(0xFF646982),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}