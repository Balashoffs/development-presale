part of 'divisions_with_analytic_calculate_cubit.dart';

@freezed
abstract class DivisionsWithAnalyticCalculateState with _$DivisionsWithAnalyticCalculateState {
  const factory DivisionsWithAnalyticCalculateState({
    @Default(StateEnum.loading) StateEnum stateEnum,
  }) = _DivisionsWithAnalyticCalculateState;
}
