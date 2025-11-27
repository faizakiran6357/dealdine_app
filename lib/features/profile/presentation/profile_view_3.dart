
import 'dart:io';
import 'package:dealdine_application/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../application/providers/user_profile_provider.dart';

class ProfileView3 extends StatefulWidget {
  const ProfileView3({super.key});

  @override
  State<ProfileView3> createState() => _ProfileView3State();
}

class _ProfileView3State extends State<ProfileView3> {
  final TextEditingController fullNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController bioC = TextEditingController();

  File? profileImage;

  @override
  void initState() {
    super.initState();
    final user = context.read<UserProfileProvider>().user;

    fullNameC.text = user.fullName;
    emailC.text = user.email;
    phoneC.text = user.phone;
    bioC.text = user.bio;

    // If avatar is file path (not asset)
    if (!user.avatarPath.startsWith("assets/")) {
      profileImage = File(user.avatarPath);
    }
  }

  // FIXED PICKER — no more "image picker already active"
  Future<void> _pickImage() async {
    final picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Gallery"),
              onTap: () async {
                Navigator.pop(context); // close sheet FIRST ✔

                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);

                if (image != null) {
                  setState(() => profileImage = File(image.path));
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () async {
                Navigator.pop(context); // close sheet FIRST ✔

                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);

                if (image != null) {
                  setState(() => profileImage = File(image.path));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0), // more left space ✔
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF32343E),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF2F4F7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFF6B6E82),
                  fontSize: 13,
                ),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProfileProvider>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 12.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top appbar-like section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0), // more left space ✔
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_back_ios, size: 24),
                          SizedBox(width: 12),
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF32343E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Profile Image + Edit icon
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: profileImage != null
                              ? FileImage(profileImage!)
                              : (provider.user.avatarPath.startsWith("assets/")
                                  ? AssetImage(provider.user.avatarPath)
                                  : FileImage(File(provider.user.avatarPath)))
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF7622),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Editable fields
              _buildTextField(
                  label: "FULL NAME",
                  controller: fullNameC,
                  hint: "M.Faisal"),
              _buildTextField(
                  label: "EMAIL",
                  controller: emailC,
                  hint: "hello@halallab.co"),
              _buildTextField(
                  label: "PHONE NUMBER",
                  controller: phoneC,
                  hint: "408-841-0926"),
              _buildTextField(
                  label: "BIO",
                  controller: bioC,
                  hint: "I love fast food"),

              const SizedBox(height: 20),

              // Save button
               Padding(
  padding: const EdgeInsets.symmetric(horizontal: 22),
  child: PrimaryButton(
    text: "SAVE",
    onTap: () {
      provider.updateProfile(
        fullName: fullNameC.text,
        email: emailC.text,
        phone: phoneC.text,
        bio: bioC.text,
        avatarPath: profileImage?.path ?? provider.user.avatarPath,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Profile updated successfully!"),
        ),
      );

      context.pop();
    },
  ),
),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
