part of 'offer_preview_cubit.dart';

@freezed
class OfferPreviewState with _$OfferPreviewState {
  const factory OfferPreviewState.initial() = _Initial;
  const factory OfferPreviewState.show() = _Show;
  const factory OfferPreviewState.picked() = _Picked;
}
