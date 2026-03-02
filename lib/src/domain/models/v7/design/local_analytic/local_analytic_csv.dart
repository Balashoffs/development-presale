/*
  1. Аббвеатура, например ВК
  2. Наименование стадии, например "Сети водоснабжения"
  3. Ресурс, например Ведущий инженер ВК
  4. Ставка в день
  5. Ставка в месяц
 */

import 'package:presale/src/data/core/csv_parser.dart';

class LocalAnalyticCSV {
  final String stage;
  final String function;
  final String mark;
  final String tds;
  final String count;
  final String min;
  final String median;
  final String max;

  factory LocalAnalyticCSV.fromCsvRow(List<dynamic> row) {
    return LocalAnalyticCSV(
      stage: row[0],
      function: row[1],
      mark: row[2],
      tds: row[3],
      count: row[4],
      min: row[5],
      median: row[6],
      max: row[7],
    );
  }

  LocalAnalyticCSV({
    required this.stage,
    required this.function,
    required this.mark,
    required this.tds,
    required this.count,
    required this.min,
    required this.median,
    required this.max,
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
