
import 'dart:math';
import 'package:dealdine_application/widgets/left_sidebar.dart';
import 'package:dealdine_application/widgets/mobile_appbar.dart';
import 'package:dealdine_application/widgets/top_navbar.dart';
import 'package:flutter/material.dart';

class RestaurantDashboardScreen extends StatelessWidget {
  const RestaurantDashboardScreen({super.key});

  static const double pageHorizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWeb = width >= 1000;
    final isTablet = width >= 600 && width < 1000;
    final isMobile = !isWeb && !isTablet;

    final List<double> points = [
      10, 28, 40, 35, 60, 48, 70, 45, 65, 80, 60, 70, 50, 60
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFdee2e6),

      // --------------------------
      // MOBILE APPBAR + DRAWER
      // --------------------------
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile
          ? Drawer(child: LeftSidebar(width: 220, showLabels: true))
          : null,

      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT SIDEBAR (Web/Tablet)
            if (isWeb || isTablet)
              LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),

            // MAIN CONTENT AREA
            Expanded(
              child: Column(
                children: [
                  // TOP NAV BAR (Web/Tablet)
                  if (!isMobile) const TopNavBar(isWeb: true),

                  // SEARCH FIELD BELOW APPBAR (Mobile Only)
                  if (isMobile)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search deals...',
                          prefixIcon: const Icon(Icons.search),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),


                  // SCROLLABLE CONTENT
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: pageHorizontalPadding, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 1),

                              Text(
                                'Dashboard',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 18),

                              _MetricsRow(isWeb: isWeb, isTablet: isTablet),
                              const SizedBox(height: 20),

                              const _ActiveDeals(),
                              const SizedBox(height: 22),

                              _SalesChart(points: points),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
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

// -------------------------
// METRICS ROW, METRIC CARD, ACTIVE DEALS, SALES CHART


/* ----------------------- METRICS ROW ----------------------- */
class _MetricsRow extends StatelessWidget {
  final bool isWeb;
  final bool isTablet;
  const _MetricsRow({required this.isWeb, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final spacing = 14.0;

    final cards = [
      _MetricCard(
          title: 'Active Deals',
          value: '200',
          foot: '8.5% Up from yesterday',
          accent: const Color(0xFF8280FF),
          icon: Icons.local_offer_outlined),
      _MetricCard(
          title: 'Total Views',
          value: '10293',
          foot: '1.3% Up from past week',
          accent: const Color(0xFFFEC53D),
          icon: Icons.remove_red_eye_outlined),
      _MetricCard(
          title: 'Redemptions',
          value: '200',
          foot: '4.3% Down from yesterday',
          accent: const Color(0xFF4AD991),
          icon: Icons.redeem_outlined),
      _MetricCard(
          title: 'Conversion Rate',
          value: '6.8%',
          foot: '1.8% Up from yesterday',
          accent: const Color(0xFFFF9066),
          icon: Icons.pie_chart_outline),
    ];

    if (isWeb) {
      return Row(
        children: [
          for (int i = 0; i < cards.length; i++)
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: i == 0 ? 0 : spacing),
                    child: cards[i])),
        ],
      );
    } else {
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: cards
            .map((c) => SizedBox(
                width: MediaQuery.of(context).size.width /
                    (isTablet ? 2.2 : 1.05),
                child: c))
            .toList(),
      );
    }
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String foot;
  final Color accent;
  final IconData icon;

  const _MetricCard(
      {required this.title,
      required this.value,
      required this.foot,
      required this.accent,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 6))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Color(0xFF6B7180), fontSize: 13)),
                  const SizedBox(height: 6),
                  Text(value,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text(foot,
                      style: const TextStyle(
                          color: Color(0xFF3AA374), fontSize: 12)),
                ]),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
                color: accent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: accent, size: 22),
          ),
        ],
      ),
    );
  }
}

/* ----------------------- ACTIVE DEALS ----------------------- */
class _ActiveDeals extends StatelessWidget {
  const _ActiveDeals();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 6))
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Active Deals',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          SizedBox(height: 12),
          _DealRow(
              title: '20% Off Burgers',
              subtitle: 'Get 20% off all burgers meals',
              expiry: 'Expires: 2025-08-15',
              views: '1250 views',
              redeemed: '86 redeemed'),
          _DealRow(
              title: '20% Off Pizza',
              subtitle: 'Get 15% off pizza combos',
              expiry: 'Expires: 2025-08-20',
              views: '980 views',
              redeemed: '72 redeemed'),
          _DealRow(
              title: 'Buy 1 Get 1 Free',
              subtitle: 'Special on fries',
              expiry: 'Expires: 2025-08-25',
              views: '450 views',
              redeemed: '34 redeemed'),
        ],
      ),
    );
  }
}

class _DealRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String expiry;
  final String views;
  final String redeemed;

  const _DealRow(
      {required this.title,
      required this.subtitle,
      required this.expiry,
      required this.views,
      required this.redeemed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
          color: const Color(0xFFF6F9FB),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text(subtitle,
                    style:
                        const TextStyle(fontSize: 13, color: Color(0xFF6B7180))),
                const SizedBox(height: 8),
                Text(expiry,
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xFF9DA6B0))),
              ])),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(views,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Color(0xFF23303B))),
            const SizedBox(height: 6),
            Text(redeemed,
                style: const TextStyle(fontSize: 12, color: Color(0xFF3AA374))),
          ])
        ],
      ),
    );
  }
}

/* ----------------------- SALES CHART ----------------------- */

class _SalesChart extends StatelessWidget {
  final List<double> points;
  const _SalesChart({required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 6))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Sales Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: const Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: const [
                    Text('October',
                        style: TextStyle(fontSize: 12, color: Color(0xFF6B7180))),
                    Icon(Icons.keyboard_arrow_down,
                        size: 18, color: Color(0xFF6B7180))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
              height: 260,
              child: CustomPaint(
                  painter: _SalesPainter(points), child: Container())),
        ],
      ),
    );
  }
}

/* ----------------------- SALES PAINTER ----------------------- */
class _SalesPainter extends CustomPainter {
  final List<double> pts;
  _SalesPainter(this.pts);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    const leftPadding = 45.0,
        rightPadding = 20.0,
        topPadding = 25.0,
        bottomPadding = 35.0;
    final chartW = w - leftPadding - rightPadding,
        chartH = h - topPadding - bottomPadding;

    const yLabels = ["100%", "80%", "60%", "40%", "20%"];
    final labelStyle = TextStyle(color: Color(0xFF9DA6B0), fontSize: 11);
    final gridPaint = Paint()..color = const Color(0xFFE8EBEF)..strokeWidth = 1;

    for (int i = 0; i < yLabels.length; i++) {
      final y = topPadding + (chartH / (yLabels.length - 1)) * i;
      canvas.drawLine(Offset(leftPadding, y), Offset(leftPadding + chartW, y),
          gridPaint);
      final tp = TextPainter(
          text: TextSpan(text: yLabels[i], style: labelStyle),
          textDirection: TextDirection.ltr)
        ..layout();
      tp.paint(canvas, Offset(leftPadding - tp.width - 8, y - tp.height / 2));
    }

    if (pts.isEmpty) return;

    final maxV = pts.reduce(max),
        minV = pts.reduce(min),
        range = (maxV - minV == 0) ? 1 : maxV - minV;
    List<Offset> points = [];
    for (int i = 0; i < pts.length; i++) {
      final x = leftPadding + chartW * (i / (pts.length - 1));
      final y = topPadding + chartH - ((pts[i] - minV) / range * chartH);
      points.add(Offset(x, y));
    }

    Path curve = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 0; i < points.length - 1; i++) {
      final p0 = i == 0 ? points[i] : points[i - 1],
          p1 = points[i],
          p2 = points[i + 1],
          p3 = i + 2 < points.length ? points[i + 2] : points[i + 1];
      for (double t = 0; t < 1; t += 0.05) {
        final tt = t * t, ttt = tt * t;
        double x = 0.5 *
            ((2 * p1.dx) +
                (-p0.dx + p2.dx) * t +
                (2 * p0.dx - 5 * p1.dx + 4 * p2.dx - p3.dx) * tt +
                (-p0.dx + 3 * p1.dx - 3 * p2.dx + p3.dx) * ttt);
        double y = 0.5 *
            ((2 * p1.dy) +
                (-p0.dy + p2.dy) * t +
                (2 * p0.dy - 5 * p1.dy + 4 * p2.dy - p3.dy) * tt +
                (-p0.dy + 3 * p1.dy - 3 * p2.dy + p3.dy) * ttt);
        curve.lineTo(x, y);
      }
    }

    Path fillPath = Path.from(curve)
      ..lineTo(points.last.dx, topPadding + chartH)
      ..lineTo(points.first.dx, topPadding + chartH)
      ..close();
    final gradient = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x33FF6B00), Color(0x00FF6B00)])
        .createShader(Rect.fromLTWH(0, 0, w, h));
    canvas.drawPath(fillPath, Paint()..shader = gradient);
    canvas.drawPath(
        curve,
        Paint()
          ..color = const Color(0xFFFF6B00)
          ..strokeWidth = 2.4
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round);
    final dotPaint = Paint()..color = const Color(0xFFFF6B00);
    for (final p in points) canvas.drawCircle(p, 4, dotPaint);

    const xLabels = [
      "5k",
      "10k",
      "15k",
      "20k",
      "25k",
      "30k",
      "35k",
      "40k",
      "45k",
      "50k",
      "55k",
      "60k"
    ];
    for (int i = 0; i < xLabels.length; i++) {
      final x = leftPadding + (chartW / (xLabels.length - 1)) * i;
      final tp2 = TextPainter(
          text: TextSpan(text: xLabels[i], style: labelStyle),
          textDirection: TextDirection.ltr)
        ..layout();
      tp2.paint(canvas, Offset(x - tp2.width / 2, topPadding + chartH + 10));
    }
  }

  @override
  bool shouldRepaint(covariant _SalesPainter old) => old.pts != pts;
}