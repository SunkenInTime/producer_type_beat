import 'package:flutter/material.dart';
import 'package:producer_type_beat/screens/recording_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const RecordingScreen();
  }
}
