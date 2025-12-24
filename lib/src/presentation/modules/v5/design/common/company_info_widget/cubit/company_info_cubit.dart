import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:presale/src/presentation/modules/v5/design/common/company_info_widget/company_repository/company_repository.dart';

part 'company_info_state.dart';

part 'company_info_cubit.freezed.dart';

class CompanyInfoCubit extends Cubit<CompanyInfoState> {
  final CompanyInfoRepository _companyInfoRepository;

  CompanyInfoCubit({required CompanyInfoRepository companyRepository})
    : _companyInfoRepository = companyRepository,
      super(const CompanyInfoState.initial()) {
    _init();
  }

  void _init() {
    _loadingData();
  }

  void onSelected(String selected) {
    _companyInfoRepository
        .findCompanyInfoByName(selected)
        .then(
          (event) => emit(CompanyInfoState.selected(event)),
          onError: (error) => emit(CompanyInfoState.error()),
        );
  }

  void onChangeCompany() {
    _companyInfoRepository.clearSelected();
    _loadingData();
  }

  void _loadingData(){
    _companyInfoRepository.getCompanyNameList().then(
          (value) => emit(CompanyInfoState.selecting(value)),
      onError: (error) {
        emit(CompanyInfoState.error());
      },
    );
  }
}
