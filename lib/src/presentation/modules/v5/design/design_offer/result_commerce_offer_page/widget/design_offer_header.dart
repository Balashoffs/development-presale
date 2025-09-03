import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';


class DesignOfferHeaderWidget extends StatelessWidget {
  const DesignOfferHeaderWidget({super.key, required this.result});

  final DesignOfferResultVM result;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16.0,
      children: [
        MoonMenuItem(
          width: 500,
          label: Text("Наименование объекта", style: TextStyle()),
          content: Text(result.objectName, style: TextStyle(fontSize: 16)),
        ),
        MoonMenuItem(
          width: 500,
          label: Text("Адрес объекта", style: TextStyle()),
          content: Text(
            List.generate(
              5,
              (index) => result.objectLocation + result.objectLocation,
            ).join('\n'),
            style: TextStyle(fontSize: 16),
          ),
        ),
        MoonMenuItem(
          width: 500,
          label: Text("Тип документации", style: TextStyle()),
          content: Text(result.divisionType, style: TextStyle(fontSize: 18)),
        ),
        MoonMenuItem(
          width: 500,
          label: Text("Площадь объекта", style: TextStyle()),
          content: Text(
            '${result.objectSquare} м\u00B2',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
