import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          product['brand'].toString().toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black12),
              ),
              child: const Icon(Icons.ios_share, color: Colors.black, size: 20),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Product Image Carousel
                Container(
                  height: 300,
                  width: double.infinity,
                  color: const Color(0xFFF9F9F9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Image.asset(
                          product['imagePath'] ?? 'assets/images/olaplex_no3.png',
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(true),
                          _buildDot(false),
                          _buildDot(false),
                          _buildDot(false),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Product Title & Price
                      Text(
                        product['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Outfit',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "£28.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star_border, size: 20, color: Colors.black45),
                          const SizedBox(width: 4),
                          const Text(
                            "3.6 (1.2k)",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      // Badges
                      _buildBadges(),

                      const SizedBox(height: 32),
                      // Match Result Card
                      _buildMatchCard(),

                      const SizedBox(height: 32),
                      // Ingredients Section
                      _buildIngredientsSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Sticky Bottom Button
          Positioned(
            left: 24,
            right: 24,
            bottom: 30,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  side: const BorderSide(color: Color(0xFF1A0005), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Add To My Collection",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.black12,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildBadges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBadgePlaceholder(const Color(0xFFFDE8EA), "ECO"),
        _buildBadgePlaceholder(const Color(0xFFE7F3ED), "FSC"),
        _buildBadgePlaceholder(const Color(0xFFF1F8E9), "B"),
        _buildBadgePlaceholder(const Color(0xFFE8F5E9), "DOT"),
        _buildBadgePlaceholder(const Color(0xFFE3F2FD), "PETA"),
      ],
    );
  }

  Widget _buildBadgePlaceholder(Color color, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildMatchCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Not A Perfect Match",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Text(
                    product['score'] ?? "58/100",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.error_outline, color: Colors.red, size: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Segmented Progress Bar
          Row(
            children: [
              _buildProgressBarSegment(const Color(0xFFE55C3E), true),
              const SizedBox(width: 4),
              _buildProgressBarSegment(const Color(0xFFE55C3E), true),
              const SizedBox(width: 4),
              _buildProgressBarSegment(const Color(0xFFE55C3E).withOpacity(0.8), true),
              const SizedBox(width: 4),
              _buildProgressBarSegment(Colors.white, false),
              const SizedBox(width: 4),
              _buildProgressBarSegment(Colors.white, false),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "This formula may be a bit heavy.",
                style: TextStyle(color: Colors.black87, fontSize: 14),
              ),
              const Text(
                "Explore",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBarSegment(Color color, bool isFilled) {
    return Expanded(
      child: Container(
        height: 8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          border: isFilled ? null : Border.all(color: Colors.black12),
        ),
      ),
    );
  }

  Widget _buildIngredientsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Ingredients",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                const Text(
                  "Show all",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildIngredientRow("Bis-Aminopropyl Diglycol Dimaleate", "Moderate risk", Colors.amber),
        const Divider(height: 32),
        _buildIngredientRow("Ascorbic Acid (Vitamin C)", "Low risk", Colors.green),
        const Divider(height: 32),
        _buildIngredientRow("Panthenol", "Low risk", Colors.green),
      ],
    );
  }

  Widget _buildIngredientRow(String name, String riskLvl, Color riskColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            Text(
              riskLvl,
              style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: riskColor.withOpacity(0.2),
              ),
              child: Icon(
                riskLvl.contains("Low") ? Icons.check : Icons.priority_high,
                color: riskColor,
                size: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
