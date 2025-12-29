import 'package:presale/src/domain/models/v6/colontype_image/colontype_image_dto.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';

class SelectedCompanyDTO{
  final String companyName;
  final String fullCeoName;
  final String shortCeoName;
  final String pathToColonType;

  const SelectedCompanyDTO({
    this.companyName = '',
    this.fullCeoName = '',
    this.shortCeoName = '',
    this.pathToColonType = '',
  });

  static SelectedCompanyDTO build(CompanyInfoDTO companyInfo, ColonTypeImageDTO colonTypeImage){
    return SelectedCompanyDTO(
      companyName: companyInfo.companyName,
      fullCeoName: companyInfo.fullSign,
      shortCeoName: companyInfo.shortSign,
      pathToColonType: colonTypeImage.pathToAssetImage,
    );
  }
}