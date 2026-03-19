import 'package:flutter/material.dart';
import 'package:beaut/profiling_widgets.dart';
import 'package:beaut/scan_invitation_screen.dart';

class ProfilingStepFiveScreen extends StatefulWidget {
  const ProfilingStepFiveScreen({super.key});

  @override
  State<ProfilingStepFiveScreen> createState() => _ProfilingStepFiveScreenState();
}

class _ProfilingStepFiveScreenState extends State<ProfilingStepFiveScreen> {
  String? _selectedPreference = "I don't really track it (oops)";

  final List<String> _preferenceOptions = [
    'Budget queen – I love a good bargain',
    'I mix high-end with high street',
    'I splurge when it feels right',
    'Luxe only – I want the best of the best',
    "I don't really track it (oops)"
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
                progress: "5/5",
                isLastStep: true,
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
                        title: "Which beauty brands are you obsessed with right now?",
                        subtitle: "No judgement — we work with all wallets.",
                      ),
                      const SizedBox(height: 30),
                      ProfilingOptionList(
                        options: _preferenceOptions,
                        selection: _selectedPreference,
                        onSelect: (val) {
                          setState(() {
                            _selectedPreference = val;
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
                      builder: (context) => const ScanInvitationScreen(),
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
