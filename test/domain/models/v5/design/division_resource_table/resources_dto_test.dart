import 'package:flutter_test/flutter_test.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/utils/dart_define/dart_define_utils.dart';
import 'package:presale/src/utils/dart_define/model/dart_define_model.dart';

main(){
  test('read csv file with divisions', (){
    DartDefineModel dartDefineModel = buildFrom();
    ResourcesDTO.build(DivisionType.working, dartDefineModel.design);
  });
}