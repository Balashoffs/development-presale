import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/data/core/string_converter.dart';

import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sign_cubit.dart';
import 'package:presale/src/presentation/common/widget/text_divider.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/common/person_sign/sign_person_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/design_offer_header.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/divisions_results_table_widget.dart';

import '../../common/custom_text_input.dart';

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
            child: OfferHeadWidget(
              onFactorChange: cubit.onFactorChange,
              onNotesChange: cubit.onNotesChange,
              result: cubit.designOfferResultVC,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Row(
                spacing: 16.0,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButtonWidget(text: '  Назад  ', onTap: context.pop),
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
          ),
        ],
      ),
    );
  }
}

class OfferHeadWidget extends StatelessWidget {
  const OfferHeadWidget({
    super.key,
    required this.result,
    required this.onFactorChange,
    required this.onNotesChange,
  });

  final DesignOfferResultViewController result;
  final ValueChanged<String> onFactorChange;
  final ValueChanged<String> onNotesChange;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: 764,
            child: Column(
              spacing: 8.0,
              children: [
                DesignOfferHeaderWidget(offerResult: result),
                OfferPresaleCostFactor(
                  presaleCostVN: result.presaleCostVN,
                  factor: result.factors,
                  onChanged: onFactorChange,
                ),
                OfferNotesWidget(
                  onChanged: onNotesChange,
                  initValue: result.notes
                ),
                PersonSignBuilderWidget(
                  onSaved: context.read<PersonSignCubit>().onSaved,
                ),
              ],
            ),
          ),
          TextDivider(
            text: 'Итоговая сводная таблица стоимости работ',
            paddingTop: 16.0,
            paddingBottom: 32.0,
          ),
          DivisionsResultsTableWidget(
            rowAttributes: designOfferTableAttribute,
            offerResult: result,
          ),
        ],
      ),
    );
  }
}

class OfferNotesWidget extends StatelessWidget {
  const OfferNotesWidget({
    super.key,
    required this.initValue,
    required this.onChanged,
  });

  final String initValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 788,
        child: CustomTextAreaInput(
          initValue: initValue,
          helperText: 'Примечание (Поддерживает многострочность)',
          onChanged: onChanged,
          trailing: MoonIcons.controls_close_small_24_light,
          validator: commentValidator,
        ),
      ),
    );
  }
}

class OfferPresaleCostFactor extends StatelessWidget {
  const OfferPresaleCostFactor({
    super.key,
    required this.onChanged,
    required this.presaleCostVN,
    required this.factor,
  });

  final ValueChanged<String> onChanged;
  final ValueNotifier<double> presaleCostVN;
  final double factor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 32.0,
      children: [
        SizedBox(
          width: 196,
          child: Text(
            'Авансирование',
            // style: context.moonTypography?.body.text16
          ),
        ),
        SizedBox(
          width: 96,
          child: CustomTextInput(
            valueSuffix: '%',
            hasFloatingLabel: false,
            hintText: '${factor * 100}%',
            onChanged: onChanged,
            helpStyleFontSize: 12,
            trailing: MoonIcons.controls_close_small_24_light,
            validator: percentValidator,
            textInputSize: MoonTextInputSize.xl,
            isEnables: true,
          ),
        ),
        ValueListenableBuilder<double>(
          valueListenable: presaleCostVN,
          builder: (context, value, child) {
            return Text(convertToString(value, 0));
          },
        ),
      ],
    );
  }
}
