import 'package:flutter/material.dart';


class ProfileView3 extends StatelessWidget {
const ProfileView3({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Settings')),
body: ListView(
padding: const EdgeInsets.all(12),
children: const [
ListTile(title: Text('Notification settings')),
ListTile(title: Text('Privacy')),
ListTile(title: Text('Help & Support')),
],
),
);
}
}