
// import 'package:flutter/material.dart';

// class PrimaryButton extends StatelessWidget {
//   final String text;
//   final bool isLoading;
//   final VoidCallback onTap;

//   const PrimaryButton({
//     super.key,
//     required this.text,
//     required this.onTap,
//     this.isLoading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: isLoading ? null : onTap,
//       child: Container(
//         height: 55,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           gradient: const LinearGradient(
//             colors: [
//               Color(0xFFE53935),
//               Color(0xFFFB8C00),
//             ],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//         ),
//         alignment: Alignment.center,
//         child: isLoading
//             ? const SizedBox(
//                 height: 25,
//                 width: 25,
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                   strokeWidth: 2.5,
//                 ),
//               )
//             : Text(
//                 text,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,      // ✅ UPDATED HERE
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onTap;

  // ✅ Added optional radius and padding
  final double radius;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.radius = 12, // default radius
    this.padding,     // optional custom padding
    this.height,      // optional custom height
    this.width,       // optional custom width
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: height ?? 58,            // default height 55 if not provided
        width: width ?? 338, // default full width if not provided
        padding: padding,                // optional custom padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFE53935),
              Color(0xFFFB8C00),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
