
import 'package:dealdine_application/widgets/category_pie_chart.dart';
import 'package:dealdine_application/widgets/city_pie_chart.dart';
import 'package:dealdine_application/widgets/line_chart_container.dart';
import 'package:dealdine_application/widgets/responsive_layout.dart';
import 'package:dealdine_application/widgets/sidebar.dart';
import 'package:dealdine_application/widgets/stats_cards.dart';
import 'package:dealdine_application/widgets/topbar.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _MobileDashboard(),
      tablet: _TabletDashboard(),
      web: _WebDashboard(),
    );
  }
}

/// ----------------- WEB LAYOUT -----------------
class _WebDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatsCards(),
          const SizedBox(height: 20),
          const LineChartContainer(),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(child: CategoryPieChart()),
              SizedBox(width: 20),
              Expanded(child: CityPieChart()),
            ],
          )
        ],
      ),
    );
  }
}

/// ----------------- TABLET LAYOUT -----------------
class _TabletDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Sidebar()),
      backgroundColor: const Color(0xffF3F4F8),
      body: Column(
        children: [
          const TopBar(showMenu: true),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  StatsCards(),
                  SizedBox(height: 20),
                  LineChartContainer(),
                  SizedBox(height: 20),
                  CategoryPieChart(),
                  SizedBox(height: 20),
                  CityPieChart()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// ----------------- MOBILE LAYOUT (UPDATED) -----------------
class _MobileDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Sidebar()),
      backgroundColor: const Color(0xffF3F4F8),
      appBar: const AdminMobileAppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            AdminMobileSearchField(),
            SizedBox(height: 16),

            /// 👉 Dashboard text aligned left
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 16),

            StatsCards(),
            SizedBox(height: 20),
            LineChartContainer(),
            SizedBox(height: 20),
            CategoryPieChart(),
            SizedBox(height: 20),
            CityPieChart(),
          ],
        ),
      ),
    );
  }
}
