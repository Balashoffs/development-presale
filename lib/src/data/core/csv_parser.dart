import 'package:csv/csv.dart';

typedef ReadFrom = Future<String> Function(String path);

abstract class CsvParser<T> {
  final String _pathToFile;

  CsvParser(String file) : _pathToFile = file;



  Future<List<T>> parse(
    List<T> Function(List<List<dynamic>>) rowParse,
    ReadFrom read,
  ) async {
    String csv = await read.call(_pathToFile);
    final normalizedContent = csv
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n');
    List<List<dynamic>> csvData = CsvToListConverter(
      eol: '\n',
      fieldDelimiter: ';',
      shouldParseNumbers: false,
    ).convert(normalizedContent);
    return rowParse(csvData);
  }

  Future<List<T>> build(ReadFrom readFrom);
}
