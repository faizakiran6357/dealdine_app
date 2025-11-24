// import 'package:flutter/material.dart';
// import '../../../core/widgets/custom_text_field.dart';
// import '../../../core/widgets/primary_button.dart';


// class LoginScreen extends StatelessWidget {
// const LoginScreen({super.key});


// @override
// Widget build(BuildContext context) {
// final emailC = TextEditingController();
// final passC = TextEditingController();


// return Scaffold(
// appBar: AppBar(title: const Text('Login')),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// CustomTextField(hint: 'Email', controller: emailC),
// const SizedBox(height: 12),
// CustomTextField(hint: 'Password', controller: passC),
// const SizedBox(height: 12),
// Align(
// alignment: Alignment.centerRight,
// child: TextButton(onPressed: () => Navigator.pushNamed(context, '/forgot'), child: const Text('Forgot Password')),
// ),
// const SizedBox(height: 8),
// PrimaryButton(title: 'Login', onPressed: () => Navigator.pushReplacementNamed(context, '/home')),
// const SizedBox(height: 8),
// PrimaryButton(title: 'Login with OTP', filled: false, onPressed: () => Navigator.pushNamed(context, '/login/otp')),
// const SizedBox(height: 12),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text('Don\'t have an account?'),
// TextButton(onPressed: () => Navigator.pushNamed(context, '/signup'), child: const Text('Sign Up')),
// ],
// )
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailC = TextEditingController();
    final passC = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(hint: 'Email', controller: emailC),
            const SizedBox(height: 12),
            CustomTextField(hint: 'Password', controller: passC),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.push('/forgot'),
                child: const Text('Forgot Password'),
              ),
            ),
            const SizedBox(height: 8),
            PrimaryButton(
              title: 'Login',
              onPressed: () => context.go('/home'), // replace nav stack
            ),
            const SizedBox(height: 8),
            PrimaryButton(
              title: 'Login with OTP',
              filled: false,
              onPressed: () => context.push('/login/otp'),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(onPressed: () => context.push('/signup'), child: const Text('Sign Up')),
              ],
            )
          ],
        ),
      ),
    );
  }
}