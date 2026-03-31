import 'dart:async';

import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/domain/models/v6/colontype_image/colontype_image_dto.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:presale/src/domain/models/v6/selected_company/selected_company_dto.dart';
import 'package:presale/src/domain/service/v6/design/colontype_image_service.dart';
import 'package:presale/src/domain/service/v6/design/company_data_service.dart';

class CompanyInfoRepository {
  final List<CompanyInfoDTO> _companiesStore = [];
  final List<ColonTypeImageDTO> _colonTypesStore = [];
  final DesignOfferMemorySource _designOfferMemorySource;
  late SelectedCompanyDTO _selectedCompany;

  List<String> get _companyNames =>
      _companiesStore.map((e) => e.companyName).toList();

  final StreamController<SelectedCompanyDTO> _streamController =
      StreamController.broadcast();

  CompanyInfoRepository(DesignOfferMemorySource designOfferMemorySource)
    : _designOfferMemorySource = designOfferMemorySource;

  Stream<SelectedCompanyDTO> get companyStream => _streamController.stream;

  Future<List<String>> getCompanyNameList() async {
    if (_companiesStore.isEmpty) {
      await _loadCompaniesInfo();
      await _loadColonTypes();
    }
    return _companyNames;
  }

  Future<void> _loadCompaniesInfo() async {
    List<CompanyInfoDTO> founded = await getCompanyInfoFromAssets();
    print(founded);
    _companiesStore.addAll(founded);
  }

  Future<void> _loadColonTypes() async {
    List<ColonTypeImageDTO> founded = await getColonTypeFromAssets();
    print(founded);
    _colonTypesStore.addAll(founded);
  }

  Future<SelectedCompanyDTO> selectedCompanyByName(String selected) async {
    CompanyInfoDTO foundCompanyInfo = _companiesStore.firstWhere(
      (element) => element.companyName == selected,
    );
    if (foundCompanyInfo.colonType == '') {
      throw Error();
    }
    ColonTypeImageDTO colonType = _colonTypesStore.firstWhere(
      (element) => element.colonType == foundCompanyInfo.colonType,
    );
    if (colonType.colonType == '') {
      throw Error();
    }
    _selectedCompany = SelectedCompanyDTO.build(foundCompanyInfo, colonType);
    _designOfferMemorySource.commercialOffer?.companyInfo = _selectedCompany;
    _streamController.sink.add(_selectedCompany);
    return _selectedCompany;
  }

  void clearSelected() {
    final emptyCompany = SelectedCompanyDTO();
    _designOfferMemorySource.commercialOffer?.companyInfo = emptyCompany;
    _streamController.sink.add(emptyCompany);
  }
}
