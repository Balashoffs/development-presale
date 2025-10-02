
import 'dart:async';
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:presale/src/domain/models/common/metadata_for_saving.dart';
import 'package:web/web.dart';

// Function to save and launch a file for download in a web environment
Future<void> saveAndLaunchFile(MetadataForSaving metaData) async {
  final HTMLAnchorElement anchor =
      document.createElement('a') as HTMLAnchorElement
        ..href = 'data:application/octet-stream;base64,${base64Encode(metaData.bytes)}'
        ..style.display = 'none'
        ..download = metaData.fileName;

  // Insert the new element into the DOM
  document.body!.appendChild(anchor);

  // Initiate the download
  anchor.click();
  // Clean up the DOM by removing the anchor element
  document.body!.removeChild(anchor);
}
