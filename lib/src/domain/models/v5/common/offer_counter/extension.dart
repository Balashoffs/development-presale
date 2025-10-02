import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/pojo/offer_day_counter.dart';

extension OfferDayCounterDtoExt on OfferDayCounterDTO{
  OfferDayCounterPojo toPojo(){
    return OfferDayCounterPojo(timestamp: timeStamp, point: point);
  }
}

extension OfferDayCounterPojoExt on OfferDayCounterPojo{
  OfferDayCounterDTO toDto(){

    return OfferDayCounterDTO(timestamp: timestamp, point: point);
  }
}