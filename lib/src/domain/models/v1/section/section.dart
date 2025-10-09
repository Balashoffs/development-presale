
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/domain/models/v1/employee/employee.dart';
import 'package:presale/src/domain/models/v1/service_stage/service_stage.dart';

part 'section.freezed.dart';

part 'section.g.dart';

@freezed
abstract class Section with _$Section {
  const Section._();

  const factory Section({
    required ServiceStage stage,
    required String name,
    String? shortName,
    required String employeeString,
    Employee? employee,
  }) = _Section;

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  Section loadEmployee(Map<String, Employee>? candidates) {
    return copyWith(employee: candidates?[employeeString]);
  }
}
