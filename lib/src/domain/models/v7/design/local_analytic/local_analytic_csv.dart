/*
  1. Аббвеатура, например ВК
  2. Наименование стадии, например "Сети водоснабжения"
  3. Ресурс, например Ведущий инженер ВК
  4. Ставка в день
  5. Ставка в месяц
 */

import 'package:presale/src/data/core/csv_parser.dart';

class LocalAnalyticCSV {
  final String objectType;
  final String documentationType;
  final String name;
  final String mark;
  final String median;

  factory LocalAnalyticCSV.fromCsvRow(List<dynamic> row) {
    return LocalAnalyticCSV(
      objectType: row[0],
      documentationType: row[1],
      name: row[2],
      mark: row[3],
      median: row[4],
    );
  }

  LocalAnalyticCSV({
    required this.objectType,
    required this.documentationType,
    required this.name,
    required this.mark,
    required this.median,
  });
}

typedef LocalAnalyticCSVParser =
    List<LocalAnalyticCSV> Function(List<List<dynamic>> rows);

class LocalAnalyticCsvBuilder extends CsvParser<LocalAnalyticCSV> {
  LocalAnalyticCsvBuilder(super.path);

  LocalAnalyticCSVParser get _parser =>
      (rows) =>
          rows.skip(1).map((row) => LocalAnalyticCSV.fromCsvRow(row)).toList();

  @override
  Future<List<LocalAnalyticCSV>> build(ReadFrom readFrom) async {
    return await parse(_parser, readFrom);
  }
}
