import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:presale/src/domain/service/v6/design/company_data_service.dart';

part 'company_info_state.dart';

part 'company_info_cubit.freezed.dart';

class CompanyInfoCubit extends Cubit<CompanyInfoState> {
  final List<CompanyInfoDTO> _companiesStore = [];

  List<String> get _companyNames =>_companiesStore.map((e) => e.companyName,).toList();

  CompanyInfoCubit()
    : super(const CompanyInfoState.initial()){
    _init();
  }

  void _init()async{
    List<CompanyInfoDTO> founded = await getCompanyInfoFromAssets();
    _companiesStore.addAll(founded);
    emit(CompanyInfoState.selecting(_companyNames));
  }
  void onSelected(String selected) {
    CompanyInfoDTO? founded = _companiesStore.firstWhereOrNull((element) => element.companyName == selected,);
    if(founded != null){
      emit(CompanyInfoState.selected(founded));
    }
  }

  void onChangeCompany() {
    if(_companiesStore.isNotEmpty){
      emit(CompanyInfoState.selecting(_companyNames));
    }
  }
}
