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
          Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFB4FAD5).withOpacity(0.8),
                  const Color(0xFF14C8DA).withOpacity(0.5),
                  const Color(0xFF0F5A6E).withOpacity(0.2),
                  Colors.transparent,
                ],
                stops: const [0.1, 0.4, 0.8, 1.0],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.transparent,
                  Color(0x22FFFFFF),
                  Colors.transparent,
                ],
                stops: [0.3, 0.5, 0.7],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
