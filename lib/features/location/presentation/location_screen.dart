// // import 'package:flutter/material.dart';
// // import '../../../core/widgets/primary_button.dart';


// // class LocationScreen extends StatelessWidget {
// // const LocationScreen({super.key});


// // @override
// // Widget build(BuildContext context) {
// // return Scaffold(
// // appBar: AppBar(title: const Text('Select Location')),
// // body: Padding(
// // padding: const EdgeInsets.all(16.0),
// // child: Column(
// // children: [
// // const Text('Use your current location or search for an address.'),
// // const SizedBox(height: 12),
// // PrimaryButton(title: 'Use Current Location', onPressed: () => Navigator.pushReplacementNamed(context, '/home')),
// // ],
// // ),
// // ),
// // );
// // }
// // }
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../../../core/widgets/primary_button.dart';

// class LocationScreen extends StatelessWidget {
//   const LocationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Location')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text('Use your current location or search for an address.'),
//             const SizedBox(height: 12),
//             PrimaryButton(title: 'Use Current Location', onPressed: () => context.go('/home')),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Plain white page
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 114), // Top spacing

            // Centered location image
            Center(
              child: Image.asset(
                'assets/location.png', // Your location asset
                width: 384,
                height: 353,
                fit: BoxFit.fill,
              ),
            ),

            const SizedBox(height: 40), // Space before button

            // Access location button
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to Home screen on click
                  context.go('/home'); 
                },
                child: Image.asset(
                  'assets/accesslocation_button.png', // Your button asset
                  width: 327, // Adjust if needed
                  height: 62, // Adjust if needed
                  fit: BoxFit.fill,
                ),
              ),
            ),

            const SizedBox(height: 26), // Space before text

            // Description text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Deal Dine WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF646982),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
