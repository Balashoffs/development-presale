import 'dart:convert';

import 'package:flutter/services.dart';


import '../../../domain/models/v5/common/offer_template/offer_template_builder_v2/xlsx/offer_parts/offer_parts.dart';


Future<String> toExcelImage(String pathToImage) async {
  final imageBytes = await rootBundle
      .load(pathToImage)
      .then((value) => value.buffer);
  return base64.encode(Uint8List.view(imageBytes));
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
String getRangeFromStartAndEnd(
  int startChar,
  int endChar,
  int startPos,
  int endPos,
) {
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
String getRangeFromStartToEnd(
  int startChar,
  int endChar,
  int startPos,
  int endPos,
) {
  int startI = OfferBase.startCell.codeUnitAt(0) + startChar;
  String startS = String.fromCharCode(startI);
  int endI = OfferBase.startCell.codeUnitAt(0) + endChar;
  String endS = String.fromCharCode(endI);
  return '$startS$startPos:$endS$endPos';}

