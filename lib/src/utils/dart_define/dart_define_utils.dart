import 'package:date_format/date_format.dart';
import 'package:presale/src/utils/dart_define/model/dart_define_model.dart';

DartDefineModel buildFrom() {
  String type = const String.fromEnvironment('type');
  String source = const String.fromEnvironment('source');
  final ui = const String.fromEnvironment('ui');
  final password = const String.fromEnvironment('email');
  final appName = const String.fromEnvironment('appName');
  final version = const String.fromEnvironment('version');
  final api = const String.fromEnvironment('api');
  final timestamps = const String.fromEnvironment('timestamp', defaultValue: '');
  int timestamp = timestamps.isEmpty ? DateTime.now().millisecondsSinceEpoch : int.tryParse(source) ?? DateTime.now().millisecondsSinceEpoch;
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final created = formatDate(date, [
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
  return DartDefineModel(
    api: api,
    type: type,
    ui: ui,
    user: password,
    createdDate: created,
    appName: appName,
    tg: tg,
    version: version,
    ya: ya,
  );
}
