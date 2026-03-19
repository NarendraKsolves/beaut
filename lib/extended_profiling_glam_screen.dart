import 'package:flutter/material.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/orb_widget.dart';
import 'package:beaut/extended_profiling_content_screen.dart';

class ExtendedProfilingGlamScreen extends StatefulWidget {
  const ExtendedProfilingGlamScreen({super.key});

  @override
  State<ExtendedProfilingGlamScreen> createState() => _ExtendedProfilingGlamScreenState();
}

class _ExtendedProfilingGlamScreenState extends State<ExtendedProfilingGlamScreen> {
  final List<Map<String, String>> _occasions = [
    {
      'name': 'Nights out',
      'image': 'https://placehold.co/400x600/2D0008/FFFFFF.png?text=NIGHTS\nOUT',
    },
    {
      'name': 'Weddings',
      'image': 'https://placehold.co/400x600/2D0008/FFFFFF.png?text=WEDDINGS',
    },
    {
      'name': 'Festivals',
      'image': 'https://placehold.co/400x600/2D0008/FFFFFF.png?text=FESTIVALS',
    },
    {
      'name': 'Holidays',
      'image': 'https://placehold.co/400x600/2D0008/FFFFFF.png?text=HOLIDAYS',
    },
    {
      'name': 'Dates',
      'image': 'https://placehold.co/400x600/2D0008/FFFFFF.png?text=DATES',
    },
    {
      'name': 'Work',
      'image': 'https://placehold.co/400x600/2D0008/FFFFFF.png?text=WORK',
    },
  ];

  final Set<String> _selectedOccasions = {'Nights out'};

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
              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Progress Indicator
                    _buildProgressIndicator("6/8"),
                    Row(
                      children: [
                        _buildSmallIconButton(Icons.volume_up_outlined),
                        const SizedBox(width: 12),
                        _buildSmallIconButton(Icons.close),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "What do you get glam for?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "We’ll tailor looks, rituals, and offers around your calendar.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _occasions.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          final occasion = _occasions[index];
                          final isSelected = _selectedOccasions.contains(occasion['name']);
                          return _buildOccasionCard(occasion, isSelected);
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              // Footer
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavButton(Icons.arrow_back, () => Navigator.of(context).pop()),
                    const Hero(
                      tag: 'orb',
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: OrbWidget(),
                      ),
                    ),
                    _buildNavButton(Icons.arrow_forward, () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ExtendedProfilingContentScreen(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(String progress) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white24, width: 2),
      ),
      child: Center(
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF300008),
          ),
          child: Center(
            child: Text(
              progress,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOccasionCard(Map<String, String> occasion, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedOccasions.remove(occasion['name']);
          } else {
            _selectedOccasions.add(occasion['name']!);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white10,
            width: isSelected ? 2 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              occasion['image']!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: const Color(0xFF2D0008),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white24,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            // Text Label
            Positioned(
              left: 12,
              bottom: 12,
              child: Text(
                occasion['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Checkmark
            Positioned(
              right: 12,
              bottom: 12,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.transparent : Colors.white38,
                    width: 1.5,
                  ),
                  color: isSelected ? const Color(0xFF34C759) : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white24, width: 1.5),
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24, width: 1.5),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
