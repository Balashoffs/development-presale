import 'package:presale/src/domain/models/v5/design/divisions_margin_table/division_with_margin_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/divisions_margin_row_pojo.dart';
import 'package:presale/src/domain/models/v5/design/divisions_result_table/divisions_result_pojo.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';

extension DivisioResultPojoExt on DivisionsResultPojo {
  DivisionsResultDTO toDto() {
    return DivisionsResultDTO(
      id: id,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resultValue: resultValue,
    );
  }
}
