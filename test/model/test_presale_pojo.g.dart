// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_presale_pojo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresaleExchangePojo _$PresaleExchangePojoFromJson(Map<String, dynamic> json) =>
    _PresaleExchangePojo(
      schemeVer: json['schemeVer'] as String,
      presale: PresalePojo.fromJson(json['presale'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PresaleExchangePojoToJson(
  _PresaleExchangePojo instance,
) => <String, dynamic>{
  'schemeVer': instance.schemeVer,
  'presale': instance.presale,
};

_PresalePojo _$PresalePojoFromJson(Map<String, dynamic> json) =>
    _PresalePojo(id: (json['id'] as num).toInt());

Map<String, dynamic> _$PresalePojoToJson(_PresalePojo instance) =>
    <String, dynamic>{'id': instance.id};
