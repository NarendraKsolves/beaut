import 'package:flutter/material.dart';
import 'package:beaut/orb_widget.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/home_screen.dart';

class ExtendedProfilingCompleteScreen extends StatelessWidget {
  const ExtendedProfilingCompleteScreen({super.key});

  static const Color _darkBgColor = Color(0xFF1A0005);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkBgColor,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [_darkBgColor, Colors.black],
              ),
            ),
          ),
          
          // Confetti Layer
          const ConfettiOverlay(),

          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Reward Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.stars, color: Colors.black, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "+50 Aura Points",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Hero Orb
                      const Hero(
                        tag: 'orb',
                        child: SizedBox(
                          width: 250,
                          height: 250,
                          child: OrbWidget(),
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Celebration Text
                      const Text.rich(
                        TextSpan(
                          text: "You’re ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Outfit',
                          ),
                          children: [
                            TextSpan(
                              text: "ready",
                              style: TextStyle(
                                color: Color(0xFFE55C3E), // Maroon/Orange
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(text: " to go"),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Nice work. That’s 100 Aura Points and 10 free scans just for finishing onboarding.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    children: [
                      // Let's See My Space
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                            (route) => false,
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
                            "Let’s See My Space",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Edit My Answers
                      GestureDetector(
                        onTap: () {
                          // Go back or to an edit flow
                        },
                        child: const Text(
                          "Edit My Answers",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
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
        ],
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
}
