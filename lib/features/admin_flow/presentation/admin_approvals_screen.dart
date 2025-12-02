import 'package:flutter/material.dart';

class AdminApprovalsScreen extends StatelessWidget {
  const AdminApprovalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Approvals")),
      body: const Center(child: Text("Pending Restaurant Approvals")),
    );
  }
}
