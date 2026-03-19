import 'package:flutter/material.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/profiling_step_three_screen.dart';

class ProfilingStepTwoScreen extends StatefulWidget {
  const ProfilingStepTwoScreen({super.key});

  @override
  State<ProfilingStepTwoScreen> createState() => _ProfilingStepTwoScreenState();
}

class _ProfilingStepTwoScreenState extends State<ProfilingStepTwoScreen> {
  final Set<String> _selectedProducts = {'Serums', 'Highlighters', 'Brow products'};

  final List<String> _productOptions = [
    'Moisturisers', 'Serums', 'Sunscreen', 'Lip products', 
    'Foundations', 'Concealers', 'Highlighters', 'Eyeliners',
    'Brow products', 'Cleansers', 'Hair masks', 'Hair products',
    'Styling bits', 'Nail polish', 'Fragrances', 'Tools & brushes'
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
                progress: "2/5",
                onSoundTap: () {},
                onCloseTap: () => Navigator.of(context).pop(), // Future: should pop to main or choice screen
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const ProfilingHeader(
                        title: "What kind of products are you most into right now?",
                        subtitle: "Pick as many as you like.",
                      ),
                      const SizedBox(height: 20),
                      ProfilingOptionGrid(
                        options: _productOptions,
                        selection: _selectedProducts,
                        onToggle: (val) {
                          setState(() {
                            if (_selectedProducts.contains(val)) {
                              _selectedProducts.remove(val);
                            } else {
                              _selectedProducts.add(val);
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
                      builder: (context) => const ProfilingStepThreeScreen(),
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
