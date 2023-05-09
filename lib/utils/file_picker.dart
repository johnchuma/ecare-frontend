import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future<List<File>> pickImages() async {
  List<File>? files = [];
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'gif', 'jpeg'],
      allowMultiple: true);
  if (result != null) {
    files = result.paths.map((path) => File(path!)).toList();
    for (var file in files) {
      if (file.lengthSync() > 500000000) {
        files.remove(file);
        break;
      }
    }
  } else {
    // User canceled the picker
  }
  return files;
}

Future<List<File>> pickAudio() async {
  List<File>? files = [];
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(type: FileType.audio, allowMultiple: true);
  if (result != null) {
    files = result.paths.map((path) => File(path!)).toList();
    for (var file in files) {
      if (file.lengthSync() > 500000000) {
        files.remove(file);
        break;
      }
    }
  } else {
    // User canceled the picker
  }
  return files;
}

Future<List<File>> pickDocuments() async {
  List<File>? files = [];
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
      allowMultiple: true);
  if (result != null) {
    files = result.paths.map((path) => File(path!)).toList();
    for (var file in files) {
      if (file.lengthSync() > 500000000) {
        files.remove(file);
        break;
      }
    }
  } else {
    // User canceled the picker
  }
  return files;
}

Future<List<File>> pickVideos() async {
  List<File>? files = [];
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(type: FileType.video, allowMultiple: true);
  if (result != null) {
    files = result.paths.map((path) => File(path!)).toList();
    for (var file in files) {
      if (file.lengthSync() > 500000000) {
        files.remove(file);
        break;
      }
    }
  } else {
    // User canceled the picker
  }
  return files;
}
