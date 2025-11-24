// import 'package:flutter/material.dart';
// import '../../../core/widgets/primary_button.dart';


// class LocationScreen extends StatelessWidget {
// const LocationScreen({super.key});


// @override
// Widget build(BuildContext context) {
// return Scaffold(
// appBar: AppBar(title: const Text('Select Location')),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// const Text('Use your current location or search for an address.'),
// const SizedBox(height: 12),
// PrimaryButton(title: 'Use Current Location', onPressed: () => Navigator.pushReplacementNamed(context, '/home')),
// ],
// ),
// ),
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/primary_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Location')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Use your current location or search for an address.'),
            const SizedBox(height: 12),
            PrimaryButton(title: 'Use Current Location', onPressed: () => context.go('/home')),
          ],
        ),
      ),
    );
  }
}