import 'dart:async';

import 'package:collection/collection.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:presale/src/domain/service/v6/design/company_data_service.dart';

class CompanyInfoRepository {
  final List<CompanyInfoDTO> _companiesStore = [];

  List<String> get _companyNames =>
      _companiesStore.map((e) => e.companyName).toList();

  final StreamController<CompanyInfoDTO?> _streamController =
      StreamController.broadcast();

  Stream<CompanyInfoDTO?> get companyStream => _streamController.stream;

  Future<List<String>> getCompanyNameList() async {
    if (_companiesStore.isEmpty) {
      await _loadCompaniesInfo();
    }
    return _companyNames;
  }

  Future<void> _loadCompaniesInfo() async {
    List<CompanyInfoDTO> founded = await getCompanyInfoFromAssets();
    _companiesStore.addAll(founded);
  }

  Future<CompanyInfoDTO> findCompanyInfoByName(String selected) async {
    CompanyInfoDTO? founded = _companiesStore.firstWhereOrNull(
      (element) => element.companyName == selected,
    );
    if (founded == null) {
      throw Error();
    }
    _streamController.sink.add(founded);
    return founded;
  }
}
