// import 'package:flutter/material.dart';
// import '../../../core/widgets/primary_button.dart';
// import '../../../core/widgets/custom_text_field.dart';


// class LoginWithOtpScreen extends StatelessWidget {
// const LoginWithOtpScreen({super.key});


// @override
// Widget build(BuildContext context) {
// final phoneC = TextEditingController();
// return Scaffold(
// appBar: AppBar(title: const Text('Login with OTP')),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// CustomTextField(hint: 'Phone number', controller: phoneC, keyboardType: TextInputType.phone),
// const SizedBox(height: 12),
// PrimaryButton(title: 'Send OTP', onPressed: () => Navigator.pushNamed(context, '/verification')),
// ],
// ),
// ),
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class LoginWithOtpScreen extends StatelessWidget {
  const LoginWithOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneC = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Login with OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(hint: 'Phone number', controller: phoneC, keyboardType: TextInputType.phone),
            const SizedBox(height: 12),
            PrimaryButton(title: 'Send OTP', onPressed: () => context.push('/verification')),
          ],
        ),
      ),
    );
  }
}