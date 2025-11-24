// import 'package:flutter/material.dart';
// import '../../../core/widgets/custom_text_field.dart';
// import '../../../core/widgets/primary_button.dart';


// class ForgotPasswordScreen extends StatelessWidget {
// const ForgotPasswordScreen({super.key});


// @override
// Widget build(BuildContext context) {
// final emailC = TextEditingController();
// return Scaffold(
// appBar: AppBar(title: const Text('Forgot Password')),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// CustomTextField(hint: 'Email', controller: emailC),
// const SizedBox(height: 12),
// PrimaryButton(title: 'Send Reset Link', onPressed: () => Navigator.pop(context)),
// ],
// ),
// ),
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/primary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailC = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(hint: 'Email', controller: emailC),
            const SizedBox(height: 12),
            PrimaryButton(title: 'Send Reset Link', onPressed: () => context.pop()),
          ],
        ),
      ),
    );
  }
}