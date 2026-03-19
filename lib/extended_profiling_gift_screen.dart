import 'package:flutter/material.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/orb_widget.dart';
import 'package:beaut/extended_profiling_complete_screen.dart';

class ExtendedProfilingGiftScreen extends StatefulWidget {
  const ExtendedProfilingGiftScreen({super.key});

  @override
  State<ExtendedProfilingGiftScreen> createState() => _ExtendedProfilingGiftScreenState();
}

class _ExtendedProfilingGiftScreenState extends State<ExtendedProfilingGiftScreen> {
  final List<String> _giftHabits = [
    "Yes – I love gifting beauty",
    "Sometimes – if I find something perfect",
    "Only on birthdays or special occasions",
    "I intend to... but forget until last minute",
    "Nope – I’m strictly a me shopper",
    "I buy “gifts” that end up with me",
  ];

  String? _selectedHabit = "I buy “gifts” that end up with me";

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
                    // Progress Indicator (Green for final step)
                    _buildProgressIndicator("8/8", isFinal: true),
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
                        "Do you shop for anyone else too?",
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
                        "We’ll tailor gift ideas and reminders just in time.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Gift Habits List
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _giftHabits.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final habit = _giftHabits[index];
                          final isSelected = _selectedHabit == habit;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedHabit = habit;
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
                                      habit,
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
                          builder: (context) => const ExtendedProfilingCompleteScreen(),
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

  Widget _buildProgressIndicator(String progress, {bool isFinal = false}) {
    final Color borderColor = isFinal ? const Color(0xFF34C759) : Colors.white24;
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 2),
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
