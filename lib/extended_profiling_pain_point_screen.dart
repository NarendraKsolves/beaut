import 'package:flutter/material.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/orb_widget.dart';
import 'package:beaut/extended_profiling_failed_buy_screen.dart';

class ExtendedProfilingPainPointScreen extends StatefulWidget {
  const ExtendedProfilingPainPointScreen({super.key});

  @override
  State<ExtendedProfilingPainPointScreen> createState() => _ExtendedProfilingPainPointScreenState();
}

class _ExtendedProfilingPainPointScreenState extends State<ExtendedProfilingPainPointScreen> {
  final List<String> _painPoints = [
    "SPF makes me look like a ghost",
    "Foundation never matches my tone",
    "Dry patches ruin my base",
    "I'm always oily by lunchtime",
    "I have no idea what ingredients do",
    "I keep switching products and regret it",
    "Dark circles won't budge",
    "Everything irritates my skin",
    "Lipstick never lasts",
    "I honestly don't know what I'm doing",
  ];

  String? _selectedPainPoint = "I have no idea what ingredients do";

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
                    _buildProgressIndicator("3/8"),
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
                        "What’s your biggest beauty pain point right now?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Tell us what’s been bugging you — we’ve got solutions.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Pain Points List
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _painPoints.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final point = _painPoints[index];
                          final isSelected = _selectedPainPoint == point;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedPainPoint = point;
                              });
                            },
                            child: Container(
                              height: 64,
                              decoration: BoxDecoration(
                                color: const Color(0xFF300008),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected ? Colors.white : Colors.white10,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      point,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected ? Colors.transparent : Colors.white38,
                                        width: 1.5,
                                      ),
                                      color: isSelected
                                          ? const Color(0xFF34C759)
                                          : Colors.transparent,
                                    ),
                                    child: isSelected
                                        ? const Icon(Icons.check, color: Colors.white, size: 16)
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          );
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
                          builder: (context) => const ExtendedProfilingFailedBuyScreen(),
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
