// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dart_define_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DartDefineModel _$DartDefineModelFromJson(Map<String, dynamic> json) =>
    _DartDefineModel(
      type: json['type'] as String,
      ui: json['ui'] as String,
      user: json['user'] as String,
      tg: json['tg'] as String,
      ya: json['ya'] as String,
      appName: json['appName'] as String,
      createdDate: json['createdDate'] as String,
      version: json['version'] as String,
      api: json['api'] as String,
    );

Map<String, dynamic> _$DartDefineModelToJson(_DartDefineModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'ui': instance.ui,
      'user': instance.user,
      'tg': instance.tg,
      'ya': instance.ya,
      'appName': instance.appName,
      'createdDate': instance.createdDate,
      'version': instance.version,
      'api': instance.api,
    };
