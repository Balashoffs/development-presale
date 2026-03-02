import 'dart:convert';
import 'dart:io';

main() {
  String json1 = '.env/develop_design.json';
  String json2 = ".env/develop.json";
  String output = ".env/dev-develop.json";
  updateFile(json1, json2, output);
  json1 = '.env/production_design.json';
  json2 = ".env/production.json";
  output = ".env/dev-production.json";
  updateFile(json1, json2, output);
}

void updateFile(String json1, String json2, String output) {
  String devDesignJson = json1;
  File devDesignFile = File(devDesignJson);
  String json = devDesignFile.readAsStringSync();
  String base64 = base64Encode(utf8.encode(json));
  String designJson = json2;
  File designFile = File(designJson);
  json = designFile.readAsStringSync();
  json = json.replaceAll("base64", base64);
  File outputFile = File(output);
  outputFile.writeAsStringSync(json);
}
