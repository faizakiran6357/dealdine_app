import 'package:dealdine_application/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
class RestaurantDashboardScreen extends StatelessWidget {
  const RestaurantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _Mobile(),
      tablet: _Tablet(),
      web: _Web(),
    );
  }
}

class _Mobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restaurant Dashboard")),
      body: const Center(child: Text("Mobile Restaurant Dashboard")),
    );
  }
}

class _Tablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restaurant Dashboard")),
      body: const Center(child: Text("Tablet Restaurant Dashboard")),
    );
  }
}

class _Web extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 240,
            color: Colors.grey.shade200,
            child: const Center(child: Text("Sidebar")),
          ),
          const Expanded(
            child: Center(child: Text("Web Restaurant Dashboard")),
          ),
        ],
      ),
    );
  }
}
