import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:presale/src/domain/models/v6/company_info/extension.dart';

Future<List<CompanyInfoDTO>> parseJsonWithCompanyInfo(String json) async {
  List<dynamic> maps = jsonDecode(json);
  return maps
      .map((e) => e as Map<String, dynamic>)
      .map((e) => CompanyInfoPojo.fromJson(e))
      .map((e) => e.toDto())
      .toList();
}

Future<String> readFromAssets() async {
  return rootBundle.loadString(
    'assets/calculator_data/template/companies.json',
  );
}

Future<List<CompanyInfoDTO>> getCompanyInfoFromAssets() async{
  String json = await readFromAssets();
  return parseJsonWithCompanyInfo(json);
}
