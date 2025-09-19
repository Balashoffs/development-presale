import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/utils/dart_define/model/design_class/design_class.dart';

part 'dart_define_model.freezed.dart';
part 'dart_define_model.g.dart';

@freezed
abstract class DartDefineModel with _$DartDefineModel {
  const factory DartDefineModel({
    required String type,
    required String ui,
    required DesignClass design,
    required String user,
    required String tg,
    required String ya,
    required String appName,
    required String createdDate,
    required String version,
}) = _DartDefineModel;

  factory DartDefineModel.fromJson(Map<String, dynamic> json) =>
      _$DartDefineModelFromJson(json);
}
