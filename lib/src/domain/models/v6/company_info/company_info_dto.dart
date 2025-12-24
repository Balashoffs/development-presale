class CompanyInfoDTO {
  final String companyName;
  final String CEOSurnameName;
  final String CEOFistName;
  final String CEOSecondNam;

  String get shortSign => '$CEOSurnameName ${CEOFistName.substring(0, 1)}. ${CEOSecondNam.substring(0, 1)}.';
  String get fullSign => '$CEOSurnameName $CEOFistName. $CEOSecondNam';

  const CompanyInfoDTO({
    required this.companyName,
    required this.CEOSurnameName,
    required this.CEOFistName,
    required this.CEOSecondNam,
  });

  static CompanyInfoDTO empty(){
    return CompanyInfoDTO(companyName: '', CEOSurnameName: '', CEOFistName: '', CEOSecondNam: '');
  }
}
