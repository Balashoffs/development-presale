part of 'company_info_cubit.dart';

@freezed
class CompanyInfoState with _$CompanyInfoState {
  const factory CompanyInfoState.initial() = _Initial;
  const factory CompanyInfoState.selecting(List<String> companies) = _Selecting;
  const factory CompanyInfoState.selected(SelectedCompanyDTO founded) = _Selected;
  const factory CompanyInfoState.error() = _Error;
}
