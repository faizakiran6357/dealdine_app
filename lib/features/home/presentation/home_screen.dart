// import 'package:flutter/material.dart';
// import '../../../core/widgets/primary_button.dart';


// class HomeScreen extends StatelessWidget {
// const HomeScreen({super.key});


// Widget _restaurantCard(BuildContext context, String title) {
// return Card(
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// child: InkWell(
// onTap: () => Navigator.pushNamed(context, '/restaurant'),
// child: SizedBox(
// width: 140,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Image.asset('assets/mix.png', width: 140, height: 100, fit: BoxFit.cover),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
// ),
// ],
// ),
// ),
// ),
// );
// }


// @override
// Widget build(BuildContext context) {
// return Scaffold(
// appBar: AppBar(title: const Text('Home')),
// body: Padding(
// padding: const EdgeInsets.all(12.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Text('Popular near you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// const SizedBox(height: 12),
// SizedBox(
// height: 160,
// child: ListView(
// scrollDirection: Axis.horizontal,
// children: [
// _restaurantCard(context, 'Pasta Express'),
// const SizedBox(width: 8),
// _restaurantCard(context, 'Pizza House'),
// const SizedBox(width: 8),
// _restaurantCard(context, 'Sushi Corner'),
// ],
// ),
// ),
// const SizedBox(height: 12),
// PrimaryButton(title: 'Go to Videos', onPressed: () => Navigator.pushNamed(context, '/videos')),
// ],
// ),
// )
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _restaurantCard(BuildContext context, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => context.push('/restaurant'),
        child: SizedBox(
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/mix.png', width: 140, height: 100, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Popular near you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _restaurantCard(context, 'Pasta Express'),
                  const SizedBox(width: 8),
                  _restaurantCard(context, 'Pizza House'),
                  const SizedBox(width: 8),
                  _restaurantCard(context, 'Sushi Corner'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            PrimaryButton(title: 'Go to Videos', onPressed: () => context.push('/videos')),
          ],
        ),
      ),
    );
  }
}