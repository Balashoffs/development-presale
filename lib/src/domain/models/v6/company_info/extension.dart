import 'package:presale/src/domain/models/v6/company_info/company_info.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';

extension CompanyInfoExt on CompanyInfoPojo {
  CompanyInfoDTO toDto() {
    return CompanyInfoDTO(
      companyName: companyName,
      CEOSurnameName: CEOSurnameName,
      CEOFirstName: CEOFirstName,
      CEOSecondNam: CEOSecondName,
      colonType: colonType,
    );
  }
}
