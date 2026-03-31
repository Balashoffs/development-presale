import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_info.freezed.dart';

part 'company_info.g.dart';

@Freezed(toJson: false)
abstract class CompanyInfoPojo with _$CompanyInfoPojo {
  const factory CompanyInfoPojo({
    required String companyName,
    required String CEOSurnameName,
    required String CEOFirstName,
    required String CEOSecondName,
    required String colonType,
  }) = _CompanyInfoPojo;

  factory CompanyInfoPojo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoPojoFromJson(json);
}
