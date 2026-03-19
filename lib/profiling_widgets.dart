import 'package:flutter/material.dart';
import 'package:beaut/orb_widget.dart';
import 'dart:math' as math;

class ProfilingTopBar extends StatelessWidget {
  final String progress;
  final VoidCallback onSoundTap;
  final VoidCallback onCloseTap;

  final bool isLastStep;

  const ProfilingTopBar({
    super.key,
    required this.progress,
    required this.onSoundTap,
    required this.onCloseTap,
    this.isLastStep = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (progress.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isLastStep ? const Color(0xFF34C759) : Colors.white24,
                  width: 2,
                ),
                color: isLastStep
                    ? const Color(0xFF34C759).withOpacity(0.2)
                    : Colors.transparent,
              ),
              child: Text(
                progress,
                style: TextStyle(
                  color: isLastStep ? const Color(0xFF34C759) : Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else
            const SizedBox(width: 32),
          Row(
            children: [
              _buildSmallIconButton(Icons.volume_up_outlined, onSoundTap),
              const SizedBox(width: 12),
              _buildSmallIconButton(Icons.close, onCloseTap),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24, width: 1.5),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

class ProfilingHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProfilingHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Outfit',
          ),
        ),
        if (subtitle.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }
}

class ProfilingOptionGrid extends StatelessWidget {
  final List<String> options;
  final Set<String> selection;
  final Function(String) onToggle;

  const ProfilingOptionGrid({
    super.key,
    required this.options,
    required this.selection,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        final isSelected = selection.contains(option);
        return GestureDetector(
          onTap: () => onToggle(option),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF300008),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? Colors.white : Colors.white10,
                width: isSelected ? 2 : 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    option,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
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
                        width: 1.5),
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
    );
  }
}

class ProfilingBottomNav extends StatelessWidget {
  final VoidCallback onBackTap;
  final VoidCallback onNextTap;

  const ProfilingBottomNav({
    super.key,
    required this.onBackTap,
    required this.onNextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavButton(Icons.arrow_back, onBackTap),
          const SizedBox(width: 30),
          const Hero(
            tag: 'orb',
            child: SizedBox(
              width: 60,
              height: 60,
              child: OrbWidget(),
            ),
          ),
          const SizedBox(width: 30),
          _buildNavButton(Icons.arrow_forward, onNextTap),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white38, width: 1.5),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}

class InfluencerCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const InfluencerCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white10,
            width: isSelected ? 2 : 1.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
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
                  stops: const [0.6, 1.0],
                ),
              ),
            ),
            // Name
            Positioned(
              left: 12,
              bottom: 12,
              right: 48,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
                    color: isSelected ? Colors.transparent : Colors.white54,
                    width: 1.5,
                  ),
                  color: isSelected ? const Color(0xFF34C759) : Colors.black26,
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
}

class ShopCard extends StatelessWidget {
  final String name;
  final String? logoPath;
  final bool isSelected;
  final VoidCallback onTap;

  const ShopCard({
    super.key,
    required this.name,
    this.logoPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : const Color(0xFF300008),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 2,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Logo / Name
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: logoPath != null
                    ? Image.asset(logoPath!)
                    : Text(
                        name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                          fontFamily: 'Outfit',
                        ),
                      ),
              ),
            ),
            // Name Label at bottom left
            Positioned(
              left: 16,
              bottom: 16,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Checkmark
            Positioned(
              right: 16,
              bottom: 16,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.transparent : Colors.white38,
                    width: 1.5,
                  ),
                  color:
                      isSelected ? const Color(0xFF34C759) : Colors.transparent,
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
}

class ProfilingOptionList extends StatelessWidget {
  final List<String> options;
  final String? selection;
  final Function(String) onSelect;

  const ProfilingOptionList({
    super.key,
    required this.options,
    this.selection,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final option = options[index];
        final isSelected = selection == option;
        return GestureDetector(
          onTap: () => onSelect(option),
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
                    option,
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
    );
  }
}

class ProductMatchCard extends StatelessWidget {
  final String title;
  final String brand;
  final String score;
  final Color scoreColor;
  final String? imagePath;
  final bool isSelected;
  final VoidCallback onAddTap;
  final VoidCallback onDetailsTap;

  const ProductMatchCard({
    super.key,
    required this.title,
    required this.brand,
    required this.score,
    required this.scoreColor,
    this.imagePath,
    required this.isSelected,
    required this.onAddTap,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Product Image Placeholder
          Container(
            width: 80,
            height: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: imagePath != null
                ? Image.asset(imagePath!, fit: BoxFit.cover)
                : const Icon(Icons.auto_awesome, color: Colors.grey, size: 40),
          ),
          const SizedBox(width: 16),
          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  brand,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: scoreColor,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          score,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onDetailsTap,
                      child: const Text(
                        "See Details",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Add Button
          GestureDetector(
            onTap: onAddTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black12, width: 1),
                color:
                    isSelected ? const Color(0xFF34C759) : Colors.transparent,
              ),
              child: Icon(
                isSelected ? Icons.check : Icons.add,
                color: isSelected ? Colors.white : Colors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CollectionProductCard extends StatelessWidget {
  final String title;
  final String brand;
  final String imagePath;
  final VoidCallback onRemove;

  const CollectionProductCard({
    super.key,
    required this.title,
    required this.brand,
    required this.imagePath,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: onRemove,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          brand,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ConfettiOverlay extends StatelessWidget {
  const ConfettiOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(40, (index) {
        final random = math.Random(index);
        final color = random.nextBool()
            ? const Color(0xFFE55C3E) // Red/Orange
            : (random.nextBool() ? const Color(0xFF008080) : Colors.white70); // Teal or White
        
        final size = random.nextDouble() * 8 + 4;
        final left = random.nextDouble() * 400; // Simulated screen width
        final top = random.nextDouble() * 800; // Simulated screen height
        final rotation = random.nextDouble() * math.pi;

        return Positioned(
          left: left,
          top: top,
          child: Transform.rotate(
            angle: rotation,
            child: Container(
              width: size * (1 + random.nextDouble()),
              height: size,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        );
      }),
    );
  }
}
