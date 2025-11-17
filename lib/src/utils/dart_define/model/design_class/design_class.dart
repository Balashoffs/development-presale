import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_class.freezed.dart';
part 'design_class.g.dart';

/*
"resources",
"work_divisions",
 "project_divisions",
 "sign",
 */
@freezed
abstract class DesignClass with _$DesignClass {
  const factory DesignClass({
    @JsonKey(name: 'job_divisions') required String workDivisions,
    @JsonKey(name: 'project_divisions') required String projectDivisions,
    String? sign,
    required String resources,
  }) = _DesignClass;



  factory DesignClass.fromJson(Map<String, dynamic> json) =>
      _$DesignClassFromJson(json);
}
