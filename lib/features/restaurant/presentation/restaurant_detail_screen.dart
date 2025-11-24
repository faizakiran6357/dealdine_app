import 'package:dealdine_application/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';



class RestaurantDetailScreen extends StatelessWidget {
const RestaurantDetailScreen({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Restaurant')),
body: Padding(
padding: const EdgeInsets.all(12.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Image.asset('assets/detail.png', width: double.infinity, height: 200, fit: BoxFit.cover),
const SizedBox(height: 8),
const Text('Spicy Restaurant', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
const SizedBox(height: 8),
const Text('Top rated • 4.8 (1.2k) • 25–30 min'),
const SizedBox(height: 12),
PrimaryButton(title: 'Order Now', onPressed: () {}),
],
),
),
);
}
}