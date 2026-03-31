class CompanyInfoDTO {
  final String companyName;
  final String CEOSurnameName;
  final String CEOFirstName;
  final String CEOSecondNam;
  final String colonType;


  String get shortSign => '$CEOSurnameName ${CEOFirstName.substring(0, 1)}. ${CEOSecondNam.substring(0, 1)}.';
  String get fullSign => '$CEOSurnameName $CEOFirstName. $CEOSecondNam';

  const CompanyInfoDTO({
    this.companyName = '',
    this.CEOSurnameName = '',
    this.CEOFirstName = '',
    this.CEOSecondNam = '',
    this.colonType = '',

  });

  @override
  String toString() {
    return 'CompanyInfoDTO{companyName: $companyName, CEOSurnameName: $CEOSurnameName, CEOFirstName: $CEOFirstName, CEOSecondNam: $CEOSecondNam, colonType: $colonType}';
  }
}
