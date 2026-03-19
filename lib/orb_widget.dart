import 'package:flutter/material.dart';

class OrbWidget extends StatelessWidget {
  const OrbWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.3),
            blurRadius: 60,
            spreadRadius: 10,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 100,
            spreadRadius: 20,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
                width: 1.5,
              ),
            ),
          ),
          // Wispy Nebula Layer 1
          Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFB4FAD5).withOpacity(0.8), // Mint
                  const Color(0xFF14C8DA).withOpacity(0.5), // Teal
                  const Color(0xFFFFD700).withOpacity(0.2), // Gold/Yellow hint
                  Colors.transparent,
                ],
                stops: const [0.1, 0.4, 0.7, 1.0],
                center: const Alignment(-0.2, -0.2),
              ),
            ),
          ),
          // Wispy Nebula Layer 2 (offset)
          Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF00FFCC).withOpacity(0.4),
                  const Color(0xFF0F5A6E).withOpacity(0.3),
                  Colors.transparent,
                ],
                stops: const [0.2, 0.6, 1.0],
                center: const Alignment(0.3, 0.2),
              ),
            ),
          ),
          // Subtle glow/mist
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.8],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
