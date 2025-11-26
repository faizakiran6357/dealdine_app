
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final emailC = TextEditingController();

//     return Scaffold(
//       backgroundColor: const Color(0xFF0D0D25),
//       body: Column(
//         children: [
//           // -------------------- TOP HEADER --------------------
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
//             color: const Color(0xFF0D0D25),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
                
//                 // FIXED BACK BUTTON
//                 GestureDetector(
//                   onTap: () => context.pop(),
//                   child: Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: const BoxDecoration(
//                       color: Colors.white, // white circle
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.arrow_back_ios_new,
//                       color: Color(0xFF5E616F), // dark icon
//                       size: 24,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 Center(
//                   child: const Text(
//                     "Forgot Password",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 8),
//                 Center(
//                   child: const Text(
//                     "Please sign in to your existing account",
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 13,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // -------------------- WHITE CARD --------------------
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(32),
//                   topRight: Radius.circular(32),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
                  
//                   const Text(
//                     "EMAIL",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 8),

//                   Container(
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF2F4F7),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: TextField(
//                       controller: emailC,
//                       decoration: const InputDecoration(
//                         hintText: "example@gmail.com",
//                         hintStyle: TextStyle(
//                           color: Color(0xFFBAC1C6),
//                           fontSize: 13,
//                         ),
//                         border: InputBorder.none,
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   GestureDetector(
//                     onTap: () {},
//                     child: Image.asset(
//                       "assets/sendcode_button.png",
//                       width: double.infinity,
//                       fit: BoxFit.contain,
//                     ),

//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailC = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D25),
      body: Column(
        children: [
          // -------------------- TOP HEADER --------------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 70,   // INCREASED HEADER HEIGHT
              left: 20,
              right: 20,
              bottom: 55, // also increased slightly
            ),
            color: const Color(0xFF0D0D25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
  offset: const Offset(0, -12),  // <-- moves arrow UP safely
  child: GestureDetector(
    onTap: () => context.pop(),
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Color(0xFF5E616F),
        size: 24,
      ),
    ),
  ),
),

                const SizedBox(height: 30),

                Center(
                  child: Text(
                    "Forgot Password",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 8),
                Center(
                  child: Text(
                    "Please sign in to your existing account",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // -------------------- WHITE CARD --------------------
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
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
                  const Text(
                    "EMAIL",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Email Input Field
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F4F7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: emailC,
                      decoration: const InputDecoration(
                        hintText: "example@gmail.com",
                        hintStyle: TextStyle(
                          color: Color(0xFFBAC1C6),
                          fontSize: 13,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // SEND CODE BUTTON → NAVIGATES TO VERIFICATION SCREEN
                  GestureDetector(
                    onTap: () {
                      context.push('/verification'); // <-- navigate to verification
                    },
                    child: Image.asset(
                      "assets/sendcode_button.png",
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
