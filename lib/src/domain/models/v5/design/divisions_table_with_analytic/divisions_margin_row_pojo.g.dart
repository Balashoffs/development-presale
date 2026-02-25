// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divisions_margin_row_pojo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DivisionWithAnalyticPojo _$DivisionWithAnalyticPojoFromJson(
  Map<String, dynamic> json,
) => _DivisionWithAnalyticPojo(
  id: (json['id'] as num).toInt(),
  shifr: json['shifr'] as String,
  section: json['section'] as String,
  humanHours: (json['humanHours'] as num).toDouble(),
  localAnalytic: (json['localAnalytic'] as num).toDouble(),
  outsideAnalytic: (json['outsideAnalytic'] as num).toDouble(),
  result: (json['result'] as num).toDouble(),
);

Map<String, dynamic> _$DivisionWithAnalyticPojoToJson(
  _DivisionWithAnalyticPojo instance,
) => <String, dynamic>{
  'id': instance.id,
  'shifr': instance.shifr,
  'section': instance.section,
  'humanHours': instance.humanHours,
  'localAnalytic': instance.localAnalytic,
  'outsideAnalytic': instance.outsideAnalytic,
  'result': instance.result,
};
