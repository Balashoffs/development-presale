import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_result_controller.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';

import '../../../object_data_input/widget/custon_text_input.dart';

class DesignOfferAdditionalDataWidget extends StatelessWidget {
  const DesignOfferAdditionalDataWidget({super.key, required this.result});

  final DesignOfferResultVM result;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DesignOfferResultController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16.0,
      children: [
        MoonMenuItem(
          width: 500,
          label: Text("Сроки выполнения", style: TextStyle()),
          content: Text(
            '${result.totalDays} дней',
            style: TextStyle(fontSize: 16),
          ),
        ),
        CustomTextInput(
          helpText: 'Авансирование, рубл.',
          width: 500,
          hintText: '0',
          onChanged: controller.onAvance,
          trailing: MoonIcons.controls_close_small_24_light,
          validator: onlyInfiniteNumberValidator,
        ),
        CustomTextAreaInput(
          helperText: 'Примечания',
          width: 500,
          hintText: '',
          onChanged: controller.onComments,
          trailing: MoonIcons.controls_close_small_24_light,
          validator: objectNameValidator,
        ),
      ],
    );
  }
}
