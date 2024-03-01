import 'package:flutter/material.dart';
import 'package:producer_type_beat/providers/recording_provider.dart';
import 'package:producer_type_beat/widgets/record_button.dart';
import 'package:provider/provider.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  @override
  Widget build(BuildContext context) {
    RecordingProvider recordingProvider = context.watch<RecordingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Record"),
      ),
      body: Center(
        child: Column(
          children: [
            const Expanded(child: Column()),
            RecordButton(
              isRecording: recordingProvider.isRecording,
            )
          ],
        ),
      ),
    );
  }
}
