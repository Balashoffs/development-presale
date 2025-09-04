import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/text_utils.dart';



class DesignOfferHeaderWidget extends StatelessWidget {
  const DesignOfferHeaderWidget({super.key, required this.result});

  final DesignOfferResultVM result;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8.0,
        children: [
          MoonMenuItem(
            verticalGap: 8.0,
            label: Text("Дата создания КП", style: labelStyle),
            content: Text(
              result.createdDesignOffer,
              style: contentStyle(context),
            ),
          ),
          MoonMenuItem(
            verticalGap: 8.0,
            label: Text("Наименование объекта", style: labelStyle),
            content: Text(
              result.objectName,
              style: contentStyle(context),
            ),
          ),
          MoonMenuItem(
            verticalGap: 8.0,
            label: Text("Адрес объекта", style: labelStyle),
            content: Text(
              result.objectLocation,
              style: contentStyle(context),
            ),
          ),
          MoonMenuItem(
            verticalGap: 8.0,
            label: Text("Тип документации", style: labelStyle),
            content: Text(
              result.divisionType,
              style: contentStyle(context),
            ),
          ),
          MoonMenuItem(
            verticalGap: 8.0,
            label: Text("Площадь объекта", style: labelStyle),
            content: Text(
              '${result.objectSquare} м\u00B2',
              style: contentStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
