import 'package:dealdine_application/features/favourites/presentation/favourites_screen.dart';
import 'package:dealdine_application/features/home/presentation/home_screen.dart';
import 'package:dealdine_application/features/profile/presentation/profile_view_1.dart';
import 'package:dealdine_application/features/videos/presentation/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const VideosScreen(),
    const FavouritesScreen(),
    const ProfileView1(),
  ];

  final Color selectedColor = const Color(0xFFFB6F3D);
  final Color unselectedColor = const Color(0xFF6B6E82);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Colors.white, 
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.video),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.grid),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
