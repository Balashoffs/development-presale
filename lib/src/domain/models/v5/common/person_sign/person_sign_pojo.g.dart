// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_sign_pojo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonSignPojo _$PersonSignPojoFromJson(Map<String, dynamic> json) =>
    _PersonSignPojo(
      id: (json['id'] as num).toInt(),
      fistName: json['fistName'] as String,
      secondName: json['secondName'] as String,
      lastName: json['lastName'] as String,
      jobTitle: json['jobTitle'] as String,
      companyTitle: json['companyTitle'] as String,
      phoneNumber: json['phoneNumber'] as String,
      jobEmail: json['jobEmail'] as String,
    );

Map<String, dynamic> _$PersonSignPojoToJson(_PersonSignPojo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fistName': instance.fistName,
      'secondName': instance.secondName,
      'lastName': instance.lastName,
      'jobTitle': instance.jobTitle,
      'companyTitle': instance.companyTitle,
      'phoneNumber': instance.phoneNumber,
      'jobEmail': instance.jobEmail,
    };
