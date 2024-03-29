import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:path_provider/path_provider.dart';

import '../sample.dart';

class SampleProvider with ChangeNotifier {
  String? samplesDirectory;
  List<Sample> listOfSamples = [];

  Future<void> setSampleDir() async {
    Directory? directory = await getExternalStorageDirectory();
    samplesDirectory = "${directory!.path}/recordings/";
    getSamplesFromFile();
    notifyListeners();
  }

  //TODO: Creating and destroying audio files seems to be the path
  void getSamplesFromFile() async {
    List<FileSystemEntity> listOfFiles = await getFiles();
    for (FileSystemEntity file in listOfFiles) {
      log("We got data");
      List<String> fileString = file.path.split("/");
      fileString = fileString[fileString.length - 1].split(".");
      String fileName = fileString[1].split("-")[1];
      final audioPlayer = AudioPlayer();

      await audioPlayer.setFilePath(file.path);
      Duration? trackLength = audioPlayer.duration;
      if (trackLength == null) log("we are cooked gang");

      Sample newSample =
          Sample(file.path, name: fileName, length: trackLength!);
      log(newSample.toString());

      await audioPlayer.dispose();
      for (Sample sample in listOfSamples) {
        if (sample.path == newSample.path) return;
      }
      listOfSamples.add(newSample);
    }

    notifyListeners();

    // _listOfFiles[0].
  }

  //TODO: Make these function asyncronously

  //Makes sure that it's only pulling supported file formats
  Future<List<FileSystemEntity>> getFiles() async {
    List<FileSystemEntity> listOfFiles = [];
    Directory createDir = Directory(samplesDirectory!);
    if (!createDir.existsSync()) {
      createDir.createSync(recursive: true);
    }
    log(samplesDirectory!);
    for (FileSystemEntity file
        in Directory(samplesDirectory!).listSync(recursive: true)) {
      List<String> filePathList = file.path.split(".");
      // log(file.toString());
      String fileExtention = filePathList[filePathList.length - 1];
      if (fileExtention == "m4a" || fileExtention == "wav") {
        listOfFiles.add(file);
      }
    }

    return listOfFiles;
  }
}
