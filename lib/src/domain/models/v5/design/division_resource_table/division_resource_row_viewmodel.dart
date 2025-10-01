import 'package:flutter/material.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';

class DivisionWithResourceViewModel {
  final int id;
  final int resourceId;
  final int resourcesQnt;

  //Имя раздела
  final String divisionName;

  // Аббвеатура
  final String divisionShortName;
  final String divisionDescription;

  // Должность
  final ValueNotifier<String> resourceNameVN;

  // Кол-во задействованных должностей
  int _resourceQnt;

  int get resourceQnt => _resourceQnt; // Ставка в день
  set resourceQnt(int value) {
    _resourceQnt = value;
  }

  // Кол-во задействованных дней
  int _workDays;

  int get workDays => _workDays;

  set workDays(int value) {
    _workDays = value;
  }

  // Коэфициент сложности

  double _complexFactor;

  double get complexFactor => _complexFactor;

  set complexFactor(double value) {
    _complexFactor = value;
  }

  // Коэфициент по площади
  double _squareFactor;

  double get squareFactor => _squareFactor;

  set squareFactor(double value) {
    _squareFactor = value;
  }

  // Коэфициент участия
  double _resourceUsingFactor;

  double get resourceUsingFactor => _resourceUsingFactor;

  set resourceUsingFactor(double value) {
    _resourceUsingFactor = value;
  }

  @override
  String toString() {
    return 'DivisionWithResourceRowVM{id: $id, resourceId: $resourceId, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionDescription: $divisionDescription, _resourceQnt: $_resourceQnt, _workDays: $_workDays, _complexFactor: $_complexFactor, _squareFactor: $_squareFactor, _resourceUsingFactor: $_resourceUsingFactor}';
  } //Ставка специалиста в день

  final ValueNotifier<double> resourceCostPerDayVN;

  // Стоимость задествия должности по конкретному разделу
  final ValueNotifier<double> totalResourceRowCostVN;

  DivisionWithResourceViewModel({
    required this.id,
    required this.resourceId,
    required this.resourcesQnt,
    required this.divisionName,
    required this.divisionShortName,
    required this.divisionDescription,
    required String resourceName,
    double resourceCostPerDay = 0.0,
  }) : resourceNameVN = ValueNotifier(resourceName),
       resourceCostPerDayVN = ValueNotifier(resourceCostPerDay),
       totalResourceRowCostVN = ValueNotifier(0.0),
       _complexFactor = 1.0,
       _squareFactor = 1.0,
       _resourceUsingFactor = 1.0,
       _workDays = 0,
       _resourceQnt = 0;
}

class DropDownResources {
  final List<ResourceDTO> unloaded;
  final ResourceDTO defaultValue;
  final Key key;


  DropDownResources({
    required this.key,
    required this.unloaded,
    required this.defaultValue,
  });
}
