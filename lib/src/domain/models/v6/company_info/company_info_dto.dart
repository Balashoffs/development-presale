class CompanyInfoDTO {
  final String companyName;
  final String CEOSurnameName;
  final String CEOFistName;
  final String CEOSecondNam;

  String get shortSign => '$CEOSurnameName ${CEOFistName.substring(0, 1)}. ${CEOSecondNam.substring(0, 1)}.';
  String get fullSign => '$CEOSurnameName $CEOFistName. $CEOSecondNam';

  const CompanyInfoDTO({
    this.companyName = '',
    this.CEOSurnameName = '',
    this.CEOFistName = '',
    this.CEOSecondNam = '',
  });
}
