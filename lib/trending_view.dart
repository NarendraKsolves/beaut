import 'package:flutter/material.dart';
import 'package:beaut/home_widgets.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero Card
        const FeatureHeroCard(
          title: "Going Viral",
          imageUrl: "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=1000&auto=format&fit=crop", // High-glam portrait
        ),

        const SizedBox(height: 16),

        // Two-Column Feed
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                child: Column(
                  children: [
                    const HomeContentCard(
                      title: "A dream GRWM tutorial with tools to use everyday",
                      author: "Refy Beauty creators",
                      imageUrl: "https://images.unsplash.com/photo-1616683693504-3ea7e9ad6fec?q=80&w=1000&auto=format&fit=crop",
                      avatars: [
                        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=100&auto=format&fit=crop",
                        "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=100&auto=format&fit=crop",
                      ],
                    ),
                    const SizedBox(height: 24),
                    const HomeContentCard(
                      title: "Swipe through and see a blush shade matched to skin tone",
                      author: "Skin Science Team",
                      imageUrl: "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=1000&auto=format&fit=crop",
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
                      brand: "Refy Beauty",
                      title: "Glow Bomb + Pouty Glow",
                      price: "£28.00",
                      tag: "Smells Like Heaven",
                      imageUrl: "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=400&auto=format&fit=crop",
                    ),
                    const SizedBox(height: 24),
                    const HomeProductCard(
                      brand: "Ouai",
                      title: "Beach Club Texture Spray",
                      price: "£26.00",
                      tag: "Perfect For Volume",
                      imageUrl: "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=400&auto=format&fit=crop",
                    ),
                    const SizedBox(height: 24),
                    const HomeProductCard(
                      brand: "Lancôme",
                      title: "Mr. Big Lancôme Mascara",
                      price: "£24.00",
                      tag: "Viral Favorite",
                      imageUrl: "https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?q=80&w=400&auto=format&fit=crop",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Selena's Reels
        const SectionHeader(title: "Selena’s Reels"),
        _buildHorizontalReels(),

        // Last Scanned by You
        const SectionHeader(title: "Last Scanned by You"),
        _buildLastScanned(),

        // Most Loved Treatments
        const SectionHeader(title: "Most Loved Treatments"),
        _buildTreatmentList(),

        // Prompt Buttons
        const SectionHeader(title: "Ask Away"),
        _buildAskAwayButtons(),

        // New From The Tubes
        const SectionHeader(title: "New From The Tubes"),
        _buildRoutineishList("https://images.unsplash.com/photo-1556228720-195a672e8a03?q=80&w=400&auto=format&fit=crop"),

        // Staff Picks
        const SectionHeader(title: "Staff Picks This Month"),
        _buildRoutineishList("https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=400&auto=format&fit=crop"),

        // Faves from 2023
        const SectionHeader(title: "Faves from 2023"),
        _buildRoutineishList("https://images.unsplash.com/photo-1571781926291-c477ebfd024b?q=80&w=400&auto=format&fit=crop"),

        // Latest Tutorial Edit
        const SectionHeader(title: "Latest Tutorial Edit"),
        _buildHorizontalReels(),

        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildHorizontalReels() {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final reelImages = [
            "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=400&auto=format&fit=crop",
            "https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=400&auto=format&fit=crop",
            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=400&auto=format&fit=crop",
          ];
          return SizedBox(
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.network(
                reelImages[index % reelImages.length],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLastScanned() {
    final products = [
      ["The Ordinary", "Hyaluronic Acid 2% + B5", "https://theordinary.deciem.com/dw/image/v2/BDRG_PRD/on/demandware.static/-/Sites-deciem-master-catalog/default/dw1554526d/Images/products/The%20Ordinary/rdn-hyaluronic-acid-2-b5-30ml.png"],
      ["La Roche-Posay", "Anthelios XL Ultra-Light", "https://www.laroche-posay.co.uk/dw/image/v2/AAJI_PRD/on/demandware.static/-/Sites-larocheposay-master-catalog/default/dw60d1ed14/Anthelios/XL_Ultra_Light_Fluid/3337875546379_Anthelios_Invisible_Fluid_Unfragranced_SPF50_50ml.jpg"],
      ["Avène", "Cicalfate+ Restorative Cream", "https://www.avene.co.uk/dw/image/v2/AAJI_PRD/on/demandware.static/-/Sites-avene-master-catalog/default/dw0f6e174b/product_images/Cicalfate/Cicalfate_Cream/3282770204667_Cicalfate_Restorative_Protective_Cream_40ml.jpg"],
    ];
    return SizedBox(
      height: 280, // Increased to prevent overflow
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
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
                      image: NetworkImage(products[index][2]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  products[index][1],
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  products[index][0],
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTreatmentList() {
    final treatments = [
      ["HydraFacial Glow Boost", "Vibe Check", "£85.00"],
      ["Face Sculpt Magic Masquerade", "Smells Like Heaven", "£120.00"],
      ["Dermaplaning + Enzyme Peel Combo", "Viral Glow", "£95.00"],
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

  Widget _buildRoutineishList(String imgUrl) {
    return SizedBox(
      height: 270, // Increased to prevent overflow
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
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
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Product Name",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                ),
                const Text(
                  "Brand Name",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAskAwayButtons() {
    final prompts = ["Best serums for glow?", "Trending blushes to try", "Makeup for glass skin"];
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
