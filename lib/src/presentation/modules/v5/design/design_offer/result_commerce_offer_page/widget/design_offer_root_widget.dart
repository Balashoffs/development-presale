import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_result_controller.dart';
import 'package:presale/src/presentation/common/color_options.dart';
import 'package:presale/src/presentation/common/widget/text_divider.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/result_commerce_offer_page/widget/design_offer_additional_data_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/result_commerce_offer_page/widget/design_offer_header.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/result_commerce_offer_page/widget/divisions_results_table_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/result_commerce_offer_page/widget/sign_person_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/result_commerce_offer_page/widget/table_utils.dart';

class DesignOfferRootWidget extends StatelessWidget {
  const DesignOfferRootWidget({super.key, required this.result});

  final DesignOfferResultVM result;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DesignOfferResultController>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            children: [
              DesignOfferHeaderWidget(result: result),
              TextDivider(text: 'Итоговая таблица', paddingTop: 8.0, paddingBottom: 32.0,),
              DivisionsResultsTableWidget(
                rowAttributes: designOfferTableAttribute,
                footerResult: controller.designOfferResultVM!,
                tableDataRows: controller.designOfferResultVM!.divisionRows,
              ),
              TextDivider(text: 'Дополнительные данные по объекту', paddingTop: 16.0, paddingBottom: 8.0,),
              Column(
                spacing: 8.0,
                children: [
                  DesignOfferAdditionalDataWidget(result: result),
                  SignPersonWidget(),
                ],
              ),
              HeaderEditableWidget(
                editbledWidget: [
                  MoonButton(
                    trailing: Text(
                      'Сформировать КП',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color: getColor(context, MoonColor.trunks),
                      ),
                    ),
                    width: 256,
                    showBorder: true,
                    label: Icon(MoonIcons.generic_download_16_light),
                    onTap: () {
                      if (Form.of(context).validate()) {
                        context.read<DesignOfferCubit>().saveToFile();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
