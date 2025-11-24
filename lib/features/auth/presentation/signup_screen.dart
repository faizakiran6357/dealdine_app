// import 'package:flutter/material.dart';
// import '../../../core/widgets/custom_text_field.dart';
// import '../../../core/widgets/primary_button.dart';


// class SignupScreen extends StatelessWidget {
// const SignupScreen({super.key});


// @override
// Widget build(BuildContext context) {
// final nameC = TextEditingController();
// final emailC = TextEditingController();
// final passC = TextEditingController();


// return Scaffold(
// appBar: AppBar(title: const Text('Sign Up')),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// CustomTextField(hint: 'Full name', controller: nameC),
// const SizedBox(height: 8),
// CustomTextField(hint: 'Email', controller: emailC),
// const SizedBox(height: 8),
// CustomTextField(hint: 'Password', controller: passC),
// const SizedBox(height: 12),
// PrimaryButton(title: 'Create Account', onPressed: () => Navigator.pushReplacementNamed(context, '/home')),
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

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameC = TextEditingController();
    final emailC = TextEditingController();
    final passC = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(hint: 'Full name', controller: nameC),
            const SizedBox(height: 8),
            CustomTextField(hint: 'Email', controller: emailC),
            const SizedBox(height: 8),
            CustomTextField(hint: 'Password', controller: passC),
            const SizedBox(height: 12),
            PrimaryButton(title: 'Create Account', onPressed: () => context.go('/home')),
          ],
        ),
      ),
    );
  }
}