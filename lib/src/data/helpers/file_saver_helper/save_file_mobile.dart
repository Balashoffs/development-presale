import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:presale/src/domain/models/common/metadata_for_saving.dart';

Future<void> saveAndLaunchFile(MetadataForSaving meteData) async {
  try {
    Directory w = await path_provider.getApplicationDocumentsDirectory();
    await FilePicker.platform.saveFile(
      allowedExtensions: meteData.allowedExtensions,
      type: FileType.custom,
      dialogTitle: meteData.dialogTitle,
      fileName: meteData.fileName,
      initialDirectory: w.path,
      lockParentWindow: true,
      bytes: meteData.bytes,
    );
  } on PlatformException catch (_) {
  } catch (_) {}
}
