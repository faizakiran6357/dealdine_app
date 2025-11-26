
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showSecondSplash = false;

  @override
  void initState() {
    super.initState();

    // Show first splash for 1 second
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showSecondSplash = true; // Switch to second splash
      });

      // Show second splash for 1 second
      Future.delayed(const Duration(seconds: 3), () {
        context.go('/onboarding/1'); // Navigate to onboarding
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showSecondSplash
          ? Container(
              // Full screen splash 2
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/splash2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : Center(
              // Splash 1
              child: Image.asset(
                'assets/splash1.png',
                width: 271.81,
                height: 64,
                fit: BoxFit.fill,
              ),
            ),
    );
  }
}
