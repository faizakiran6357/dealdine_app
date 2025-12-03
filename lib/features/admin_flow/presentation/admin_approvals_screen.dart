// import 'package:flutter/material.dart';

// class AdminApprovalsScreen extends StatelessWidget {
//   const AdminApprovalsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Approvals")),
//       body: const Center(child: Text("Pending Restaurant Approvals")),
//     );
//   }
// }
import 'package:dealdine_application/widgets/responsive_layout.dart';
import 'package:dealdine_application/widgets/sidebar.dart';
import 'package:dealdine_application/widgets/topbar.dart';
import 'package:flutter/material.dart';

class AdminApprovalsScreen extends StatelessWidget {
  const AdminApprovalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _MobileApprovals(),
      tablet: _TabletApprovals(),
      web: _WebApprovals(),
    );
  }
}

//
// ---------------------------- WEB LAYOUT ----------------------------
//
class _WebApprovals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pending Approvals",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),

          Container(
            height: MediaQuery.of(context).size.height - 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // HEADER
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE3EEFF),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 2, child: Text("NAME", style: _headerStyle)),
                      Expanded(
                          flex: 1, child: Text("TYPE", style: _headerStyle)),
                      Expanded(
                          flex: 2,
                          child: Text("SUBMITTED", style: _headerStyle)),
                      Expanded(
                          flex: 2, child: Text("DETAILS", style: _headerStyle)),
                      Expanded(
                          flex: 2, child: Text("ACTIONS", style: _headerStyle)),
                    ],
                  ),
                ),

                // ROWS
                Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 2,
                                child: Text("Pizza Palace", style: _rowStyle)),
                            const Expanded(
                                flex: 1,
                                child: Text("Restaurant", style: _rowStyle)),
                            const Expanded(
                                flex: 2,
                                child: Text("2024-01-15", style: _rowStyle)),
                            const Expanded(
                                flex: 2,
                                child: Text("Fast Food", style: _rowStyle)),

                            // ACTIONS
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  _ActionButton(
                                    icon: Icons.check_circle,
                                    label: "Approve",
                                    color: Colors.teal,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 12),
                                  _ActionButton(
                                    icon: Icons.cancel,
                                    label: "Reject",
                                    color: Colors.red,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// ---------------------------- TABLET LAYOUT ----------------------------
//
class _TabletApprovals extends StatelessWidget {
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
                    "Pending Approvals",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE3EEFF),
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text("NAME", style: _headerStyle)),
                              Expanded(
                                  flex: 1,
                                  child: Text("TYPE", style: _headerStyle)),
                              Expanded(
                                  flex: 2,
                                  child: Text("SUBMITTED", style: _headerStyle)),
                              Expanded(
                                  flex: 2,
                                  child: Text("DETAILS", style: _headerStyle)),
                              Expanded(
                                  flex: 2,
                                  child: Text("ACTIONS", style: _headerStyle)),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 600,
                          child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 20),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade200),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 2,
                                        child: Text("Pizza Palace",
                                            style: _rowStyle)),
                                    const Expanded(
                                        flex: 1,
                                        child: Text("Restaurant",
                                            style: _rowStyle)),
                                    const Expanded(
                                        flex: 2,
                                        child:
                                            Text("2024-01-15", style: _rowStyle)),
                                    const Expanded(
                                        flex: 2,
                                        child:
                                            Text("Fast Food", style: _rowStyle)),

                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          _ActionButton(
                                            icon: Icons.check_circle,
                                            label: "Approve",
                                            color: Colors.teal,
                                            onPressed: () {},
                                          ),
                                          const SizedBox(width: 12),
                                          _ActionButton(
                                            icon: Icons.cancel,
                                            label: "Reject",
                                            color: Colors.red,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
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
}

//
// ---------------------------- MOBILE LAYOUT (FIXED OPTION A) ----------------------------
//
class _MobileApprovals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Sidebar()),
      backgroundColor: const Color(0xFFF5F7FD),
      appBar: const AdminMobileAppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminMobileSearchField(),
            const SizedBox(height: 16),
            const Text(
              "Pending Approvals",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // MOBILE TABLE (Horizontal Scroll)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // HEADER
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE3EEFF),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Row(
                        children: const [
                          _MobileHeaderCell("NAME", width: 130),
                          _MobileHeaderCell("TYPE", width: 90),
                          _MobileHeaderCell("SUBMITTED", width: 130),
                          _MobileHeaderCell("DETAILS", width: 120),
                          _MobileHeaderCell("ACTIONS", width: 180),
                        ],
                      ),
                    ),
                  ),

                  // ROWS
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey.shade200),
                              ),
                            ),
                            child: Row(
                              children: [
                                _MobileRowCell("Pizza Palace", width: 130),
                                _MobileRowCell("Restaurant", width: 90),
                                _MobileRowCell("2024-01-15", width: 130),
                                _MobileRowCell("Fast Food", width: 120),

                                //
                                // ****** FIXED ACTIONS (NO OVERFLOW) ******
                                //
                                SizedBox(
                                  width: 180,
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 6,
                                    children: [
                                      _ActionButton(
                                        icon: Icons.check_circle,
                                        label: "Approve",
                                        color: Colors.teal,
                                        onPressed: () {},
                                      ),
                                      _ActionButton(
                                        icon: Icons.cancel,
                                        label: "Reject",
                                        color: Colors.red,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// ---------------------------- SHARED WIDGETS ----------------------------
//

class _MobileHeaderCell extends StatelessWidget {
  final String text;
  final double width;

  const _MobileHeaderCell(this.text, {required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: _headerStyle.copyWith(fontSize: 12),
      ),
    );
  }
}

class _MobileRowCell extends StatelessWidget {
  final String text;
  final double width;

  const _MobileRowCell(this.text, {required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: _rowStyle.copyWith(fontSize: 13),
      ),
    );
  }
}

const TextStyle _headerStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
  color: Colors.black54,
);

const TextStyle _rowStyle = TextStyle(
  fontSize: 14,
  color: Colors.black87,
  fontWeight: FontWeight.w500,
);

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color, size: 18),
      label: Text(
        label,
        style: TextStyle(color: color, fontSize: 13),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        side: BorderSide(color: color.withOpacity(0.4)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}