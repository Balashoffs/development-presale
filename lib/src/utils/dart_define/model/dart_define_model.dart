import 'package:freezed_annotation/freezed_annotation.dart';

part 'dart_define_model.freezed.dart';
part 'dart_define_model.g.dart';

@freezed
abstract class DartDefineModel with _$DartDefineModel {
  const factory DartDefineModel({
    required String type,
    required String ui,
    required String user,
    required String tg,
    required String ya,
    required String appName,
    required String createdDate,
    required String version,
    required String api,
}) = _DartDefineModel;

  factory DartDefineModel.fromJson(Map<String, dynamic> json) =>
      _$DartDefineModelFromJson(json);
}
