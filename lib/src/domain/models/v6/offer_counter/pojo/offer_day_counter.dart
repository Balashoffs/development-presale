import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_day_counter.freezed.dart';
part 'offer_day_counter.g.dart';

@freezed
abstract class OfferDayCounterPojo with _$OfferDayCounterPojo {
  const factory OfferDayCounterPojo({
    required String today,
    required int point,
  }) = _OfferDayCounterPojo;

  factory OfferDayCounterPojo.fromJson(Map<String, dynamic> json) =>
      _$OfferDayCounterPojoFromJson(json);
}
