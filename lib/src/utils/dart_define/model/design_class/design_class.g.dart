// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DesignClass _$DesignClassFromJson(Map<String, dynamic> json) => _DesignClass(
  workDivisions: json['job_divisions'] as String,
  projectDivisions: json['project_divisions'] as String,
  sign: json['sign'] as String?,
  resources: json['resources'] as String,
);

Map<String, dynamic> _$DesignClassToJson(_DesignClass instance) =>
    <String, dynamic>{
      'job_divisions': instance.workDivisions,
      'project_divisions': instance.projectDivisions,
      'sign': instance.sign,
      'resources': instance.resources,
    };
