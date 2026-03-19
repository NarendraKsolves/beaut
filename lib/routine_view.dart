import 'package:flutter/material.dart';
import 'package:beaut/home_widgets.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero Card
        const FeatureHeroCard(
          title: "Routine Insights",
          imageUrl: "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=1000&auto=format&fit=crop", // Reliable girl image
        ),

        const SizedBox(height: 16),

        // Essentials List
        const SectionHeader(title: "Essentials"),
        _buildHorizontalProducts([
          ["Glow Recipe", "Watermelon Glow Pink Moisturiser", "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=400&auto=format&fit=crop", "Use everyday"],
          ["The Ordinary", "Hyaluronic Acid 2% + B5", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?q=80&w=400&auto=format&fit=crop", "Almost empty"],
          ["La Roche-Posay", "Anthelios UV SPF 50+", "https://images.unsplash.com/photo-1571781926291-c477ebfd024b?q=80&w=400&auto=format&fit=crop", "Sun protection"],
        ]),

        // Morning Routine Steps
        const SectionHeader(title: "Morning Routine"),
        _buildRoutineSteps(),

        // Quick Actions
        const SectionHeader(title: "Quick Actions", hasFilter: false),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              QuickActionTile(
                icon: Icons.edit_note_outlined,
                title: "Edit Routine",
                subtitle: "Add, remove or reorder steps",
              ),
              QuickActionTile(
                icon: Icons.auto_awesome_outlined,
                title: "Create a Look",
                subtitle: "Pair your routine with a makeup look",
              ),
              QuickActionTile(
                icon: Icons.chat_bubble_outline,
                title: "Ask Beauty",
                subtitle: "AI buddy for routine help",
              ),
            ],
          ),
        ),

        // Routine Prompts
        const SectionHeader(title: "Routine Prompts"),
        _buildRoutinePrompts(),

        // Skin Tracker & Results
        const SectionHeader(title: "Skin Tracker & Results", hasFilter: false),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SkinTrackerCard(
            userName: "Ruby Thompson",
            date: "Summer, 21 Sept 2023",
            userImageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200&auto=format&fit=crop",
          ),
        ),

        // Shelf Manager
        const SectionHeader(title: "Shelf Manager"),
        _buildHorizontalProducts([
          ["COSRX", "Snail 96 Mucin Power Essence", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?q=80&w=400&auto=format&fit=crop", "60% left"],
          ["e.l.f.", "Holy Hydration! Cleansing Balm", "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=400&auto=format&fit=crop", "Low Stock"],
          ["Laneige", "Lip Sleeping Mask Berry", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?q=80&w=400&auto=format&fit=crop", "Use nightly"],
        ]),

        // Weekly Treatments
        const SectionHeader(title: "Weekly Treatments"),
        _buildWeeklyTreatments(),

        // Routine Hub
        const SectionHeader(title: "Routine Hub"),
        _buildRoutineHub(),

        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildHorizontalProducts(List<List<String>> items) {
    return SizedBox(
      height: 300, // Safe height for text and tags
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

  Widget _buildRoutineSteps() {
    final steps = [
      ["Step 1: Cleanse", "Wash eyes cleanse your skin", "https://images.unsplash.com/photo-1556228720-195a672e8a03?q=80&w=400&auto=format&fit=crop"],
      ["Step 2: Tone", "To prepare for hydration", "https://images.unsplash.com/photo-1571781926291-c477ebfd024b?q=80&w=400&auto=format&fit=crop"],
    ];
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: steps.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(steps[index][2]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  steps[index][0],
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                Text(
                  steps[index][1],
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRoutinePrompts() {
    final prompts = ["Should I modify my routine?", "Next step for my routine?", "Is my routine clean?"];
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: prompts.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Text(
              prompts[index],
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWeeklyTreatments() {
    final treatments = [
      ["HydraGlow Express Facial", "Deep Hydration", "£55.00"],
      ["AHA + Enzyme Resurfacing Peel", "For Ruby Thompson", "£70.00"],
      ["LED Light Therapy Boost", "Trouble Zone", "£35.00"],
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: treatments.map((t) => _buildLovedItem(t[0], t[1], t[2])).toList(),
      ),
    );
  }

  Widget _buildLovedItem(String title, String label, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            ),
            child: const Icon(Icons.spa_outlined, color: Color(0xFFA50021), size: 28),
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
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                Text(
                  price,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black38),
        ],
      ),
    );
  }

  Widget _buildRoutineHub() {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 2,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final titles = ["The Skincare Sandwich Method: Why It Works", "Nighttime Routine (Oily Skin Edition)"];
          final images = [
            "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?q=80&w=400&auto=format&fit=crop",
            "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=400&auto=format&fit=crop",
          ];
          return SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
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
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  "Read more in Routine Hub",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
