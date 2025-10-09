import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart' as open_file;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:presale/src/domain/models/common/metadata_for_saving.dart';

Future<void> saveAndLaunchFile(MetadataForSaving meteData) async {
  String? pickedSaveFilePath;

  try {
    Directory w = await path_provider.getApplicationDocumentsDirectory();
    pickedSaveFilePath = await FilePicker.platform.saveFile(
      allowedExtensions: meteData.allowedExtensions,
      type: FileType.custom,
      dialogTitle: meteData.dialogTitle,
      fileName: meteData.fileName,
      initialDirectory: w.path,
      lockParentWindow: true,
      bytes: meteData.bytes,
    );
    if (pickedSaveFilePath == null) {
      return;
    }
    if (meteData.isOpen) {
      if (Platform.isAndroid || Platform.isIOS) {
        //Launch the file (used open_file package)
        await open_file.OpenFile.open(pickedSaveFilePath);
      } else if (Platform.isWindows) {
        await Process.run('start', <String>[
          pickedSaveFilePath,
        ], runInShell: true);
      } else if (Platform.isMacOS) {
        await Process.run('open', <String>[
          pickedSaveFilePath,
        ], runInShell: true);
      } else if (Platform.isLinux) {
        await Process.run('xdg-open', <String>[
          pickedSaveFilePath,
        ], runInShell: true);
      }
    }
  } on PlatformException catch (_) {
  } catch (_) {}
}
