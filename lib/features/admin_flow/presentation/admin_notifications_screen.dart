import 'package:dealdine_application/widgets/responsive_layout.dart';
import 'package:dealdine_application/widgets/sidebar.dart';
import 'package:dealdine_application/widgets/topbar.dart';
import 'package:flutter/material.dart';

class AdminNotificationsScreen extends StatelessWidget {
  const AdminNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _MobileNotifications(),
      tablet: _TabletNotifications(),
      web: _WebNotifications(),
    );
  }
}

///////////////////////////////////////////////////
/// ----------------- WEB LAYOUT -----------------
///////////////////////////////////////////////////
class _WebNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildNotificationItemWeb(
                  "New restaurant \"Pizza Palace\" pending approval",
                  "2 hours ago",
                ),
                _buildNotificationItemWeb(
                  "3 new deals waiting for review",
                  "4 hours ago",
                ),
                _buildNotificationItemWeb(
                  "Video from \"Burger King\" flagged by users",
                  "1 day ago",
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItemWeb(
    String message,
    String timestamp, {
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: Color(0xFFE3E6EB), width: 1),
              ),
      ),
      child: _notificationContainer(message, timestamp),
    );
  }
}


///////////////////////////////////////////////////
/// ----------------- TABLET LAYOUT -----------------
///////////////////////////////////////////////////
class _TabletNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Sidebar()),
      backgroundColor: const Color(0xFFF5F7FD),
      body: Column(
        children: [
          const TopBar(showMenu: true),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildNotificationItemTablet(
                          "New restaurant \"Pizza Palace\" pending approval",
                          "2 hours ago",
                        ),
                        _buildNotificationItemTablet(
                          "3 new deals waiting for review",
                          "4 hours ago",
                        ),
                        _buildNotificationItemTablet(
                          "Video from \"Burger King\" flagged by users",
                          "1 day ago",
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNotificationItemTablet(
    String message,
    String timestamp, {
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: Color(0xFFE3E6EB), width: 1),
              ),
      ),
      child: _notificationContainer(message, timestamp),
    );
  }
}

///////////////////////////////////////////////////
/// ----------------- MOBILE LAYOUT -----------------
///////////////////////////////////////////////////
class _MobileNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Sidebar()),
      backgroundColor: const Color(0xFFF5F7FD),
      appBar: const AdminMobileAppBar(showSettings: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Notifications",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildNotificationItemMobile(
                    "New restaurant \"Pizza Palace\" pending approval",
                    "2 hours ago",
                  ),
                  _buildNotificationItemMobile(
                    "3 new deals waiting for review",
                    "4 hours ago",
                  ),
                  _buildNotificationItemMobile(
                    "Video from \"Burger King\" flagged by users",
                    "1 day ago",
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItemMobile(
    String message,
    String timestamp, {
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: Color(0xFFE3E6EB), width: 1),
              ),
      ),
      child: _notificationContainer(message, timestamp),
    );
  }
}

///////////////////////////////////////////////////
/// --------------- COMMON LABELS -----------------
///////////////////////////////////////////////////

Widget _notificationContainer(String message, String timestamp) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    decoration: BoxDecoration(
      color: const Color(0xFFF1F4F9),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          timestamp,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B6B6B),
          ),
        ),
      ],
    ),
  );
}
