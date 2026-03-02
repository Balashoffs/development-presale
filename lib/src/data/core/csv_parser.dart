import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

abstract class CsvParser<T> {
  final String _pathToFile;

  CsvParser(String file) : _pathToFile = file;

  Future<String> _readFromAssets() async {
    return rootBundle.loadString(_pathToFile);
  }

  Future<List<T>> parse(List<T> Function(List<List<dynamic>>) rowParse) async {
    String csv = await _readFromAssets();
    final normalizedContent = csv.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    List<List<dynamic>> csvData = CsvToListConverter(
      eol: '\n',
      fieldDelimiter: ';',
      shouldParseNumbers: false,
    ).convert(normalizedContent);
    return rowParse(csvData);
  }

  Future<List<T>> build();
}
