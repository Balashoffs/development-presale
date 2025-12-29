import 'package:presale/src/domain/models/v6/selected_company/colontype_type.dart';

class ColonTypeImageDTO {
  String pathToAssetImage;
  ColonType colonType;

  ColonTypeImageDTO({
    this.colonType = ColonType.UNDEF,
    this.pathToAssetImage = '',
  });

  @override
  String toString() {
    return 'ColonTypeImageDTO{pathToAssetImage: $pathToAssetImage, colonType: $colonType}';
  }
}
