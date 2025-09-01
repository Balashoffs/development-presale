import 'package:flutter/material.dart';

final class DivisionWithResourceRowVM {
  final int id;

  //Имя раздела
  final String divisionName;

  // Аббвеатура
  final String divisionShortName;
  final String divisionDescription;

  // Должность
  final ValueNotifier<String> resourceNameVN;

  // Кол-во задействованных должностей
  int _resourceQnt = 0;

  int get resourceQnt => _resourceQnt; // Ставка в день
  set resourceQnt(int value) {
    _resourceQnt = value;
  }

  // Кол-во задействованных дней
  int _workDays = 0;

  int get workDays => _workDays;

  set workDays(int value) {
    _workDays = value;
  }

  // Коэфициент сложности

  double _complexFactor = 1.0;

  double get complexFactor => _complexFactor;

  set complexFactor(double value) {
    _complexFactor = value;
  }

  // Коэфициент по площади
  double _squareFactor = 1.0;

  double get squareFactor => _squareFactor;

  set squareFactor(double value) {
    _squareFactor = value;
  }

  // Коэфициент участия
  double _resourceUsingFactor = 1.0;

  double get resourceUsingFactor => _resourceUsingFactor;

  set resourceUsingFactor(double value) {
    _resourceUsingFactor = value;
  }

  //Ставка специалиста в день
  final ValueNotifier<double> resourceCostPerDayVN;

  // Стоимость задествия должности по конкретному разделу
  final ValueNotifier<double> totalResourceRowCostVN;

  DivisionWithResourceRowVM({
    required this.id,
    required this.divisionName,
    required this.divisionShortName,
    required this.divisionDescription,
    String resourceName = '',
    double resourceCostPerDay = 0.0,
  }) : resourceNameVN = ValueNotifier(resourceName),
       resourceCostPerDayVN = ValueNotifier(resourceCostPerDay),
       totalResourceRowCostVN = ValueNotifier(0.0),
       _workDays = 0,
       _resourceQnt = 0,
       _resourceUsingFactor = 1.0;
}
