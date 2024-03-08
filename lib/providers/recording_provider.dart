import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:producer_type_beat/func/helper_functions.dart';

import 'package:producer_type_beat/permission_helper.dart';
import 'package:record/record.dart';

class RecordingProvider with ChangeNotifier {
  bool isRecording = false;
  final record = AudioRecorder();
  void startRecording() async {
    try {
      final granted = await PermissionHelper.requestStoragePermissions();
      if (!granted) return;

      if (await record.hasPermission() && isRecording == false) {
        // Start recording to file

        String date = DateTime.now().toString();
        setRecordingStaus(true);
        String randomFileName = HelperFunctions().getRandomString(5);

        // Get the external storage directory

        Directory? directory = await getExternalStorageDirectory();
        String? storagePath = directory?.path;

        // Construct the file path
        String filePath = '$storagePath/recordings/$date-$randomFileName.wav';
        Directory createDir = Directory('$storagePath/recordings/');
        if (!createDir.existsSync()) {
          createDir.createSync(recursive: true);
        }

        // await File(filePath).create();
        await record.start(const RecordConfig(encoder: AudioEncoder.wav),
            path: filePath);
        // ... or to stream
        // final stream = await record.startStream(const RecordConfig(AudioEncoder.pcm16bits));
      }
    } catch (e) {
      setRecordingStaus(false);
      log(e.toString());
    }
  }

  void setRecordingStaus(bool value) {
    isRecording = value;
    notifyListeners();
  }

  void stopRecording() async {
    // Stop recording...
    try {
      final path = await record.stop();
      log(path!);
      setRecordingStaus(false);
      // record.dispose(); // As always, don't forget this one.
    } catch (e) {
      setRecordingStaus(false);
      log(e.toString());
    }
  }
}
