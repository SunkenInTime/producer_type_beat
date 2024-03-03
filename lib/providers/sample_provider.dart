import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
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

  void getSamplesFromFile() async {
    List<FileSystemEntity> listOfFiles = await getFiles();
    for (FileSystemEntity file in listOfFiles) {
      log("We got data");
      List<String> fileString = file.path.split(".")[0].split("/");
      String fileName = fileString[fileString.length - 1];
      // final metadata = await MetadataRetriever.fromFile(File(file.path));
      int trackLength = 0;
      // if (metadata.trackDuration != null) trackLength = metadata.trackDuration!;
      Sample newSample = Sample(file.path, name: fileName, length: trackLength);
      log(newSample.toString());
      listOfSamples.add(newSample);
    }

    // _listOfFiles[0].
  }

  //TODO: Make these function asyncronously

  //Makes sure that it's only pulling supported file formats
  Future<List<FileSystemEntity>> getFiles() async {
    List<FileSystemEntity> listOfFiles = [];
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
