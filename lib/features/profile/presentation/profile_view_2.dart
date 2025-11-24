import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/primary_button.dart';


class ProfileView2 extends StatelessWidget {
const ProfileView2({super.key});


@override
Widget build(BuildContext context) {
final nameC = TextEditingController(text: 'User Name');
final emailC = TextEditingController(text: 'user@example.com');


return Scaffold(
appBar: AppBar(title: const Text('Edit Profile')),
body: Padding(
padding: const EdgeInsets.all(12.0),
child: Column(
children: [
CustomTextField(hint: 'Full name', controller: nameC),
const SizedBox(height: 8),
CustomTextField(hint: 'Email', controller: emailC),
const SizedBox(height: 12),
PrimaryButton(title: 'Save', onPressed: () => Navigator.pop(context)),
],
),
),
);
}
}