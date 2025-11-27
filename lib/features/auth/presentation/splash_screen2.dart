
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          // ------------------------
          // Top Left Ellipse (NEW)
          // ------------------------
          Positioned(
            top: -40,
            left: -10,
            child: Image.asset(
              'assets/ellipse1.png',
              width: 177,
              height: 177,
              fit: BoxFit.cover,
            ),
          ),

          // ------------------------
          // Bottom Right Ellipse
          // ------------------------
          Positioned(
            bottom: -20,
            right: -20,
            child: Image.asset(
              'assets/ellipse.png',
              width: 260,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),

          // ------------------------
          // Main Logo in Center
          // ------------------------
          Center(
            child: Image.asset(
              'assets/splash1.png',
              width: 270,
              height: 64,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
