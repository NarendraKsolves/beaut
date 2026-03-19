import 'package:flutter/material.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/profiling_step_five_screen.dart';

class ProfilingStepFourScreen extends StatefulWidget {
  const ProfilingStepFourScreen({super.key});

  @override
  State<ProfilingStepFourScreen> createState() => _ProfilingStepFourScreenState();
}

class _ProfilingStepFourScreenState extends State<ProfilingStepFourScreen> {
  final Set<String> _selectedShops = {'TikTok'};

  final List<String> _shopOptions = [
    'Sephora', 'Superdrug', 'Amazon', 'TikTok', 'Boots', 'Lookfantastic'
  ];

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
              ProfilingTopBar(
                progress: "4/5",
                onSoundTap: () {},
                onCloseTap: () => Navigator.of(context).pop(),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const ProfilingHeader(
                        title: "Where do you usually shop for beauty?",
                        subtitle: "We'll tailor your recs based on where you love to browse.",
                      ),
                      const SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: _shopOptions.length,
                        itemBuilder: (context, index) {
                          final shop = _shopOptions[index];
                          final isSelected = _selectedShops.contains(shop);
                          return ShopCard(
                            name: shop,
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedShops.remove(shop);
                                } else {
                                  _selectedShops.add(shop);
                                }
                              });
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              
              ProfilingBottomNav(
                onBackTap: () => Navigator.of(context).pop(),
                onNextTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfilingStepFiveScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
