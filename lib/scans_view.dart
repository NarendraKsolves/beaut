import 'package:flutter/material.dart';
import 'package:beaut/home_widgets.dart';

class ScansView extends StatelessWidget {
  const ScansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero Card
        const FeatureHeroCard(
          title: "Unlock Rewards",
          imageUrl: "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=1000&auto=format&fit=crop", // High-glam beauty
        ),

        const SizedBox(height: 16),

        // Recently Scanned Horizontal List
        const SectionHeader(title: "Recently Scanned"),
        _buildHorizontalProducts([
          ["Fenty Beauty", "Gloss Bomb - Fenty Glow", "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=400&auto=format&fit=crop", "Most Personal Look"],
          ["Charlotte Tilbury", "Beauty Light Wand - Pinkgasm", "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=400&auto=format&fit=crop", "Tribal Matte Healthy"],
          ["Ouai", "Beach Club Volumizing Spray", "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=400&auto=format&fit=crop", "Perfect For Volume"],
        ]),

        // Smart Insights Overview
        const SectionHeader(title: "Smart Insights", hasFilter: false),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _InsightGauge(label: "Pores", value: 0.75, color: Color(0xFF34C759)),
              _InsightGauge(label: "Skin Balance", value: 0.85, color: Color(0xFF34C759)),
              _InsightGauge(label: "Usage", value: 0.65, color: Color(0xFF34C759)),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Notification Banner
        _buildNotificationBanner(),

        // Scan Actions
        const SectionHeader(title: "Scan Actions", hasFilter: false),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              ActionItemTile(
                icon: Icons.shopping_bag_outlined,
                title: "Scan products",
                subtitle: "Where exactly is your product?",
                iconBgColor: Color(0xFFFDE8EB),
              ),
              SizedBox(height: 12),
              ActionItemTile(
                icon: Icons.assignment_outlined,
                title: "Scan ingredients",
                subtitle: "Get quick definitions and safety breakdown",
                iconBgColor: Color(0xFFFDE8EB),
              ),
              SizedBox(height: 12),
              ActionItemTile(
                icon: Icons.face_outlined,
                title: "Scan your face",
                subtitle: "Track your skin over time",
                iconBgColor: Color(0xFFFDE8EB),
              ),
              SizedBox(height: 12),
              ActionItemTile(
                icon: Icons.qr_code_scanner_outlined,
                title: "Scan barcodes or QR codes",
                subtitle: "Pull up reviews, routines and more instantly",
                iconBgColor: Color(0xFFFDE8EB),
              ),
            ],
          ),
        ),

        // Ingredient Filters
        const SectionHeader(title: "Ingredient Filters"),
        _buildIngredientSection("Most Loved Ingredients", [
          ["Niacinamide", "Skin Smoothing", "Skin smoothing", Color(0xFF34C759)],
          ["Green Tea", "Regenerating", "Regenerating", Color(0xFF34C759)],
        ]),
        _buildIngredientSection("Ingredients to Watch", [
          ["Denatured Alcohol", "Tends dry", "Tends drying", Color(0xFFFFCC00)],
          ["Coconut Oil", "May clog pores", "May clog pores", Color(0xFFFFCC00)],
        ]),

        // Routine Hub - Why Niacinamide
        const SectionHeader(title: "Routine Hub"),
        _buildRoutineHub(),

        // Aura Points Tracker
        const SectionHeader(title: "Aura Points Review", hasFilter: false),
        const AuraTrackerCard(
          progress: 0.85,
          points: "85/100",
          tier: "Tier II",
          rank: "Top 2% in London Circle",
        ),
        _buildChecklist([
          "You’ve scanned 12 products this month",
          "+10 XP for reviewing your cleanser",
          "Earn some points for scanning a full routine",
        ]),

        // Recent Scans Vertical List
        const SectionHeader(title: "Recent Scans"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              RecentScanReviewCard(
                brand: "Laneige",
                product: "Lip Sleeping Mask - Berry",
                imageUrl: "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=400&auto=format&fit=crop",
              ),
              RecentScanReviewCard(
                brand: "Aveeno",
                product: "Calm + Restore Oat Gel Moisturizer",
                imageUrl: "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=400&auto=format&fit=crop",
              ),
              RecentScanReviewCard(
                brand: "The Ordinary",
                product: "Niacinamide 10% + Zinc 1%",
                imageUrl: "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=400&auto=format&fit=crop",
              ),
            ],
          ),
        ),

        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildHorizontalProducts(List<List<String>> items) {
    return SizedBox(
      height: 300, // Safe height for 4+ lines of text
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(items[index][2]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  items[index][1],
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  items[index][0],
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
                Text(
                  items[index][3],
                  style: const TextStyle(color: Color(0xFFA50021), fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildIngredientSection(String title, List<dynamic> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black45)),
              const Text("See all", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
            ],
          ),
        ),
        ...items.map((item) => IngredientTile(
          name: item[0],
          effect: item[1],
          status: item[2],
          statusColor: item[3],
        )).toList(),
      ],
    );
  }

  Widget _buildNotificationBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFA50021),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
            child: const Icon(Icons.notifications_active, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New Look Just Dropped", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text("Nina Ubhi posted a new tutorial you need to try.", style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
          const Icon(Icons.close, color: Colors.white70, size: 18),
        ],
      ),
    );
  }

  Widget _buildRoutineHub() {
    return SizedBox(
      height: 320,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 2,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final items = [
            ["Why Niacinamide Keeps Showing Up In Your Products", "Community Beauty", "https://theordinary.deciem.com/dw/image/v2/BDRG_PRD/on/demandware.static/-/Sites-deciem-master-catalog/default/dw1554526d/Images/products/The%20Ordinary/rdn-niacinamide-10pct-zinc-1pct-30ml.png"],
            ["3 Products You’re Missing In Your Evening Routine", "Community Beauty", "https://images.unsplash.com/photo-1540555700478-4be289fbecee?q=80&w=400&auto=format&fit=crop"],
          ];
          return SizedBox(
            width: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    image: DecorationImage(image: NetworkImage(items[index][2]), fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 12),
                Text(items[index][0], style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                Text(items[index][1], style: const TextStyle(color: Colors.black54, fontSize: 13)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChecklist(List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Expanded(child: Text(item, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87))),
              const Icon(Icons.check_circle, color: Color(0xFF34C759), size: 24),
            ],
          ),
        )).toList(),
      ),
    );
  }
}

class _InsightGauge extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _InsightGauge({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                height: 25,
                child: CustomPaint(
                  painter: _ArcPainter(value: value, color: color),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Icon(Icons.check, size: 14, color: color),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${(value * 100).toInt()}%",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: color),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black87),
        ),
      ],
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double value;
  final Color color;

  _ArcPainter({required this.value, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final strokeWidth = 5.0;

    final paintBg = Paint()
      ..color = color.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final paintHighlight = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Background Arc (180 degrees)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14, // Start at 180 degrees
      3.14, // Sweep 180 degrees
      false,
      paintBg,
    );

    // Progress Arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14,
      3.14 * value,
      false,
      paintHighlight,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
