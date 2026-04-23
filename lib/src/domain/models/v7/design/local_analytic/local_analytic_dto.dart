//Stage;Function;Mark;TDS;COUNT;MIN;MEDIAN;MAX
import 'package:flutter/services.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/design_class.dart';
import 'package:presale/src/domain/models/v7/design/local_analytic/local_analytic_csv.dart';

class LocalAnalyticDTO {
  final String objectType;
  final String documentationType;
  final String name;
  final String mark;
  final double median;

  const LocalAnalyticDTO({
    required this.objectType,
    required this.documentationType,
    required this.name,
    required this.mark,
    required this.median,
  });

  LocalAnalyticDTO copyWith({
    String? objectType,
    String? documentationType,
    String? name,
    String? mark,
    double? median,
  }) {
    return LocalAnalyticDTO(
      objectType: objectType ?? this.objectType,
      documentationType: documentationType ?? this.documentationType,
      name: name ?? this.name,
      mark: mark ?? this.mark,
      median: median ?? this.median,
    );
  }
}

class LocalAnalyticsDTO {
  static Future<List<LocalAnalyticDTO>> build() async {
    List<LocalAnalyticCSV> resourcesFromCsv = await LocalAnalyticCsvBuilder(
      DesignClass.localAnalytic,
    ).build((path) => rootBundle.loadString(path).onError((error, stackTrace) => '',));
    Map<String, LocalAnalyticDTO> allResources = {};
    for (var value in resourcesFromCsv) {
      print(value.median);
      double p = double.tryParse(value.median) ?? 0.0;
      LocalAnalyticDTO dto = LocalAnalyticDTO(
        objectType: value.objectType,
        documentationType: value.documentationType,
        name: value.name,
        mark: value.mark,
        median:  p,
      );

      allResources.putIfAbsent(value.mark, () => dto);
    }

    return allResources.values.toList();
  }
}
