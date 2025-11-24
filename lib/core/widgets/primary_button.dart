import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
final String title;
final VoidCallback onPressed;
final bool filled;


const PrimaryButton({super.key, required this.title, required this.onPressed, this.filled = true});


@override
Widget build(BuildContext context) {
return SizedBox(
width: double.infinity,
child: ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: filled ? Theme.of(context).primaryColor : Colors.white,
foregroundColor: filled ? Colors.white : Theme.of(context).primaryColor,
padding: const EdgeInsets.symmetric(vertical: 16),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
),
onPressed: onPressed,
child: Text(title),
),
);
}
}