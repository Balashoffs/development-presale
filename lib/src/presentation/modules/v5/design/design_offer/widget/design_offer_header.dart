import 'package:flutter/material.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';

class DesignOfferHeaderWidget extends StatelessWidget {
  const DesignOfferHeaderWidget({
    super.key,
    required this.offerResult,
  });

  final DesignOfferResultViewController offerResult;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      children: [
        DesignOfferHeaderRowHeaderWidget(
          type: "Дата создания КП",
          value: offerResult.createdDate,
        ),
        DesignOfferHeaderRowHeaderWidget(type: "№ КП", value: offerResult.id),
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
          value: '${offerResult.objectSquare}',
        ),
        DesignOfferHeaderRowHeaderWidget(
          type: "Сроки выполнения, дн.",
          value: '${offerResult.deadline}',
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
      spacing: 32.0,
      children: [
        SizedBox(
          width: 212,
          child: Text(
            type,
            // style: context.moonTypography?.body.text16
          ),
        ),
        Text(
          value,
          // style: context.moonTypography?.body.text20
        ),
      ],
    );
  }
}
