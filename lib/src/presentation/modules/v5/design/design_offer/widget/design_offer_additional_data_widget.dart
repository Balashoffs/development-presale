import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_result_controller.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/text_utils.dart';

import '../../common/custom_text_input.dart';

class DesignOfferAdditionalDataWidget extends StatelessWidget {
  const DesignOfferAdditionalDataWidget({super.key, required this.result});

  final DesignOfferResultVM result;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DesignOfferResultController>();
    return SizedBox(
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.0,
        children: [
          SizedBox(
            width: 256,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.0,
              children: [
                MoonMenuItem(
                  label: Text("Сроки выполнения", style: labelStyle),
                  content: Text(
                    '${result.totalDays} дней',
                    style: contentStyle(context),
                  ),
                ),
                CustomTextInput(
                  hintText: 'Авансирование, рубл.*',
                  onChanged: controller.onAvance,
                  trailing: MoonIcons.controls_close_small_24_light,
                  validator: onlyInfiniteNumberValidator,
                  isEnables: true,
                ),
              ],
            ),
          ),
          CustomTextAreaInput(
            helperText: 'Примечание (Поддерживает многострочность)',
            onChanged: controller.onComments,
            trailing: MoonIcons.controls_close_small_24_light,
            validator: objectNameValidator,
          ),
        ],
      ),
    );
  }
}
