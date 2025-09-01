part of 'division_resource_calculate_cubit.dart';

@freezed
abstract class DivisionResourceCalculateState
    with _$DivisionResourceCalculateState {
  const factory DivisionResourceCalculateState.initial() = _Initial;

  const factory DivisionResourceCalculateState.nextPage() = _NextPage;

  const factory DivisionResourceCalculateState.showPage() = _ShowPage;

  const factory DivisionResourceCalculateState.error(String errorText) = _Error;
}
