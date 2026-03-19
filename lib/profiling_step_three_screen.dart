import 'package:flutter/material.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/profiling_step_four_screen.dart';

class ProfilingStepThreeScreen extends StatefulWidget {
  const ProfilingStepThreeScreen({super.key});

  @override
  State<ProfilingStepThreeScreen> createState() => _ProfilingStepThreeScreenState();
}

class _ProfilingStepThreeScreenState extends State<ProfilingStepThreeScreen> {
  final Set<String> _selectedInfluencers = {'Judy Lim', 'Kali Ledger'};

  final List<Map<String, String>> _influencerData = [
    {'name': 'Judy Lim', 'image': 'assets/images/judy_lim_1773851783556.png'},
    {'name': 'NikkieTutorials', 'image': 'assets/images/nikkie_tutorials_1773851850237.png'},
    {'name': 'Jamie Genevieve', 'image': 'assets/images/jamie_genevieve_1773851875419.png'},
    {'name': 'Kali Ledger', 'image': 'assets/images/kali_ledger_1773851981326.png'},
    {'name': 'Symphani Soto', 'image': 'assets/images/influencer_5_1773852023854.png'},
    {'name': 'Eliza Rose', 'image': 'assets/images/influencer_6_1773852080231.png'},
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
                progress: "3/5",
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
                        title: "Who are you always double-tapping for inspo?",
                        subtitle: "Choose all your faves.",
                      ),
                      const SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: _influencerData.length,
                        itemBuilder: (context, index) {
                          final influencer = _influencerData[index];
                          final name = influencer['name']!;
                          final isSelected = _selectedInfluencers.contains(name);
                          return InfluencerCard(
                            name: name,
                            imagePath: influencer['image']!,
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedInfluencers.remove(name);
                                } else {
                                  _selectedInfluencers.add(name);
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
                      builder: (context) => const ProfilingStepFourScreen(),
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
