import 'package:date_format/date_format.dart';
import 'package:presale/src/data/v3/design_calculator.dart';

import 'package:presale/src/domain/models/common/metadata_for_saving.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_pojo.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/dto_extension.dart';
import 'package:presale/src/domain/models/v6/presale_exchange/presale_exchange_pojo.dart';
import 'package:presale/src/domain/service/v6/design/encrypt_json_to_bytes.dart';
import 'package:presale/src/domain/service/v6/design/encrypt_shared_design_offer.dart';

import 'package:presale/src/data/helpers/file_saver_helper/save_file_mobile.dart'
    if (dart.library.html) 'package:presale/src/data/helpers/file_saver_helper/save_file_web.dart';
import 'package:presale/src/utils/dart_define/model/dart_define_model.dart';

void onShare(DesignPresaleDTO designData, DartDefineModel defineModel) async {
  DesignOfferCalculator designOfferCalculator = DesignOfferCalculator();
  List<DivisionsMarginDTO> calced = designData.divisionMargins.values.map((e) {
    return designOfferCalculator.calcDivisionMarginDTOCost(e);
  }).toList();

  designData.divisionMargins.updateAll((key, value) {
    return calced.where((element) => element.id == key).first;
  });
  DesignPresalePojo designPresalePojo = designData.toPojo();
  int key = stringToInt(defineModel.user);
  EncryptShareDesignOfferService service = EncryptShareDesignOfferService(key);
  PresaleExchangePojo exchangePojo = PresaleExchangePojo(
    designPresale: designPresalePojo,
    versionApi: defineModel.api,
  );

  await service
      .encrypt(exchangePojo)
      .then(
        (value) => value.fold((l) => {}, (r) {
          String id = designData.inputDataDesignDTO!.dayCounter
              .getOfferUniqueNumber();
          String end = formatDate(DateTime.now(), ['HH', '-', 'nn', '-', 'ss']);
          MetadataForSaving metaData = MetadataForSaving.saveAsPresaleFile(
            r,
            '${id}_$end',
          );
          saveAndLaunchFile(metaData);
        }),
      );
}
