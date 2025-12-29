import 'package:flutter/material.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';


class EstateInformationWidget extends StatelessWidget {
  const EstateInformationWidget({super.key, required this.offerResult});

  final DesignOfferResultViewModel offerResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16.0,
      children: [
        DesignOfferHeaderRowHeaderWidget(
          type: "Дата создания КП",
          value: offerResult.createdDate,
        ),
        DesignOfferHeaderRowHeaderWidget(
          type: "№ КП",
          value: offerResult.offerId,
        ),
        DesignOfferHeaderRowHeaderWidget(
          type: "Тип документации",
          value: offerResult.divisionType,
        ),
        DesignOfferHeaderRowHeaderWidget(
          type: "Заказчик",
          value: offerResult.objectCustomer,
        ),
        DesignOfferHeaderRowHeaderWidget(
          type: "Наименование объекта",
          value: offerResult.objectName,
        ),
        DesignOfferHeaderRowHeaderWidget(
          type: "Адрес объекта",
          value: offerResult.objectAddress,
        ),
        DesignOfferHeaderRowHeaderWidget(
          type: "Площадь объекта, м\u00B2",
          value: offerResult.objectSquare,
        ),
        DesignOfferHeaderRowHeaderWidget(
          type: "Сроки выполнения, дн.",
          value: offerResult.deadline,
        ),
      ],
    );
  }
}

class DesignOfferHeaderRowHeaderWidget extends StatelessWidget {
  const DesignOfferHeaderRowHeaderWidget({
    super.key,
    required this.type,
    required this.value,
  });

  final String type;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 32.0,
      children: [
        SizedBox(width: 212, child: Text(type)),
        SizedBox(width: 400, child: Text(value, maxLines: 3, softWrap: true)),
      ],
    );
  }
}
