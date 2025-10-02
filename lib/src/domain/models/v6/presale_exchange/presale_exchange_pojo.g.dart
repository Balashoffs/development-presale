// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presale_exchange_pojo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresaleExchangePojo _$PresaleExchangePojoFromJson(Map<String, dynamic> json) =>
    _PresaleExchangePojo(
      versionApi: json['versionApi'] as String,
      designPresale: DesignPresalePojo.fromJson(
        json['designPresale'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PresaleExchangePojoToJson(
  _PresaleExchangePojo instance,
) => <String, dynamic>{
  'versionApi': instance.versionApi,
  'designPresale': instance.designPresale,
};
