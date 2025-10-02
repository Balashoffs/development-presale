// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';

import 'package:presale/main.dart';

import 'model/presale_encrypt_service.dart';
import 'model/test_presale_pojo.dart';

void main() {
  test(
    'Convert to JSON -> Base64 -> XOR -> bytes -> XOR -> Base64 - JSON ',
    () async {
      PresaleExchangePojo exchangePojo = PresaleExchangePojo(
        schemeVer: '0.6',
        presale: PresalePojo(id: 1),
      );
      File file = File('bytes.presale');
      final inputMap = exchangePojo.toJson();
      String simple = 'simple';
      int key = stringToInt(simple);
      print(key);
      Uint8List xorBytes = toXorBytes(inputMap, key);
      file.writeAsBytesSync(xorBytes);

      xorBytes = file.readAsBytesSync();

      final map = fromXorByte(xorBytes, key);
      PresaleExchangePojo exchangePojoOutput = PresaleExchangePojo.fromJson(
        map,
      );

      print(exchangePojo);
      print(exchangePojoOutput);
    },
  );
}
