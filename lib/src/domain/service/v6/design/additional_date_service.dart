import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/design_class.dart';
import 'package:presale/src/domain/models/v6/colontype_image/colontype_image_dto.dart';
import 'package:presale/src/domain/models/v6/colontype_image/colontype_image_pojo.dart';
import 'package:presale/src/domain/models/v6/colontype_image/extension.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';

Future<AdditionalTemplateDataDTO> getAdditionalFromAssets() async {
  String json = await readFromAssets();
  return parseJson(json);
}

AdditionalTemplateDataDTO parseJson(String json) {
  return jsonDecode(json);
}

Future<String> readFromAssets() async {
  String path = DesignClass.additionals;
  return rootBundle.loadString(path);
}
