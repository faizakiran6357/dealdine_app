import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/primary_button.dart';


class Onboarding4 extends StatelessWidget {
const Onboarding4({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: Padding(
padding: const EdgeInsets.all(24.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text('Ready to taste?', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
const SizedBox(height: 16),
Expanded(child: Image.asset('assets/onboarding4.png', fit: BoxFit.contain)),
const SizedBox(height: 16),
PrimaryButton(title: 'Get Started', onPressed: () => context.go('/login')),
],
),
),
),
);
}
}
