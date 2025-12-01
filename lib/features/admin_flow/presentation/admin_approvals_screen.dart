
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

/// ----------------- WEB LAYOUT -----------------
class _WebApprovals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FD),
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: [
                const TopBar(),
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
                        const SizedBox(height: 20),

                        // Table Container
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
                              // Header Row
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE3EEFF),
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                ),
                                child: const Row(
                                  children: [
                                    Expanded(flex: 2, child: Text("NAME", style: _headerStyle)),
                                    Expanded(flex: 1, child: Text("TYPE", style: _headerStyle)),
                                    Expanded(flex: 2, child: Text("SUBMITTED", style: _headerStyle)),
                                    Expanded(flex: 2, child: Text("DETAILS", style: _headerStyle)),
                                    Expanded(flex: 2, child: Text("ACTIONS", style: _headerStyle)),
                                  ],
                                ),
                              ),

                              // Table Rows
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(color: Colors.grey.shade200),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            flex: 2,
                                            child: Text("Pizza Palace", style: _rowStyle),
                                          ),
                                          const Expanded(
                                            flex: 1,
                                            child: Text("Restaurant", style: _rowStyle),
                                          ),
                                          const Expanded(
                                            flex: 2,
                                            child: Text("2024-01-15", style: _rowStyle),
                                          ),
                                          const Expanded(
                                            flex: 2,
                                            child: Text("Fast Food", style: _rowStyle),
                                          ),

                                          // ACTION BUTTONS
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(Icons.check_circle, color: Colors.teal, size: 20),
                                                    const SizedBox(width: 4),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        "Approve",
                                                        style: TextStyle(color: Colors.teal, fontSize: 14),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 12),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.cancel, color: Colors.red, size: 20),
                                                    const SizedBox(width: 4),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        "Reject",
                                                        style: TextStyle(color: Colors.red, fontSize: 14),
                                                      ),
                                                    ),
                                                  ],
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
          )
        ],
      ),
    );
  }
}

/// ----------------- TABLET LAYOUT -----------------
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

                  // Table Container
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
                        // Header Row
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE3EEFF),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: const Row(
                            children: [
                              Expanded(flex: 2, child: Text("NAME", style: _headerStyle)),
                              Expanded(flex: 1, child: Text("TYPE", style: _headerStyle)),
                              Expanded(flex: 2, child: Text("SUBMITTED", style: _headerStyle)),
                              Expanded(flex: 2, child: Text("DETAILS", style: _headerStyle)),
                              Expanded(flex: 2, child: Text("ACTIONS", style: _headerStyle)),
                            ],
                          ),
                        ),

                        // Table Rows
                        SizedBox(
                          height: 600,
                          child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Text("Pizza Palace", style: _rowStyle),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text("Restaurant", style: _rowStyle),
                                    ),
                                    const Expanded(
                                      flex: 2,
                                      child: Text("2024-01-15", style: _rowStyle),
                                    ),
                                    const Expanded(
                                      flex: 2,
                                      child: Text("Fast Food", style: _rowStyle),
                                    ),

                                    // ACTION BUTTONS
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.check_circle, color: Colors.teal, size: 20),
                                              const SizedBox(width: 4),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Approve",
                                                  style: TextStyle(color: Colors.teal, fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 12),
                                          Row(
                                            children: [
                                              const Icon(Icons.cancel, color: Colors.red, size: 20),
                                              const SizedBox(width: 4),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Reject",
                                                  style: TextStyle(color: Colors.red, fontSize: 14),
                                                ),
                                              ),
                                            ],
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

/// ----------------- MOBILE LAYOUT -----------------
class _MobileApprovals extends StatelessWidget {
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pending Approvals",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Table Container
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
                        // Header Row
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE3EEFF),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: const Row(
                            children: [
                              Expanded(flex: 2, child: Text("NAME", style: _headerStyle)),
                              Expanded(flex: 1, child: Text("TYPE", style: _headerStyle)),
                              Expanded(flex: 2, child: Text("SUBMITTED", style: _headerStyle)),
                              Expanded(flex: 2, child: Text("DETAILS", style: _headerStyle)),
                              Expanded(flex: 2, child: Text("ACTIONS", style: _headerStyle)),
                            ],
                          ),
                        ),

                        // Table Rows
                        SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Text("Pizza Palace", style: _rowStyle),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text("Restaurant", style: _rowStyle),
                                    ),
                                    const Expanded(
                                      flex: 2,
                                      child: Text("2024-01-15", style: _rowStyle),
                                    ),
                                    const Expanded(
                                      flex: 2,
                                      child: Text("Fast Food", style: _rowStyle),
                                    ),

                                    // ACTION BUTTONS
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.check_circle, color: Colors.teal, size: 20),
                                              const SizedBox(width: 4),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Approve",
                                                  style: TextStyle(color: Colors.teal, fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 12),
                                          Row(
                                            children: [
                                              const Icon(Icons.cancel, color: Colors.red, size: 20),
                                              const SizedBox(width: 4),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Reject",
                                                  style: TextStyle(color: Colors.red, fontSize: 14),
                                                ),
                                              ),
                                            ],
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
