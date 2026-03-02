/*
  1. Аббвеатура, например ВК
  2. Наименование стадии, например "Сети водоснабжения"
  3. Ресурс, например Ведущий инженер ВК
  4. Ставка в день
  5. Ставка в месяц
 */

import 'package:presale/src/data/core/csv_parser.dart';

class DivisionCSV {
  final String id;
  final String divisionShortName;
  final String divisionName;
  final String divisionDescription;
  final String resourceCode;

  const DivisionCSV({
    required this.id,
    required this.divisionShortName,
    required this.divisionName,
    required this.divisionDescription,
    required this.resourceCode,
  });

  factory DivisionCSV.fromCsvRow(List<dynamic> row) {
    return DivisionCSV(
      id: row[0],
      divisionShortName: row[1],
      divisionName: row[2],
      divisionDescription: row[3],
      resourceCode: row[4],
    );
  }

  @override
  String toString() {
    return 'DivisionCSV{id: $id, divisionShortName: $divisionShortName, divisionName: $divisionName, divisionDescription: $divisionDescription, resourceCode: $resourceCode}';
  }
}

typedef DivisionCSVParser =
    List<DivisionCSV> Function(List<List<dynamic>> rows);

class DivisionCostDtoBuilder extends CsvParser<DivisionCSV> {
  DivisionCostDtoBuilder(super.path);

  DivisionCSVParser get _parser =>
      (rows) => rows.skip(1).map((row) => DivisionCSV.fromCsvRow(row)).toList();

  @override
  Future<List<DivisionCSV>> build(ReadFrom readFrom) async {
    return await parse(_parser, readFrom);
  }
}
