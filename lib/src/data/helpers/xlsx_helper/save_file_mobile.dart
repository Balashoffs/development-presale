import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart' as open_file;
import 'package:path_provider/path_provider.dart' as path_provider;

///To save the Excel file in the device
///To save the Excel file in the device
Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  String? pickedSaveFilePath;

  try {
    Directory w = await path_provider.getApplicationDocumentsDirectory();
    pickedSaveFilePath = await FilePicker.platform.saveFile(
      allowedExtensions: ['.xlsx'],
      type: FileType.custom,
      dialogTitle: 'Сохранить КП в xlsx',
      fileName: fileName,
      initialDirectory: w.path,
      lockParentWindow: true,
      bytes: Uint8List.fromList(bytes),
    );
    if(pickedSaveFilePath == null){
      return;
    }
    if (Platform.isAndroid || Platform.isIOS) {
      //Launch the file (used open_file package)
      await open_file.OpenFile.open('$pickedSaveFilePath');
    } else if (Platform.isWindows) {
      await Process.run('start', <String>[
        '$pickedSaveFilePath',
      ], runInShell: true);
    } else if (Platform.isMacOS) {
      await Process.run('open', <String>[
        '$pickedSaveFilePath',
      ], runInShell: true);
    } else if (Platform.isLinux) {
      await Process.run('xdg-open', <String>[
        '$pickedSaveFilePath',
      ], runInShell: true);
    }
  } on PlatformException catch (e) {
    ;
  } catch (e) {
    ;
  }
}
