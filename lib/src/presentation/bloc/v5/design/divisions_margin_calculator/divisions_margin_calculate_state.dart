part of 'divisions_margin_calculate_cubit.dart';

@freezed
abstract class DivisionsMarginCalculateState with _$DivisionsMarginCalculateState {
  const factory DivisionsMarginCalculateState({
    @Default(StateEnum.loading) StateEnum stateEnum,
  }) = _DivisionsMarginCalculateState;
}
