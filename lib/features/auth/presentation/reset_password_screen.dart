import 'package:dealdine_application/features/auth/application/usecases/auth_usecase.dart';
import 'package:dealdine_application/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dealdine_application/widgets/primary_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email; // passed from VerificationScreen

  const ResetPasswordScreen({super.key, required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final newPassC = TextEditingController();
  final rePassC = TextEditingController();
  bool isLoading = false;

  late AuthUseCase authUseCase;

  @override
  void initState() {
    super.initState();

    /// 🔥 FIXED — initialize AuthUseCase here
    authUseCase = AuthUseCase(AuthRepositoryImpl());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D25),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ---------------- TOP HEADER ----------------
            SizedBox(
              height: size.height * 0.3,
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 22,
                          color: Color(0xFF5E616F),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Column(
                        children: const [
                          Text(
                            "Reset Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Set your new password",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ---------------- WHITE CONTAINER ----------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 26),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// NEW PASSWORD
                  const Text(
                    "NEW PASSWORD",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputBox(
                    controller: newPassC,
                    hint: "••••••••••••",
                    isPass: true,
                  ),
                  const SizedBox(height: 18),

                  /// RE-TYPE PASSWORD
                  const Text(
                    "RE-TYPE PASSWORD",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputBox(
                    controller: rePassC,
                    hint: "••••••••••••",
                    isPass: true,
                  ),
                  const SizedBox(height: 32),

                  /// RESET PASSWORD BUTTON
                  PrimaryButton(
                    text: "RESET PASSWORD",
                    isLoading: isLoading,
                    onTap: () async {
                      final newPass = newPassC.text.trim();
                      final rePass = rePassC.text.trim();

                      if (newPass.isEmpty || rePass.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please fill all fields")),
                        );
                        return;
                      }

                      if (newPass != rePass) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Passwords do not match")),
                        );
                        return;
                      }

                      setState(() => isLoading = true);

                      try {
                        /// 🔥 Backend Call
                        await authUseCase.resetPassword(widget.email, newPass);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Password reset successfully")),
                        );

                        /// Navigate to login
                        context.push('/login');
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error: $e")),
                        );
                      }

                      setState(() => isLoading = false);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------- INPUT BOX UI ----------------
  Widget _inputBox({
    required TextEditingController controller,
    required String hint,
    bool isPass = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFFBAC1C6),
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}