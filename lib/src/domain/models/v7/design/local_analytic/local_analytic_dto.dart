//Stage;Function;Mark;TDS;COUNT;MIN;MEDIAN;MAX
import 'package:flutter/services.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/design_class.dart';
import 'package:presale/src/domain/models/v7/design/local_analytic/local_analytic_csv.dart';

class LocalAnalyticDTO {
  final String stage;
  final String function;
  final String shifr;
  final double median;

  const LocalAnalyticDTO({
    required this.stage,
    required this.function,
    required this.shifr,
    required this.median,
  });

  LocalAnalyticDTO copyWith({
    String? stage,
    String? function,
    String? shifr,
    double? median,
  }) {
    return LocalAnalyticDTO(
      stage: stage ?? this.stage,
      function: function ?? this.function,
      shifr: shifr ?? this.shifr,
      median: median ?? this.median,
    );
  }
}

class LocalAnalyticsDTO {
  static Future<List<LocalAnalyticDTO>> build() async {
    List<LocalAnalyticCSV> resourcesFromCsv = await LocalAnalyticCsvBuilder(
      DesignClass.localAnalytic,
    ).build((path) => rootBundle.loadString(path).onError((error, stackTrace) => '',));
    Map<String, List<LocalAnalyticDTO>> allResources = {};
    RegExp regExp = RegExp("([а-яА-Я]{1,})\\d{0,}");
    for (var value in resourcesFromCsv) {
      String shifr = regExp.firstMatch(value.tds)?.group(1) ?? "";
      LocalAnalyticDTO dto = LocalAnalyticDTO(
        stage: value.stage,
        function: value.function,
        shifr: shifr,
        median: double.tryParse(value.median) ?? 0.0,
      );

      allResources.putIfAbsent(shifr, () => []);
      allResources[dto.shifr]!.add(dto);
    }

    return allResources.values.map((e) {
      double sum = e.map((v) => v.median).reduce((r1, r2) => r1 + r2);

      return e.first.copyWith(median: sum);
    }).toList();
  }
}
