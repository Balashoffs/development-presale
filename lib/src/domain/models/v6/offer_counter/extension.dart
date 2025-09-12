import 'package:presale/src/domain/models/v6/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v6/offer_counter/pojo/offer_day_counter.dart';

extension OfferDayCounterDtoExt on OfferDayCounterDto{
  OfferDayCounterPojo toPojo(){
    return OfferDayCounterPojo(today: localDate, point: point);
  }
}

extension OfferDayCounterPojoExt on OfferDayCounterPojo{
  OfferDayCounterDto toDto(){
    return OfferDayCounterDto(localDate: today, point: point);
  }
}