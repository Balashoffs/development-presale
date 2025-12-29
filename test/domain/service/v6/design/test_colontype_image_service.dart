import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:presale/src/domain/models/v6/colontype_image/colontype_image_dto.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:presale/src/domain/service/v6/design/colontype_image_service.dart';
import 'package:presale/src/domain/service/v6/design/company_data_service.dart';

main() {
  test("Парсинг файла из ассета", () async {
    String json = File(
      '/Users/bau/Documents/dev/liis/presale/assets/calculator_data/template/colontype_image.json',
    ).readAsStringSync();
    List<ColonTypeImageDTO> list = parseJson(json);
    expect(list.length, 2);
  });
}
