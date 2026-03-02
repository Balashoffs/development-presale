/*
  1. Аббвеатура, например ВК
  2. Наименование стадии, например "Сети водоснабжения"
  3. Ресурс, например Ведущий инженер ВК
  4. Ставка в день
  5. Ставка в месяц
 */

import 'package:presale/src/data/core/csv_parser.dart';

class ResourceCSV {
  final String id;
  final String resourceCode;
  final String resourceName;
  final String resourceCostPerHour;
  final String resourceCostPerDay;


  @override
  String toString() {
    return 'ResourceCSV{id: $id, resourceCode: $resourceCode, resourceName: $resourceName, resourceCostPerHour: $resourceCostPerHour, resourceCostPerDay: $resourceCostPerDay}';
  }

  factory ResourceCSV.fromCsvRow(List<dynamic> row) {
    return ResourceCSV(
      id: row[0],
      resourceName: row[1],
      resourceCode: row[2],
      resourceCostPerHour: row[3],
      resourceCostPerDay: row[4],
    );
  }

  const ResourceCSV({
    required this.id,
    required this.resourceCode,
    required this.resourceName,
    required this.resourceCostPerDay,
    required this.resourceCostPerHour,
  });
}

typedef ResourceCSVParser =
    List<ResourceCSV> Function(List<List<dynamic>> rows);

class ResourceCostDtoBuilder extends CsvParser<ResourceCSV> {
  ResourceCostDtoBuilder(super.path);

  ResourceCSVParser get _parser =>
      (rows) => rows.skip(1).map((row) => ResourceCSV.fromCsvRow(row)).toList();

  @override
  Future<List<ResourceCSV>> build(ReadFrom readFrom) async {
    return await parse(_parser, readFrom);
  }
}
