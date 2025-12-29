import 'package:presale/src/domain/models/v6/selected_company/colontype_type.dart';

class CompanyInfoDTO {
  final String companyName;
  final String CEOSurnameName;
  final String CEOFistName;
  final String CEOSecondNam;
  final ColonType colonType;

  String get shortSign => '$CEOSurnameName ${CEOFistName.substring(0, 1)}. ${CEOSecondNam.substring(0, 1)}.';
  String get fullSign => '$CEOSurnameName $CEOFistName. $CEOSecondNam';

  const CompanyInfoDTO({
    this.companyName = '',
    this.CEOSurnameName = '',
    this.CEOFistName = '',
    this.CEOSecondNam = '',
    this.colonType = ColonType.UNDEF,
  });

  @override
  String toString() {
    return 'CompanyInfoDTO{companyName: $companyName, CEOSurnameName: $CEOSurnameName, CEOFistName: $CEOFistName, CEOSecondNam: $CEOSecondNam, colonType: $colonType}';
  }
}
