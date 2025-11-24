import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
final String hint;
final TextEditingController? controller;
final TextInputType keyboardType;


const CustomTextField({super.key, this.controller, required this.hint, this.keyboardType = TextInputType.text});


@override
Widget build(BuildContext context) {
return TextField(
controller: controller,
keyboardType: keyboardType,
decoration: InputDecoration(
hintText: hint,
filled: true,
fillColor: Colors.white,
contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
),
);
}
}