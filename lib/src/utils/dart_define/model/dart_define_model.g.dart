// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dart_define_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DartDefineModel _$DartDefineModelFromJson(Map<String, dynamic> json) =>
    _DartDefineModel(
      type: json['type'] as String,
      ui: json['ui'] as String,
      design: DesignClass.fromJson(json['design'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DartDefineModelToJson(_DartDefineModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'ui': instance.ui,
      'design': instance.design,
    };
