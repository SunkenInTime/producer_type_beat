import 'package:flutter/material.dart';
import 'package:producer_type_beat/screens/recording_screen.dart';
import 'package:producer_type_beat/screens/samples_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = const [
    RecordingScreen(),
    SamplesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.record_voice_over_outlined),
            title: const Text("Record"),
            selectedColor: Colors.red,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.audio_file),
            title: const Text("Samples"),
            selectedColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
