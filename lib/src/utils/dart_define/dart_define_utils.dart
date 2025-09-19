import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:presale/src/utils/dart_define/model/dart_define_model.dart';
import 'package:presale/src/utils/dart_define/model/design_class/design_class.dart';

DartDefineModel buildFrom() {
  String type = const String.fromEnvironment('type');
  final source = const String.fromEnvironment('design');
  final ui = const String.fromEnvironment('ui');
  final password = const String.fromEnvironment('email');
  final appName = const String.fromEnvironment('appName');
  final version = const String.fromEnvironment('version');
  final created = formatDate(DateTime.now(), [
    'yyyy',
    '-',
    'mm',
    '-',
    'dd',
    ' ',
    'HH',
    ':',
    'nn',
  ]);

  final ya = const String.fromEnvironment('ya');
  final tg = const String.fromEnvironment('tg');
  final map = json.decode(source);
  DesignClass design = DesignClass.fromJson(map);
  return DartDefineModel(
    type: type,
    design: design,
    ui: ui,
    user: password,
    createdDate: created,
    appName: appName,
    tg: tg,
    version: version,
    ya: ya,
  );
}
