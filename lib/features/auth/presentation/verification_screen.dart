// import 'package:flutter/material.dart';
// import '../../../core/widgets/primary_button.dart';


// class VerificationScreen extends StatelessWidget {
// const VerificationScreen({super.key});


// @override
// Widget build(BuildContext context) {
// final otpC = TextEditingController();
// return Scaffold(
// appBar: AppBar(title: const Text('Verification')),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// const Text('Enter OTP sent to your phone'),
// const SizedBox(height: 8),
// TextField(controller: otpC, decoration: const InputDecoration(hintText: 'OTP')),
// const SizedBox(height: 12),
// PrimaryButton(title: 'Verify', onPressed: () => Navigator.pushReplacementNamed(context, '/home')),
// ],
// ),
// ),
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/primary_button.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpC = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Enter OTP sent to your phone'),
            const SizedBox(height: 8),
            TextField(controller: otpC, decoration: const InputDecoration(hintText: 'OTP')),
            const SizedBox(height: 12),
            PrimaryButton(title: 'Verify', onPressed: () => context.go('/home')),
          ],
        ),
      ),
    );
  }
}