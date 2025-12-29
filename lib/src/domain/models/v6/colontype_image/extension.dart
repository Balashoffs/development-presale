import 'package:presale/src/domain/models/v6/colontype_image/colontype_image_dto.dart';
import 'package:presale/src/domain/models/v6/colontype_image/colontype_image_pojo.dart';
import 'package:presale/src/domain/models/v6/selected_company/colontype_type.dart';

extension ColonTypeImageExt on ColonTypeImagePojo {
  ColonTypeImageDTO toDto() {
    return ColonTypeImageDTO(
      colonType: ColonType.find(colonType),
      pathToAssetImage: path,
    );
  }
}
