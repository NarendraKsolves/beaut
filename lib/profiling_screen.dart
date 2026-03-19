import 'package:flutter/material.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/profiling_step_two_screen.dart';

class ProfilingScreen extends StatefulWidget {
  const ProfilingScreen({super.key});

  @override
  State<ProfilingScreen> createState() => _ProfilingScreenState();
}

class _ProfilingScreenState extends State<ProfilingScreen> {
  final Set<String> _selectedSkinTypes = {'Not sure'};
  final Set<String> _selectedHairTypes = {'Curly'};

  final List<String> _skinOptions = [
    'Oily', 'Dry', 'Combination', 'Sensitive', 'Normal', 'Acne-Prone', 'Dehydrated', 'Not sure'
  ];

  final List<String> _hairOptions = [
    'Straight', 'Wavy', 'Curly', 'Frizzy', 'Fine', 'Thick', 'Colour-treated', 'Not sure'
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
                progress: "1/5",
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
                        title: "How would you describe your skin?",
                        subtitle: "Tap all that apply, no stress.",
                      ),
                      const SizedBox(height: 20),
                      ProfilingOptionGrid(
                        options: _skinOptions,
                        selection: _selectedSkinTypes,
                        onToggle: (val) {
                          setState(() {
                            if (_selectedSkinTypes.contains(val)) {
                              _selectedSkinTypes.remove(val);
                            } else {
                              _selectedSkinTypes.add(val);
                            }
                          });
                        },
                      ),
                      
                      const SizedBox(height: 40),
                      
                      const ProfilingHeader(
                        title: "And how would you describe your hair?",
                        subtitle: "",
                      ),
                      const SizedBox(height: 20),
                      ProfilingOptionGrid(
                        options: _hairOptions,
                        selection: _selectedHairTypes,
                        onToggle: (val) {
                          setState(() {
                            if (_selectedHairTypes.contains(val)) {
                              _selectedHairTypes.remove(val);
                            } else {
                              _selectedHairTypes.add(val);
                            }
                          });
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
                      builder: (context) => const ProfilingStepTwoScreen(),
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
