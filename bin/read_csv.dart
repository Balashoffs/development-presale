import 'dart:convert';
import 'dart:io';

import 'package:presale/src/domain/models/v5/design/division_resource_table/division_csv.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/resource_csv.dart';
import 'package:presale/src/domain/models/v7/design/local_analytic/local_analytic_csv.dart';

main() async {
  Future<String> readFrom(String path) {
    File f = File(path);
    return f.readAsString();
  }

  List<DivisionCSV> divisionsFromCsv = await DivisionCostDtoBuilder(
    "assets/data/design/debug/job_divisions.csv",
  ).build((String path) => readFrom(path));

  List<LocalAnalyticCSV> analyticFromCsv = await LocalAnalyticCsvBuilder(
    "assets/data/design/debug/local_analytic.csv",
  ).build((String path) => readFrom(path));
  Set<String> shortNames = {};
  List<Section> sections = [];

  for (var element in divisionsFromCsv) {
    String nameR = element.divisionShortName;
    if (!shortNames.contains(nameR)) {
      LocalAnalyticCSV? analyticCSV = analyticFromCsv
          .where((element) => element.tds == nameR)
          .firstOrNull;
      Section newSection = Section(
        resourceFile: nameR,
        analyticFile: analyticCSV == null ? '-' : analyticCSV.tds,
        divisionName: element.divisionName,
        divisionDescription: element.divisionDescription,
      );
      shortNames.add(nameR);
      sections.add(newSection);
    }
  }

  for (var element in analyticFromCsv) {
    String name = element.tds;
    if (!shortNames.contains(name)) {
      DivisionCSV? divisionCSV = divisionsFromCsv
          .where((element) => element.divisionShortName == name)
          .firstOrNull;
      Section newSection = Section(
        analyticFile: name,
        resourceFile: divisionCSV == null ? '-' : divisionCSV.divisionShortName,
        divisionName: '-',
        divisionDescription: '-',
      );
      shortNames.add(name);
      sections.add(newSection);
    }
  }

  StringBuffer sb = StringBuffer();
  sb.writeln("Из ресурсов;Из аналитики");
  for (var value in sections) {
    sb.writeln(value.toCsvLine());
  }
  if (sb.isNotEmpty) {
    File f = File('разделы.csv');
    f.writeAsStringSync(sb.toString(), encoding: Encoding.getByName("utf-8")!);
  }

  List<ResourceCSV> resourcesFromCsv = await ResourceCostDtoBuilder(
    "assets/data/design/debug/resources.csv",
  ).build((String path) => readFrom(path));
  Set<String> shortMark = {};
  List<Mark> marks = [];

  for (var element in resourcesFromCsv) {
    String code = element.resourceCode;
    if (!shortMark.contains(code)) {
      LocalAnalyticCSV? analyticCSV = analyticFromCsv
          .where((element) => element.mark == code)
          .firstOrNull;
      Mark newSection = Mark(
        resourceFile: code,
        analyticFile: analyticCSV == null ? '-' : analyticCSV.mark,
      );
      shortMark.add(code);
      marks.add(newSection);
    }
  }

  for (var element in analyticFromCsv) {
    String name = element.mark;
    if (!shortMark.contains(name)) {
      ResourceCSV? resourceCSV = resourcesFromCsv
          .where((element) => element.resourceCode == name)
          .firstOrNull;
      Mark newSection = Mark(
        analyticFile: name,
        resourceFile: resourceCSV == null ? '-' : resourceCSV.resourceCode,
      );
      shortMark.add(name);
      marks.add(newSection);
    }
  }

  sb.clear();
  sb.writeln("Из ресурсов;Из аналитики");
  for (var value in marks) {
    sb.writeln(value.toCsvLine());
  }
  if (sb.isNotEmpty) {
    File f = File('марки.csv');
    f.writeAsStringSync(sb.toString(), encoding: Encoding.getByName("utf-8")!);
  }
}

class Section {
  final String resourceFile;
  final String analyticFile;
  final String divisionName;
  final String divisionDescription;

  Section({
    required this.resourceFile,
    required this.analyticFile,
    required this.divisionName,
    required this.divisionDescription,
  });

  String toCsvLine() {
    return "$resourceFile;$analyticFile";
  }
}

class Mark {
  final String resourceFile;
  final String analyticFile;

  Mark({
    required this.resourceFile,
    required this.analyticFile,
  });

  String toCsvLine() {
    return "$resourceFile;$analyticFile";
  }
}
