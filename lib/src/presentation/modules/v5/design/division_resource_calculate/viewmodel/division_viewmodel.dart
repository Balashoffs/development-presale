import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';

class DivisionViewModel {
  final int id;
  final String divisionName;
  final String divisionDescription;

  DivisionViewModel(this.id, this.divisionName, this.divisionDescription);
}

extension OnDivisionDTO on DivisionDTO {
  DivisionViewModel toViewModel() {
    return DivisionViewModel(
      id,
      '$divisionName ($divisionShortName)',
      divisionDescription,
    );
  }
}
