import 'package:flutter/material.dart';
import 'package:beaut/orb_widget.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/product_match_screen.dart';

class ScanInvitationScreen extends StatelessWidget {
  const ScanInvitationScreen({super.key});

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
              ProfilingTopBar(
                progress: "", // No progress circle for this specific screen in the image
                onSoundTap: () {},
                onCloseTap: () => Navigator.of(context).pop(),
              ),
              
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Large Central Orb
                    Hero(
                      tag: 'orb',
                      child: SizedBox(
                        width: 250,
                        height: 250,
                        child: OrbWidget(),
                      ),
                    ),
                    SizedBox(height: 40),
                    // "Let's take a closer look"
                    Text.rich(
                      TextSpan(
                        text: "Let's take a ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Outfit',
                        ),
                        children: [
                          TextSpan(
                            text: "closer",
                            style: TextStyle(
                              color: Color(0xFFE55C3E), // Maroon/Orange color from image
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(text: " look"),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Bottom Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    // Add Products Manually
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ProductMatchScreen(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFF300008),
                          side: const BorderSide(color: Color(0xFF600010), width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Add Products Manually",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Yes, Scan Now
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Yes, Scan Now (Takes 1-2 Mins)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Skip For Now
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Text(
                        "Skip For Now",
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
      ),
    );
  }
}
