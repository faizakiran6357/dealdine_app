
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameC = TextEditingController();
    final emailC = TextEditingController();
    final passC = TextEditingController();
    final rePassC = TextEditingController();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D25), // top black bg
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ---------------- TOP HEADER ----------------
SizedBox(
  height: size.height * 0.30,
  child: Stack(
    children: [

      /// Back Button Circle (unchanged)
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
            child: const Icon(Icons.arrow_back_ios_new, size: 22, color: Color(0xFF5E616F)),
          ),
        ),
      ),

      /// Title + Subtitle (ONLY THIS MOVES DOWN)
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120), // 👈 moves only text
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


            /// ---------------- WHITE BODY ----------------
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

                  /// NAME
                  const Text(
                    "NAME",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F4F7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: nameC,
                      decoration: const InputDecoration(
                        hintText: "John doe",
                        hintStyle: TextStyle(
                          color: Color(0xFFBAC1C6),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// EMAIL
                  const Text(
                    "EMAIL",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F4F7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: emailC,
                      decoration: const InputDecoration(
                        hintText: "example@gmail.com",
                        hintStyle: TextStyle(
                          color: Color(0xFFBAC1C6),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// PASSWORD
                  const Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F4F7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: passC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "••••••••••••",
                        hintStyle: TextStyle(
                          color: Color(0xFFBAC1C6),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                      ),
                    ),
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
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F4F7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: rePassC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "••••••••••••",
                        hintStyle: TextStyle(
                          color: Color(0xFFBAC1C6),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  /// SIGN UP BUTTON PNG
                  GestureDetector(
                    onTap: () => context.go('/home'),
                    child: Center(child: Image.asset("assets/signup_button.png")),
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
}
