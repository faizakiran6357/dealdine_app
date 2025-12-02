import 'package:dealdine_application/widgets/sidebar.dart';
import 'package:dealdine_application/widgets/topbar.dart';
import 'package:flutter/material.dart';

/// Shared layout that keeps the admin sidebar and top bar mounted
/// while the inner content swaps based on the active admin route.
class AdminShell extends StatelessWidget {
  final Widget child;

  const AdminShell({super.key, required this.child});

  static const _backgroundColor = Color(0xffF3F4F8);
  static const double _webBreakpoint = 1000;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= _webBreakpoint) {
          return Scaffold(
            backgroundColor: _backgroundColor,
            body: Row(
              children: [
                const Sidebar(),
                Expanded(
                  child: Column(
                    children: [
                      const TopBar(),
                      Expanded(
                        child: Container(
                          color: _backgroundColor,
                          child: child,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        // On tablet & mobile we keep the original screen layouts (they already
        // manage their own Scaffold + Drawer behavior).
        return child;
      },
    );
  }
}

