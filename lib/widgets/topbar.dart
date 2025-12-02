
import 'package:flutter/material.dart';
import 'package:dealdine_application/widgets/primary_button.dart';
import 'package:dealdine_application/features/auth/presentation/role_selection_screen.dart';

class TopBar extends StatelessWidget {
  final bool showMenu;
  const TopBar({super.key, this.showMenu = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;

        Widget buildSearchField() {
          return Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xffF3F3F3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          );
        }

        Widget buildNotifications() {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications,
                color: Colors.orange,
                size: 24,
              ),
              Positioned(
                right: -6,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF69B4),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        Widget buildLanguageSelector() {
          return Row(
            children: [
              Container(
                width: 30,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    "assets/flag.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'English',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Colors.grey,
              ),
            ],
          );
        }

        Widget buildProfile() {
          return Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/profile3.png"),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Moni Roy',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Colors.grey,
              ),
            ],
          );
        }

        Widget buildMenuButton() {
          if (!showMenu) return const SizedBox.shrink();
          return Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              const SizedBox(width: 10),
            ],
          );
        }

        final actions = [
          buildNotifications(),
          const SizedBox(width: 16),
          buildLanguageSelector(),
          const SizedBox(width: 16),
          buildProfile(),
        ];

        // ---------------------------
        // 🔥 MOBILE (UNCHANGED)
        // ---------------------------
        if (isMobile) {
          return Container(
            padding: const EdgeInsets.only(
              top: 35,
              left: 15,
              right: 15,
              bottom: 12,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Color(0xFF9C27B0), width: 2),
              ),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildMenuButton(),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: buildSearchField()),
                  const SizedBox(width: 16),
                  ...actions,
                ],
              ),
            ),
          );
        }

        // ---------------------------
        // 🔥 WEB (UPDATED HORIZONTAL ROW)
        // ---------------------------
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(0xFF9C27B0), width: 2),
            ),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                buildMenuButton(),
                // Search Field
                SizedBox(
                  width: 400, // Fixed width for web search field
                  child: buildSearchField(),
                ),
                const SizedBox(width: 250),
                // Actions row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: actions,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// ===================================================================
///  SHARED ADMIN MOBILE APP BAR (USED ON ALL ADMIN MOBILE SCREENS)
/// ===================================================================
class AdminMobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSettings;
  final Color backgroundColor;

  const AdminMobileAppBar({
    super.key,
    this.title = '',
    this.showSettings = false,
    this.backgroundColor = Colors.white,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 2,
      iconTheme: const IconThemeData(color: Colors.black87),
      title: title.isEmpty
          ? null
          : Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      actions: [
        if (showSettings)
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black87),
            onPressed: () => _openSettingsScreen(context),
          ),
      ],
    );
  }

  void _openSettingsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AdminMobileSettingsScreen(),
      ),
    );
  }
}

/// Standalone screen that shows the same quick actions as the web/tablet top bar.
class AdminMobileSettingsScreen extends StatelessWidget {
  const AdminMobileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          'Quick Settings',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.orange,
                      size: 28,
                    ),
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF69B4),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '6',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                const Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 34,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.asset(
                      "assets/flag.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'English',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage("assets/profile3.png"),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Moni Roy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Logout',
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const RoleSelectionScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdminMobileSearchField extends StatelessWidget {
  final String hint;
  const AdminMobileSearchField({super.key, this.hint = 'Search'});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF9C27B0)),
        ),
      ),
    );
  }
}