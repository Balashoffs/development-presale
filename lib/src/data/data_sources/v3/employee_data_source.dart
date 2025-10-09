import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:presale/src/domain/models/v3/design/employee_cost/employee_cost.dart';


abstract class EmployeeCostDataSource {
  const EmployeeCostDataSource();

  Future<List<EmployeeCost>> getEmployees();
}

class EmployeeDataSourceLocal implements EmployeeCostDataSource {
  final String _pathToEmployeeData;

  const EmployeeDataSourceLocal(
    this._pathToEmployeeData,
  );

  @override
  Future<List<EmployeeCost>> getEmployees() async {
    String file = await rootBundle.loadString(_pathToEmployeeData);
    List<EmployeeCost> employeeCosts =  CsvToListConverter()
        .convert(
          file,
        )
        .map(
          (e) => EmployeeCost(
            id: e[0],
            name: e[1],
            workingRatePerDay: e[2],
            correctionFactor: e[3],
          ),
        )
        .toList();

    return employeeCosts;
  }
}
