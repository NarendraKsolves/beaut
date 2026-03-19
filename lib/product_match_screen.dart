import 'package:flutter/material.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/product_detail_screen.dart';
import 'package:beaut/collection_screen.dart';

class ProductMatchScreen extends StatefulWidget {
  const ProductMatchScreen({super.key});

  @override
  State<ProductMatchScreen> createState() => _ProductMatchScreenState();
}

class _ProductMatchScreenState extends State<ProductMatchScreen> {
  final Set<String> _selectedProducts = {};

  final List<Map<String, dynamic>> _matches = [
    {
      'title': 'No.3 Hair Perfector™',
      'brand': 'Olaplex',
      'score': '58/100',
      'scoreColor': const Color(0xFFFFCC00), // Yellow
      'imagePath': 'assets/images/olaplex_no3.png',
    },
    {
      'title': 'No.4 Bond Maintenance® Shampoo',
      'brand': 'Olaplex',
      'score': '72/100',
      'scoreColor': const Color(0xFF34C759), // Green
      'imagePath': 'assets/images/olaplex_no4.png',
    },
  ];

  static const Color _darkBgColor = Color(0xFF1A0005);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkBgColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_darkBgColor, Colors.black],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Nav
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white24, width: 1.5),
                        ),
                        child: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const ProfilingHeader(
                        title: "We've found two matches.",
                        subtitle: "Select the product you're looking for.",
                      ),
                      const SizedBox(height: 30),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _matches.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final match = _matches[index];
                          final isSelected =
                              _selectedProducts.contains(match['title']);
                          return ProductMatchCard(
                            title: match['title'],
                            brand: match['brand'],
                            score: match['score'],
                            scoreColor: match['scoreColor'],
                            imagePath: match['imagePath'],
                            isSelected: isSelected,
                            onAddTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedProducts.remove(match['title']);
                                } else {
                                  _selectedProducts.add(match['title']);
                                }
                              });
                            },
                            onDetailsTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(product: match),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Buttons
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFF300008),
                          side: const BorderSide(
                              color: Color(0xFF600010), width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Scan More Products",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CollectionScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Confirm Collection",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
