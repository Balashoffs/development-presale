part of 'design_offer_cubit.dart';

@freezed
abstract class DesignOfferState with _$DesignOfferState {
  const factory DesignOfferState({
    @Default(StateEnum.loading) StateEnum stateEnum,
  }) = _DesignOfferState;
}
