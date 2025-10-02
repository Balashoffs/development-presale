// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:presale/src/domain/models/v6/presale_exchange/presale_exchange_pojo.dart';

import 'package:presale/src/domain/service/v6/design/encrypt_json_to_bytes.dart';

void main() {
  test(
    'Convert to JSON -> Base64 -> XOR -> bytes -> XOR -> Base64 - JSON ',
    () async {
      File file = File('./assets/calculator_data/test_resources/02102025-1_15-56-26');
      String simple = 'simple';
      int key = stringToInt(simple);
      print(key);

     final  xorBytes = file.readAsBytesSync();

      final map = fromXorByte(xorBytes, key);
      PresaleExchangePojo exchangePojoOutput = PresaleExchangePojo.fromJson(
        map,
      );

      print(exchangePojoOutput);
    },
  );
}
