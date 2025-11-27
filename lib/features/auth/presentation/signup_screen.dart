
import 'package:dealdine_application/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false; // <-- for button loader

  @override
  Widget build(BuildContext context) {
    final nameC = TextEditingController();
    final emailC = TextEditingController();
    final passC = TextEditingController();
    final rePassC = TextEditingController();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D25),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ---------------- TOP HEADER ----------------
            SizedBox(
              height: size.height * 0.30,
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
                        child: const Icon(Icons.arrow_back_ios_new,
                            size: 22, color: Color(0xFF5E616F)),
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Please sign up to get started",
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

                  // ------ NAME FIELD ------
                  const Text(
                    "NAME",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputBox(
                    controller: nameC,
                    hint: "John doe",
                  ),

                  const SizedBox(height: 18),

                  // ------ EMAIL ------
                  const Text(
                    "EMAIL",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputBox(
                    controller: emailC,
                    hint: "example@gmail.com",
                  ),

                  const SizedBox(height: 18),

                  // ------ PASSWORD ------
                  const Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputBox(
                    controller: passC,
                    hint: "••••••••••••",
                    isPass: true,
                  ),

                  const SizedBox(height: 18),

                  // ------ RE-TYPE PASSWORD ------
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

                  /// ****************** PRIMARY BUTTON ************************
                  PrimaryButton(
                    text: "Sign Up",
                    isLoading: isLoading,
                    onTap: () async {
                      setState(() => isLoading = true);

                      await Future.delayed(const Duration(seconds: 2));

                      setState(() => isLoading = false);

                      context.go('/home');
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Input Box Widget
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
          suffixIcon: isPass
              ? const Icon(Icons.visibility_off, color: Colors.grey)
              : null,
        ),
      ),
    );
  }
}
