import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

import '../../../domain/models/v5/common/offer_template/offer_template_builder_v2/xlsx/offer_parts/offer_parts.dart';

Future<String> toExcelImage(String pathToImage) async {
  final imageBytes = await rootBundle
      .load(pathToImage)
      .then((value) => value.buffer);
  Uint8List bytes = imageBytes.asUint8List();
  List<int> resized = await resize(bytes);
  return base64.encode(resized);
}


/*
startCell - A
startChar - 1
-------------
B
-------------
endChar - E
endPos - 1
-------------
D
 */
String getRangeFromStartAndEnd(int startChar,
    int endChar,
    int startPos,
    int endPos,) {
  int startI = OfferBase.startCell.codeUnitAt(0) + startChar;
  String startS = String.fromCharCode(startI);
  int endI = OfferBase.endCell.codeUnitAt(0) - endChar;
  String endS = String.fromCharCode(endI);
  return '$startS$startPos:$endS$endPos';
}

/*
startCell - A
startChar - 1
-------------
B
-------------
endChar - A
endPos - 2
-------------
C
 */
String getRangeFromStartToEnd(int startChar,
    int endChar,
    int startPos,
    int endPos,) {
  int startI = OfferBase.startCell.codeUnitAt(0) + startChar;
  String startS = String.fromCharCode(startI);
  int endI = OfferBase.startCell.codeUnitAt(0) + endChar;
  String endS = String.fromCharCode(endI);
  return '$startS$startPos:$endS$endPos';
}

Future<List<int>> resize(Uint8List originalBytes, [int newW = 768]) async {
  // 2. Decode the image
  final img.Image? original = img.decodeImage(originalBytes);
  if (original == null) {
    return [];
  }
  // 3. Resize proportionally by width (height is calculated automatically)
  final img.Image resized = img.copyResize(
    original,
    width: newW,
    // height is omitted — the library calculates it to maintain aspect ratio
    interpolation: img.Interpolation.linear,
  );

  // 4. Re-encode to the same format as the original file
  return img.encodePng(resized);
}

