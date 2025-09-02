import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

import 'package:presale/src/data/helpers/csv_eol_helper/desktop_csv_eol_helper.dart'
if (dart.library.html) 'package:presale/src/data/helpers/csv_eol_helper/web_csv_eol_helper.dart' as helper;

abstract class CsvParser<T> {
  final String _pathToFile;

  CsvParser(String file) : _pathToFile = file;

  Future<String> _readFromAssets() async {
    return rootBundle.loadString(_pathToFile);
  }

  Future<List<T>> parse(List<T> Function(List<List<dynamic>>) rowParse) async {

    String csv = await _readFromAssets();
    List<List<dynamic>> csvData = CsvToListConverter(
      eol: helper.eol,
      fieldDelimiter: ';',
      shouldParseNumbers: false,
    ).convert(csv);
    return rowParse(csvData);
  }

  Future<List<T>> build();
}
