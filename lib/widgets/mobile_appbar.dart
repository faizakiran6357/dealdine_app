import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;

  const MobileAppBar({super.key, this.onMenuPressed});

  @override
  Size get preferredSize => const Size.fromHeight(56); // Standard AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: onMenuPressed ?? () => Scaffold.of(context).openDrawer(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/bell_icon.png', width: 26, height: 26),
        ],
      ),
    );
  }
}
