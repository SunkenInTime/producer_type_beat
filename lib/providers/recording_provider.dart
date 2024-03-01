import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:producer_type_beat/func/helper_functions.dart';
import 'package:producer_type_beat/permission_helper.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class RecordingProvider with ChangeNotifier {
  final record = AudioRecorder();
  bool isRecording = false;

  void startRecording() async {
    try {
      final granted = await PermissionHelper.requestStoragePermissions();
      if (!granted) return;
      if (await record.hasPermission() && isRecording == false) {
        // Start recording to file
        String date = DateTime.now().toString();
        setRecordingStaus(true);
        String randomFileName = HelperFunctions().getRandomString(5);
        log("/storage/emulated/0/Download/$date-$randomFileName.m4a");
        // Get the external storage directory
        Directory? directory = await getExternalStorageDirectory();
        String? storagePath = directory?.path;

        // Construct the file path
        String filePath = '$storagePath/Download/$date-$randomFileName.m4a';
        await record.start(const RecordConfig(), path: filePath);
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
      record.dispose(); // As always, don't forget this one.
    } catch (e) {
      setRecordingStaus(false);
      log(e.toString());
    }
  }
}
