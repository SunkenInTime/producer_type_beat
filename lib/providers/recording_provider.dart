import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:record/record.dart';

class RecordingProvider with ChangeNotifier {
  final record = AudioRecorder();
  bool isRecording = false;

  void startRecording() async {
    if (await record.hasPermission() && isRecording == false) {
      // Start recording to file
      setRecordingStaus(true);
      await record.start(const RecordConfig(),
          path: '/storage/emulated/0/Download/myFile.m4a');
      // ... or to stream
      // final stream = await record.startStream(const RecordConfig(AudioEncoder.pcm16bits));
    }
  }

  void setRecordingStaus(bool value) {
    isRecording = value;
    notifyListeners();
  }

  void stopRecording() async {
    // Stop recording...

    final path = await record.stop();
    log(path!);
    setRecordingStaus(false);
    record.dispose(); // As always, don't forget this one.
  }
}
