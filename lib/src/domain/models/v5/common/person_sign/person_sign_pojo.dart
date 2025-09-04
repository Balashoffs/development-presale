import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_sign_pojo.g.dart';

part 'person_sign_pojo.freezed.dart';

@freezed
abstract class PersonSignPojo with _$PersonSignPojo {
  const factory PersonSignPojo({
    required int id,
   required String fistName,
   required String secondName,
   required String lastName,
   required String jobTitle,
   required String companyTitle,
   required String phoneNumber,
   required String jobEmail,
}) = _PersonSignPojo;

  factory PersonSignPojo.fromJson(Map<String, dynamic> json) =>
      _$PersonSignPojoFromJson(json);
}
