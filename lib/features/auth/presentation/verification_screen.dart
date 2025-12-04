
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:dealdine_application/widgets/primary_button.dart';

// class VerificationScreen extends StatelessWidget {
//   const VerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final otpControllers = List.generate(4, (_) => TextEditingController());

//     return Scaffold(
//       backgroundColor: const Color(0xFF0D0D25),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             reverse: true,
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight: constraints.maxHeight,
//               ),
//               child: IntrinsicHeight(
//                 child: Column(
//                   children: [
//                     // -------------------- TOP HEADER --------------------
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.only(
//                         top: 65,
//                         left: 20,
//                         right: 20,
//                         bottom: 55,
//                       ),
//                       color: const Color(0xFF0D0D25),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Transform.translate(
//                             offset: const Offset(0, -12),
//                             child: GestureDetector(
//                               onTap: () => context.pop(),
//                               child: Container(
//                                 padding: const EdgeInsets.all(6),
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(
//                                   Icons.arrow_back_ios_new,
//                                   color: Color(0xFF5E616F),
//                                   size: 24,
//                                 ),
//                               ),
//                             ),
//                           ),

//                           const SizedBox(height: 30),

//                           const Center(
//                             child: Text(
//                               "Verification",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),

//                           const SizedBox(height: 8),

//                           const Center(
//                             child: Text(
//                               "We have sent a code to your email",
//                               style: TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 13,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),

//                           const SizedBox(height: 6),

//                           const Center(
//                             child: Text(
//                               "example@gmail.com",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // -------------------- WHITE CARD FULL SCREEN --------------------
//                     Expanded(
//                       child: Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 24,
//                           vertical: 30,
//                         ),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(32),
//                             topRight: Radius.circular(32),
//                           ),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // CODE + RESEND ROW
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   "CODE",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.black54,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),

//                                 Row(
//                                   children: const [
//                                     Text(
//                                       "Resend",
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xFF32343E),
//                                         fontWeight: FontWeight.bold,
//                                         decoration: TextDecoration.underline,
//                                       ),
//                                     ),
//                                     SizedBox(width: 4),
//                                     Text(
//                                       "in.50sec",
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.black54,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),

//                             const SizedBox(height: 20),

//                             // OTP BOXES
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: List.generate(4, (index) {
//                                 return Container(
//                                   height: 60,
//                                   width: 60,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFF2F4F7),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: TextField(
//                                     controller: otpControllers[index],
//                                     textAlign: TextAlign.center,
//                                     keyboardType: TextInputType.number,
//                                     maxLength: 1,
//                                     decoration: const InputDecoration(
//                                       counterText: "",
//                                       border: InputBorder.none,
//                                     ),
//                                     style: const TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     onChanged: (value) {
//                                       if (value.isNotEmpty && index < 3) {
//                                         FocusScope.of(context).nextFocus();
//                                       }
//                                     },
//                                   ),
//                                 );
//                               }),
//                             ),

//                             const SizedBox(height: 40),

//                             // *************** VERIFY BUTTON (PRIMARY BUTTON) ***************
//                             PrimaryButton(
//                               text: "VERIFY",
//                               onTap: () {
//                                 // context.push('/newpassword');
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dealdine_application/widgets/primary_button.dart';

// Your usecase + repository
import 'package:dealdine_application/features/auth/application/usecases/auth_usecase.dart';
import 'package:dealdine_application/features/auth/data/repositories/auth_repository_impl.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final otpControllers = List.generate(4, (_) => TextEditingController());
  bool isLoading = false;

  late AuthUseCase authUseCase;

  @override
  void initState() {
    super.initState();

    // ✅ Initialize UseCase Properly
    authUseCase = AuthUseCase(
      AuthRepositoryImpl(),
    );
  }

  String getOtp() {
    return otpControllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D25),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // -------------------- TOP HEADER --------------------
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 65,
                        left: 20,
                        right: 20,
                        bottom: 55,
                      ),
                      color: const Color(0xFF0D0D25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -12),
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
                          const Center(
                            child: Text(
                              "Verification",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Center(
                            child: Text(
                              "We have sent a code to your email",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Center(
                            child: Text(
                              widget.email,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 30,
                        ),
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
                            // CODE + RESEND ROW
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "CODE",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Resend",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF32343E),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "in.50sec",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // OTP BOXES
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(4, (index) {
                                return Container(
                                  height: 60,
                                  width: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF2F4F7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextField(
                                    controller: otpControllers[index],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onChanged: (value) {
                                      if (value.isNotEmpty && index < 3) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 40),

                            // *************** VERIFY BUTTON ***************
                            PrimaryButton(
                              text: "VERIFY",
                              isLoading: isLoading,
                              onTap: () async {
                                final otp = getOtp();
                                if (otp.length < 4) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Enter complete OTP"),
                                    ),
                                  );
                                  return;
                                }

                                setState(() => isLoading = true);

                                try {
                                  // backend call
                                  await authUseCase.verifyOtp(
                                    widget.email,
                                    otp,
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("OTP verified successfully"),
                                    ),
                                  );

                                  context.push(
                                    '/reset-password',
                                    extra: widget.email,
                                  );
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
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}