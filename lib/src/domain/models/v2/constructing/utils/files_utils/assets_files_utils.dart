import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

List<List<dynamic>> readCSVFromString(String fileAsString){
  return const CsvToListConverter().convert(fileAsString, eol: '\n');
}

Future<String> readCsv(String path)async{
  return rootBundle.loadString(path);
}
