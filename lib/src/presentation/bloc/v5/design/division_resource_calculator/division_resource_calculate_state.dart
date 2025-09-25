part of 'division_resource_calculate_cubit.dart';

@freezed
abstract class DivisionResourceCalculateState
    with _$DivisionResourceCalculateState {
  const factory DivisionResourceCalculateState({
    @Default(StateEnum.loading) StateEnum stateEnum,
    @Default(false) bool isAllResourcesShow,
  }) = _DivisionResourceCalculateState;
}
