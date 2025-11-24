// import 'package:flutter/material.dart';


// class ProfileView1 extends StatelessWidget {
// const ProfileView1({super.key});


// @override
// Widget build(BuildContext context) {
// return Scaffold(
// appBar: AppBar(title: const Text('Profile')),
// body: Padding(
// padding: const EdgeInsets.all(12.0),
// child: Column(
// children: [
// const CircleAvatar(radius: 40, backgroundImage: AssetImage('profile.png')),
// const SizedBox(height: 12),
// const Text('User Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// const SizedBox(height: 8),
// ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/profile/2'), child: const Text('Edit Profile')),
// ],
// ),
// ),
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView1 extends StatelessWidget {
  const ProfileView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/profile.png')),
            const SizedBox(height: 12),
            const Text('User Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () => context.push('/profile/2'), child: const Text('Edit Profile')),
          ],
        ),
      ),
    );
  }
}