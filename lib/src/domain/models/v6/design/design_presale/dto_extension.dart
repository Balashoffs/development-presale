import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v5/design/divisions_table_with_analytic/divisions_margin_row_pojo.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_pojo.dart';

extension DesignPresaleDtoExt on DesignPresaleDTO {
  DesignPresalePojo toPojo() {
    return DesignPresalePojo(
      dayCounter: inputDataDesignDTO!.dayCounter.toDayCounterPojo(),
      objectData: inputDataDesignDTO!.objectData.toObjectDataPojo(),
      divisionType: inputDataDesignDTO!.divisionType.text,
      objectType: inputDataDesignDTO!.objectType.text,
      inputFactors: inputDataDesignDTO!.inputFactors.toInputFactorsPojo(),
      isAllResources: isAllResources,
      divisionResources: divisionResources.values
          .map((e) => e.toResourcePojo())
          .toList(),
      divisionResourceMargins: divisionResourceMargins.values
          .map((e) => e.toMarginPojo())
          .toList(),
      divisionsWithAnalytic: divisionWithAnalytic.values
          .map((e) => e.toPojo(),)
          .toList(),

      divisionsAnalyticMargin: divisionAnalyticMargins.values
          .map((e) => e.toMarginPojo())
          .toList(),
    );
  }
}

extension DivisionWithAnalyticExt on DivisionsWithAnalyticDTO{
  DivisionWithAnalyticPojo toPojo() {
    return DivisionWithAnalyticPojo(id: id,
        shifr: shifr,
        section: section,
        humanHours: humanHours,
        localAnalytic: localAnalytic,
        outsideAnalytic: outsideAnalytic,
        manualAnalytic: manualAnalytic,
        result: result);
  }
}

extension DayCounterDtoExt on OfferDayCounterDTO {
  OfferDayCounterPojo toDayCounterPojo() {
    return OfferDayCounterPojo(timeStamp: timeStamp, offerId: point);
  }
}

extension ObjectDataDesignDtoExt on ObjectDataDesignDTO {
  ObjectDataDesignPojo toObjectDataPojo() {
    return ObjectDataDesignPojo(
      customer: customer,
      name: name,
      address: address,
      square: square,
      deadline: deadline,
    );
  }
}

extension InputFactorsDtoExt on InputFactorsDTO {
  InputFactorsPojo toInputFactorsPojo() {
    return InputFactorsPojo(
      speedFactor: speedFactor,
      heightFactor: heightFactor,
      overPriceFactor: overPriceFactor,
      remotingFactor: remotingFactor,
      complexityFactor: complexityFactor,
      customerFactor: customerFactor,
      marginFactor: marginFactor,
      squareFactor: squareFactor,
    );
  }
}

extension DivisionResourceDtoExt on DivisionResourceDTO {
  DivisionResourcePojo toResourcePojo() {
    return DivisionResourcePojo(
      id: id,
      resourceId: resourceId,
      resourcesQnt: resourcesQnt,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resourceName: resourceName,
      resourceQnt: resourceQnt,
      workDays: workDays,
      complexFactor: complexFactor,
      squareFactor: squareFactor,
      resourceUsingFactor: resourceUsingFactor,
      resourceCostPerDay: resourceCostPerDay,
      totalResourceRowCost: totalResourceRowCost,
    );
  }
}

extension DivisionsMarginDtoExt on DivisionsMarginDTO {
  DivisionsMarginPojo toMarginPojo() {
    return DivisionsMarginPojo(
      id: id,
      divisionName: divisionName,
      divisionShortName: divisionShortName,
      divisionDescription: divisionDescription,
      resourceDivisionSummaryCost: resourceDivisionSummaryCost,
    );
  }
}
