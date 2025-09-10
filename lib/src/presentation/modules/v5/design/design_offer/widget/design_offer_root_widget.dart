import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_result_controller.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sign_cubit.dart';
import 'package:presale/src/presentation/common/color_options.dart';
import 'package:presale/src/presentation/common/widget/text_divider.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/person_sign/sign_person_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/design_offer_additional_data_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/design_offer_header.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/divisions_results_table_widget.dart';

class DesignOfferRootWidget extends StatelessWidget {
  const DesignOfferRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DesignOfferResultController>();
    final DesignOfferResultVM? result = controller.designOfferResultVM;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DesignOfferHeaderWidget(result: result!),
                  TextDivider(
                    text: 'Итоговая таблица',
                    paddingTop: 8.0,
                    paddingBottom: 32.0,
                  ),
                  DivisionsResultsTableWidget(
                    rowAttributes: designOfferTableAttribute,
                    footerResult: controller.designOfferResultVM!,
                    tableDataRows: controller.designOfferResultVM!.divisionRows,
                  ),
                  TextDivider(
                    text: 'Дополнительные данные по объекту',
                    paddingTop: 16.0,
                    paddingBottom: 8.0,
                  ),
                  Column(
                    children: [
                      DesignOfferAdditionalDataWidget(result: result),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: PersonSignBuilderWidget(
                          onSaved: context.read<PersonSignCubit>().onSaved,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              spacing: 16.0,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MoonButton(
                  trailing: Icon(
                    MoonIcons.arrows_chevron_left_double_32_regular,
                  ),
                  showBorder: true,
                  onTap: context.pop,
                ),
                ValueListenableBuilder(
                  valueListenable: context
                      .read<DesignOfferResultController>()
                      .isCorrect,
                  builder: (context, value, child) {
                    return MoonButton(
                      trailing: Text(
                        'Сформировать КП',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          color: getColor(context, MoonColor.trunks),
                        ),
                      ),
                      showBorder: true,
                      label: Icon(MoonIcons.generic_download_16_light),
                      onTap: value
                          ? () {
                        context
                            .read<DesignOfferCubit>()
                            .saveToFile();
                      }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
