import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:presale/src/domain/models/v6/colontype_image/colontype_image_dto.dart';
import 'package:presale/src/domain/models/v6/colontype_image/colontype_image_pojo.dart';
import 'package:presale/src/domain/models/v6/colontype_image/extension.dart';

Future<List<ColonTypeImageDTO>> getColonTypeFromAssets() async {
  String json = await readFromAssets();
  return parseJson(json);
}

List<ColonTypeImageDTO> parseJson(String json) {
  List<dynamic> maps = jsonDecode(json);
  return maps
      .map((e) => e as Map<String, dynamic>)
      .map((e) => ColonTypeImagePojo.fromJson(e))
      .map((e) => e.toDto())
      .toList();
}

Future<String> readFromAssets() async {
  return rootBundle.loadString(
    'assets/calculator_data/template/colontype_image.json',
  );
}
