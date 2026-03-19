import 'package:flutter/material.dart';
import 'package:beaut/profiling_screen.dart';
import 'package:beaut/orb_widget.dart';

class ExperienceChoiceScreen extends StatelessWidget {
  const ExperienceChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A0005),
              Color(0xFF000000),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Bar with Icons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildIconButton(Icons.volume_up_outlined, () {}),
                    const SizedBox(width: 12),
                    _buildIconButton(Icons.close, () => Navigator.of(context).pop()),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              
              // Glowing Orb
              const Center(
                child: OrbWidget(),
              ),
              
              const Spacer(flex: 1),
              
              // Text Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Outfit',
                    ),
                    children: [
                      TextSpan(text: 'Ruby, say '),
                      TextSpan(
                        text: 'hey',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color(0xFFFF7A00),
                        ),
                      ),
                      TextSpan(text: ' to Beauty'),
                    ],
                  ),
                ),
              ),
              
              const Spacer(flex: 3),
              
              // Bottom Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    // Skip To The Essentials button
                    _buildExperienceButton(
                      text: 'Skip To The Essentials (2 Mins)',
                      isPrimary: false,
                      onPressed: () => _showExitDialog(context),
                    ),
                    const SizedBox(height: 16),
                    // Get The Full Experience button
                    _buildExperienceButton(
                      text: 'Get The Full Experience (7 Mins)',
                      isPrimary: true,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfilingScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    // I'll Do This Later link
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Text(
                        "I'll Do This Later",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  static const Color _primaryColor = Color(0xFF8B0020);

  Widget _buildExperienceButton({
    required String text,
    required bool isPrimary,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? Colors.white : _primaryColor,
          foregroundColor: isPrimary ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: isPrimary 
              ? BorderSide.none 
              : const BorderSide(color: Color(0xFFFF0033), width: 0.5),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Leave onboarding?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'If you skip now, your experience won\'t be fully personalized and we won\'t be able to tailor content, tips, or product recs to you.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                // Stay & Finish Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Stay & Finish',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Exit Anyway Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                      Navigator.of(context).pop(); // Exit screen
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: _primaryColor, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Exit Anyway',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

