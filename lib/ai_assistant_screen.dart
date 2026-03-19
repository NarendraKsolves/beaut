import 'package:flutter/material.dart';
import 'package:beaut/orb_widget.dart';
import 'package:beaut/home_widgets.dart';

class AIAssistantScreen extends StatelessWidget {
  const AIAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Base color
      body: Stack(
        children: [
          // Background Glow (Multi-stop for smoother transition)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2E0509), // Burgundy top
                    Color(0xFF0F0203), // Transition
                    Colors.black,      // Black bottom
                  ],
                  stops: [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          // Centered Glow Layer
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.0,
                  colors: [
                    const Color(0xFF42080D).withOpacity(0.6), // Saturated glow
                    Colors.black.withOpacity(0.0),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Scale orb based on screen height to ensure it fits
                final double orbSize = (constraints.maxHeight * 0.38).clamp(200.0, 310.0);
                
                return Column(
                  children: [
                    // Top Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCircleIcon(Icons.more_horiz, size: 24),
                          _buildCircleIcon(Icons.add, size: 24),
                        ],
                      ),
                    ),
                    
                    const Spacer(),
                    
                    // Central Orb (Responsive)
                    Center(
                      child: Container(
                        width: orbSize,
                        height: orbSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all( // Outer Rim (Brighter and Sharper)
                            color: Colors.white.withOpacity(0.35),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF14C8DA).withOpacity(0.12),
                              blurRadius: 100,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                        child: const OrbWidget(),
                      ),
                    ),
                    
                    SizedBox(height: constraints.maxHeight * 0.05), // Responsive gap
                    
                    // Greeting Text
                    Text(
                      "Good evening, Ruby.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (constraints.maxHeight * 0.035).clamp(20.0, 27.0),
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Ready to unwind?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (constraints.maxHeight * 0.035).clamp(20.0, 27.0),
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                    
                    const Spacer(flex: 2),
                    
                    // Action Chips
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: const [
                          AssistantChip(text: "Why is my skin\nfeeling dry?"),
                          AssistantChip(text: "What’s missing\nfrom my routine?"),
                          AssistantChip(text: "Help me even\nmy skin tone"),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Interaction Hint
                    const Text(
                      "Tap to type · Hold to talk",
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: -1,
        isDark: true,
        onTap: (index) {
          Navigator.pop(context);
        },
        onOrbTap: () {},
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon, {double size = 24}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white24, width: 1.2),
      ),
      child: Icon(icon, color: Colors.white, size: size),
    );
  }
}

class AssistantChip extends StatelessWidget {
  final String text;
  const AssistantChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 170,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1D0306).withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
