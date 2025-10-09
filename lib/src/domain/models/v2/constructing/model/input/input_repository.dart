import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/factors/base_factor/input_base_factor.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/factors/base_factor/input_base_factor_builder.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/factors/complexity/complexity.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/factors/complexity/complexity_factor_builder.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/factors/estate_by_type/estate_by_type.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/factors/estate_by_type/estate_by_type_factor_builder.dart';
import 'package:presale/src/domain/models/v2/constructing/model/start_paths.dart';

class InputFactorsRepository {
  InputFactorsRepository();

  Future<InputFactorsViewModel> readFactors() async {
    final AssetManifest assetManifest = await AssetManifest.loadFromAssetBundle(
      rootBundle,
    );
    final List<String> assets = assetManifest
        .listAssets()
        .where((element) => element.contains(factors))
        .toList();
    List<BaseFactorBuilder> builders = assets
        .map((path) => createFactorBuilder(path))
        .toList();

    Map<String, List<InputBaseFactor>> baseFactors = {};
    late EstateByType estateByType;
    late List<Complexity> complexity;
    for (var build in builders) {
      if (build is EstateByTypeFactorBuilder) {
        List<List<dynamic>> rows = await build.readFrom(build.path);
        estateByType = build.buildFromRows(rows).first;
      } else if (build is ComplexityFactorBuilder) {
        complexity = await build.buildFromPath(build.path);
      } else {
        List<InputBaseFactor> bs = await build
            .buildFromPath(build.path)
            .then((value) => value.map((e) => e as InputBaseFactor).toList());

        baseFactors.putIfAbsent(build.type, () => bs);
      }
    }

    return InputFactorsViewModel(
      baseFactors: baseFactors,
      estateByType: estateByType,
      complexity: complexity,
    );
  }
}

enum InputFactorType {
  zero('undef'),
  a('Площадь объекта'),
  b('Высотность'),
  c('Регион'),
  d('Площадь объекта'),
  e('Сложность'),
  f1('Типы объектов'),
  f2('По стоимости');

  final String value;

  const InputFactorType(this.value);

  InputFactorType findBy(String value) => InputFactorType.values.firstWhere(
    (element) => element.value == value,
    orElse: () => InputFactorType.zero,
  );
}

class InputFactorsViewModel {
  final Map<String, List<InputBaseFactor>> baseFactors;
  final EstateByType estateByType;
  final List<Complexity> complexity;

  const InputFactorsViewModel({
    required this.baseFactors,
    required this.estateByType,
    required this.complexity,
  });

  List<String> factors(String type) =>
      baseFactors[type]!.map((e) => e.value).toList();

  MapEntry<String, List<InputBaseFactor>> factorsByType(String type) =>
      baseFactors.entries.firstWhere((element) => element.key == type);

  List<String> get complexities => complexity.map((e) => e.value).toList();

  double? factorSelectedItem(String type, String selected){
    selected = selected.split(' (')[0];
    double? result = factorsByType(type).value.firstWhereOrNull((element) => element.value == selected,)?.factor;
    return result;
  }
}

class InputDataCalculator {
  final Map<String, double> _factors = {};
  int x = 0;
  int y = 0;

  void addFactor(String src, double newFactor) {
    if (_factors.containsKey(src)) {
      _factors[src] = newFactor;
    } else {
      _factors.putIfAbsent(src, () => newFactor);
    }
  }

  double get totalFactor => _factors.isEmpty
      ? 1.0
      : _factors.values.reduce((value, element) => value * element);

  @override
  String toString() {
    return _factors.entries.map((e) => '${e.key}: ${e.value}').join(',');
  }
}
