
import 'package:dealdine_application/widgets/responsive_layout.dart';
import 'package:dealdine_application/widgets/sidebar.dart';
import 'package:dealdine_application/widgets/topbar.dart';
import 'package:flutter/material.dart';

class AdminAnalyticsScreen extends StatelessWidget {
  const AdminAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _MobileAnalytics(),
      tablet: _TabletAnalytics(),
      web: _WebAnalytics(),
    );
  }
}

/* ===========================================================
                        WEB  DESIGN 
=========================================================== */
class _WebAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F4F8),
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* ---------- PAGE TITLE + EXPORT BUTTON ---------- */
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Restaurant Analytics",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Export",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        /* ---------- MAIN TABLE WRAPPER ---------- */
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              /* ---------- TABLE HEADER ---------- */
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(
                                  color: const Color(0xffE8F0FE),
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text("RESTAURANT",
                                              style: _headerStyle),
                                        )),
                                    Expanded(
                                        child: Text("TOTAL VIEWS",
                                            textAlign: TextAlign.center,
                                            style: _headerStyle)),
                                    Expanded(
                                        child: Text("ACTIVE DEALS",
                                            textAlign: TextAlign.center,
                                            style: _headerStyle)),
                                    Expanded(
                                        child: Text("RATING",
                                            textAlign: TextAlign.center,
                                            style: _headerStyle)),
                                    Expanded(
                                        child: Text("REVENUE",
                                            textAlign: TextAlign.center,
                                            style: _headerStyle)),
                                    Expanded(
                                        child: Text("GROWTH",
                                            textAlign: TextAlign.center,
                                            style: _headerStyle)),
                                  ],
                                ),
                              ),

                              /* ---------- TABLE ROWS ---------- */
                              Column(
                                children: List.generate(
                                  8,
                                  (index) => _buildTableRow(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /* ---------- SINGLE TABLE ROW ---------- */
  Widget _buildTableRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 0.6),
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Pizza Palace", style: _rowTextStyle),
            ),
          ),
          Expanded(
            child: Text("12,500",
                textAlign: TextAlign.center, style: _rowTextStyle),
          ),
          Expanded(
            child: Text("8",
                textAlign: TextAlign.center, style: _rowTextStyle),
          ),
          Expanded(
            child: Text("4.5",
                textAlign: TextAlign.center, style: _rowTextStyle),
          ),
          Expanded(
            child: Text("\$15,200",
                textAlign: TextAlign.center, style: _rowTextStyle),
          ),
          Expanded(
            child: Text("+12%",
                textAlign: TextAlign.center, style: _rowTextStyle),
          ),
        ],
      ),
    );
  }
}

/* ===========================================================
                      TEXT STYLES
=========================================================== */
const TextStyle _headerStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: Color(0xff4A4A4A),
);

const TextStyle _rowTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Color(0xff333333),
);

/* ===========================================================
                     TABLET  DESIGN
=========================================================== */

class _TabletAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Sidebar()),
      backgroundColor: const Color(0xffF3F4F8),
      body: Column(
        children: [
          const TopBar(showMenu: true),
          Expanded(
            child: Center(
              child: Text(
                "Analytics Page (Tablet UI Under Development)",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ===========================================================
                     MOBILE  DESIGN
=========================================================== */

class _MobileAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Sidebar()),
      backgroundColor: const Color(0xffF3F4F8),
      body: Column(
        children: [
          const TopBar(showMenu: true),
          Expanded(
            child: Center(
              child: Text(
                "Analytics Page (Mobile UI Under Development)",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
