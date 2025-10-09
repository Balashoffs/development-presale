import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';
import 'package:presale/src/presentation/common/widget/text_divider.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_circle_loader.dart';
import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/design_offer_header.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/divisions_results_table_widget.dart';

class DesignOfferRootWidget extends StatelessWidget {
  const DesignOfferRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DesignOfferCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 9,
            child: cubit.designOfferController.designOfferResultVN != null
                ? OfferHeadWidget(
                    avanceVN: cubit.designOfferController.avanceVN,
                    designOfferResultVN:
                        cubit.designOfferController.designOfferResultVN!,
                  )
                : CustomCircleLoader(),
          ),
          Expanded(
            flex: 1,
            child: Row(
              spacing: 16.0,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButtonWidget(
                  text: '  Назад  ',
                  onTap: context.pop,
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: cubit.isCorrect,
                  builder: (context, value, child) {
                    return Row(
                      spacing: 16.0,
                      children: [
                        CustomButtonWidget(
                          text: 'без НДС',
                          onTap: value
                              ? () {
                                  context
                                      .read<DesignOfferCubit>()
                                      .saveRawToExcelFile();
                                }
                              : null,
                        ),
                        CustomButtonWidget(
                          text: '  c НДС  ',
                          onTap: value
                              ? () {
                                  context
                                      .read<DesignOfferCubit>()
                                      .saveToClearExcelFile();
                                }
                              : null,
                        ),
                      ],
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

class OfferHeadWidget extends StatelessWidget {
  const OfferHeadWidget({
    super.key,
    required this.designOfferResultVN,
    required this.avanceVN,
  });

  final ValueListenable<DesignOfferResultVM> designOfferResultVN;
  final ValueListenable<double> avanceVN;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: designOfferResultVN,
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            spacing: 8.0,
            children: [
              DesignOfferHeaderWidget(
                offerResult: value,
                onCommentsChange: context.read<DesignOfferCubit>().onComments,
                onAvanceChange: context.read<DesignOfferCubit>().onAvance,
                avanceVN: avanceVN,
              ),
              TextDivider(
                text: 'Итоговые цифры для КП',
                paddingTop: 16.0,
                paddingBottom: 32.0,
              ),
              DivisionsResultsTableWidget(
                rowAttributes: designOfferTableAttribute,
                offerResult: value,
              ),
            ],
          ),
        );
      },
    );
  }
}
