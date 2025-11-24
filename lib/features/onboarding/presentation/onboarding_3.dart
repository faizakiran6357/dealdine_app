// import 'package:flutter/material.dart';
// import '../../../core/widgets/primary_button.dart';


// class Onboarding3 extends StatelessWidget {
// const Onboarding3({super.key});


// @override
// Widget build(BuildContext context) {
// return Scaffold(
// body: SafeArea(
// child: Padding(
// padding: const EdgeInsets.all(24.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text('Order from top chefs', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
// const SizedBox(height: 16),
// Expanded(child: Image.asset('assets/onboarding3.png', fit: BoxFit.contain)),
// const SizedBox(height: 16),
// PrimaryButton(title: 'Next', onPressed: () => Navigator.pushNamed(context, '/onboarding/5')),
// ],
// ),
// ),
// ),
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/primary_button.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Order from top chefs', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Expanded(child: Image.asset('assets/onboarding3.png', fit: BoxFit.contain)),
              const SizedBox(height: 16),
              PrimaryButton(title: 'Next', onPressed: () => context.push('/onboarding/4')),
            ],
          ),
        ),
      ),
    );
  }
}