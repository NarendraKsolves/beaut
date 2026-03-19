import 'package:flutter/material.dart';
import 'package:beaut/home_widgets.dart';
import 'package:beaut/trending_view.dart';
import 'package:beaut/routine_view.dart';
import 'package:beaut/scans_view.dart';
import 'package:beaut/dashboard_screen.dart';
import 'package:beaut/ai_assistant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = "For You";
  int _selectedNavIndex = 0;

  final List<String> _categories = ["For You", "Trending", "Your Routine", "Scans"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DashboardScreen()),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Center(
                        child: Icon(Icons.face_retouching_natural, size: 20, color: Colors.black87),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: HomeCategoryBar(
                      categories: _categories,
                      selectedCategory: _selectedCategory,
                      onCategorySelected: (cat) {
                        setState(() {
                          _selectedCategory = cat;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: _buildBody(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: _selectedNavIndex,
        onTap: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
        },
        onOrbTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AIAssistantScreen()),
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedCategory) {
      case "Trending":
        return const TrendingView();
      case "Your Routine":
        return const RoutineView();
      case "Scans":
        return const ScansView();
      case "For You":
      default:
        return const ForYouView();
    }
  }
}

class ForYouView extends StatelessWidget {
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Feature HERO Card
        const FeatureHeroCard(
          title: "Ruby’s Rituals",
          imageUrl: "https://images.unsplash.com/photo-1596462502278-27bfdc403348?q=80&w=1000&auto=format&fit=crop",
        ),

        const SizedBox(height: 16),

        // Two-Column Feed Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              const Expanded(
                child: Column(
                  children: [
                    HomeContentCard(
                      title: "LOTD: Today’s Look, Tomorrow’s Screensaver",
                      author: "Yvonne Victoria",
                      imageUrl: "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=1000&auto=format&fit=crop",
                      avatars: [
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=100&auto=format&fit=crop",
                        "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=100&auto=format&fit=crop",
                      ],
                    ),
                    SizedBox(height: 24),
                    HomeContentCard(
                      title: "From Flat to Snatched: Contour 101",
                      author: "Nina Ubhi",
                      imageUrl: "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=1000&auto=format&fit=crop",
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right Column
              Expanded(
                child: Column(
                  children: [
                    const HomeProductCard(
                      brand: "Glow Recipe",
                      title: "Watermelon Drops",
                      price: "£32.00",
                      tag: "Perfect For Your Skin",
                      imageUrl: "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=1000&auto=format&fit=crop",
                    ),
                    const SizedBox(height: 24),
                    const HomeProductCard(
                      brand: "Kylie Cosmetics",
                      title: "Tinted Butter Balm",
                      price: "£18.00",
                      tag: "Based on Vibe",
                      imageUrl: "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=1000&auto=format&fit=crop",
                    ),
                    const SizedBox(height: 24),
                    const HomeProductCard(
                      brand: "Lancôme",
                      title: "Absolue Soft Cream",
                      price: "£78.00",
                      tag: "Repeat Favourite",
                      imageUrl: "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=1000&auto=format&fit=crop",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Notification Banner
        _buildNotificationBanner(),

        const SectionHeader(title: "Beauty Circle Favs"),
        _buildHorizontalContentList(),

        const AuraTrackerCard(
          progress: 0.68,
          points: "68/100",
          tier: "Tier II",
          rank: "Top 5% in London Circle",
        ),

        const SectionHeader(title: "Routine Additions"),
        _buildRoutineAdditions(),

        const SectionHeader(title: "Scan Like a Pro", hasFilter: false),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const ActionItemTile(
                icon: Icons.shopping_bag_outlined,
                title: "Scan products",
                subtitle: "What’s actually inside your products?",
                iconBgColor: Color(0xFFFDE8EB),
              ),
              const SizedBox(height: 12),
              const ActionItemTile(
                icon: Icons.assignment_outlined,
                title: "Scan ingredients",
                subtitle: "Get quick definitions and safety breakdowns",
                iconBgColor: Color(0xFFFDE8EB),
              ),
              const SizedBox(height: 12),
              const ActionItemTile(
                icon: Icons.face_outlined,
                title: "Scan your face",
                subtitle: "Track your skin over time",
                iconBgColor: Color(0xFFFDE8EB),
              ),
            ],
          ),
        ),

        const SectionHeader(title: "Based on Your Routine"),
        _buildPersonalizedContent(),

        const SectionHeader(title: "Most-Loved For Skin Like Yours"),
        _buildMostLovedList(),

        const SectionHeader(title: "Ask Away"),
        _buildAskAwayButtons(),

        const SizedBox(height: 100), // Bottom padding for nav
      ],
    );
  }

  Widget _buildNotificationBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFA50021), // Deep red
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.notifications_active, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Look Just Dropped",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  "Nina Ubhi posted a new tutorial you need to try.",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(Icons.close, color: Colors.white70, size: 18),
        ],
      ),
    );
  }

  Widget _buildHorizontalContentList() {
    return SizedBox(
      height: 250, // Increased to prevent overflow
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage([
                        "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=400&auto=format&fit=crop",
                        "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=400&auto=format&fit=crop",
                        "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=400&auto=format&fit=crop",
                      ][index % 3]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "What Everyone’s Wearing",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const Text(
                  "Bookmarked by Lana",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRoutineAdditions() {
    return SizedBox(
      height: 270, // Increased to prevent overflow
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final items = [
            ["Charlotte Tilbury", "Hollywood Contour Wand", "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=400&auto=format&fit=crop"],
            ["Chanel", "Hydra Beauty Micro Serum", "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=400&auto=format&fit=crop"],
            ["Tom Ford", "Oud Wood Body Oil", "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=400&auto=format&fit=crop"],
          ];
          return SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  items[index][0],
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPersonalizedContent() {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 2,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final titles = ["Tailored Just for You", "Your Routine, Upgrade"];
          final images = [
            "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=400&auto=format&fit=crop", // Girl image
            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=400&auto=format&fit=crop", // Another working face image
          ];
          return SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    image: DecorationImage(
                      image: NetworkImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  titles[index],
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const Text(
                  "Personalised by Beaut.ai",
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMostLovedList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildLovedItem("Lash Lift & Tint", "Most Popular", "£50.00"),
          const SizedBox(height: 12),
          _buildLovedItem("Hydrating Hair Mask", "Trending This Week", "£35.00"),
          const SizedBox(height: 12),
          _buildLovedItem("Brow Sculpt & Tint", "For Skin Like Yours", "£25.00"),
        ],
      ),
    );
  }

  Widget _buildLovedItem(String title, String label, String price) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFBE4E8).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.spa_outlined, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54),
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  price,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
              ],
            ),
          ),
          const Icon(Icons.info_outline, size: 20, color: Colors.black38),
        ],
      ),
    );
  }

  Widget _buildAskAwayButtons() {
    final prompts = ["What should I do before bed?", "What’s missing from my routine?", "Help me get the clean girl look"];
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: prompts.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Text(
              prompts[index],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          );
        },
      ),
    );
  }
}
