
import 'package:dealdine_application/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // TITLE
              const Text(
                "Select Your Role",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Please choose how you want to continue\nusing the DealDine App.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const Spacer(),

              // CUSTOMER BUTTON
              PrimaryButton(
                text: "Continue as Customer",
                onTap: () {
                  context.go('/login');   // FIXED
                },
              ),

              const SizedBox(height: 16),

              // RESTAURANT BUTTON
              PrimaryButton(
                text: "Continue as Restaurant",
                onTap: () {
                  context.go('/restaurant/dashboard');  // FIXED
                },
              ),

              const SizedBox(height: 16),

              // ADMIN BUTTON
              PrimaryButton(
                text: "Continue as Admin",
                onTap: () {
                  context.go('/admin/dashboard');   // FIXED
                },
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
