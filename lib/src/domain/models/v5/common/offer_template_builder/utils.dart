import 'dart:convert';

import 'package:flutter/services.dart';

class WorksheetUtil{
  static Future<String> fromImage(String pathToImage) async{
    final imageBytes = await rootBundle
        .load(pathToImage)
        .then((value) => value.buffer);
    return base64.encode(Uint8List.view(imageBytes));
  }
}