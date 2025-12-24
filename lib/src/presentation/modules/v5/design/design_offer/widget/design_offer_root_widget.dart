import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sign_cubit.dart';
import 'package:presale/src/presentation/common/widget/text_divider.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/company_info_widget/company_info_dropdown_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/common/person_sign/sign_person_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/design_offer_header.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/divisions_results_table_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_text_input.dart';

class DesignOfferMainWidget extends StatelessWidget {
  const DesignOfferMainWidget({super.key});

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
            child: OfferDesignBodyWidget(result: cubit.designOfferViewModel),
          ),
          Expanded(
            flex: 1,
            child: OfferDesignControlWidget(isCorrect: cubit.isCorrect),
          ),
        ],
      ),
    );
  }
}

class OfferDesignControlWidget extends StatelessWidget {
  const OfferDesignControlWidget({super.key, required this.isCorrect});

  final ValueNotifier<bool> isCorrect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        spacing: 16.0,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButtonWidget(
            text: '  Назад  ',
            onTap: () {
              context.read<DesignOfferCubit>().save();
              context.pop();
            },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isCorrect,
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
    );
  }
}

class OfferDesignBodyWidget extends StatelessWidget {
  const OfferDesignBodyWidget({super.key, required this.result});

  final DesignOfferResultViewModel result;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8.0,
            children: [
              DesignOfferIDWidget(offerResult: result),
              const TextDivider(
                text: 'Информация об объекте',
                paddingTop: 16.0,
                paddingBottom: 8.0,
              ),
              EstateInformationWidget(offerResult: result),
              const TextDivider(
                text: 'Представители компании',
                paddingTop: 16.0,
                paddingBottom: 8.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 228, child: Text('Компания')),
                      CompanyInfoBlocBuilderWidget(),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 228, child: Text('Контактное лицо')),
                      PersonSignBuilderWidget(
                        onSaved: context.read<PersonSignCubit>().onSaved,
                        onEdit: context.read<PersonSignCubit>().edit,
                      ),
                    ],
                  ),
                ],
              ),
              const TextDivider(
                text: 'Условия оплаты и проведения работ',
                paddingTop: 16.0,
                paddingBottom: 8.0,
              ),
              PresaleCostWidget(offerResult: result),
              const TextDivider(
                text: 'Примечания',
                paddingTop: 16.0,
                paddingBottom: 8.0,
              ),
              OfferNotesWidget(initValue: result.notes),
            ],
          ),
          TextDivider(
            text: 'Итоговая сводная таблица стоимости работ',
            paddingTop: 16.0,
            paddingBottom: 32.0,
          ),
          DivisionsResultsTableWidget(
            rowAttributes: designOfferTableAttribute,
            resultTableViewModel: result.resultTableViewModel,
          ),
        ],
      ),
    );
  }
}

class PresaleCostWidget extends StatelessWidget {
  const PresaleCostWidget({super.key, required this.offerResult});

  final DesignOfferResultViewModel offerResult;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DesignOfferCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 24.0,
      children: [
        OfferPresaleCostFactor(
          onChanged: cubit.onPresaleFactor,
          valueNotifier: offerResult.presalePayValueVN,
          defaultPersents: "${offerResult.defaultPresalePayPercent}%",
          payType: 'Авансовый платеж',
        ),
        Row(
          spacing: 16.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            OfferPresaleCostFactor(
              valueNotifier: offerResult.afterPayValueVN,
              defaultPersents: "${offerResult.defaultAfterPayPercent}%",
              onChanged: (value) {
                cubit.onAfterDayPayFactor(value);
              },
              payType: 'Оплата: ',
            ),
            OfferPresaleDateTime(
              onChanged: (value) {
                cubit.onAfterPayDate(value);
              },
              defaultDate: offerResult.defaultDateValue.isEmpty
                  ? 'Выберите дату'
                  : offerResult.defaultDateValue,
              comment: 'после',
            ),
          ],
        ),
        OfferPresaleCostFactor(
          valueNotifier: offerResult.afterActsSignPayValueVN,
          defaultPersents: "${offerResult.defaultAfterActsSignPayPercent}%",
          onChanged: (value) {
            cubit.onAfterActsSignFactor(value);
          },
          payType: 'Оплата после подписания актов',
        ),
      ],
    );
  }
}

class OfferNotesWidget extends StatelessWidget {
  const OfferNotesWidget({super.key, required this.initValue});

  final String initValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 788,
        child: CustomTextAreaInput(
          initValue: initValue,
          helperText: 'Примечание (Поддерживает многострочность)',
          onChanged: (value) {
            final cubit = context.read<DesignOfferCubit>();
            cubit.onNotesChange(value);
          },
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
    required this.valueNotifier,
    required this.defaultPersents,
    required this.payType,
  });

  final ValueChanged<String> onChanged;
  final ValueNotifier<String> valueNotifier;
  final String defaultPersents;
  final String payType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.0,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 228,
          child: Text(
            payType,
            // style: context.moonTypography?.body.text16
          ),
        ),
        SizedBox(
          width: 72,
          child: CustomTextInput(
            valueSuffix: '%',
            hasFloatingLabel: false,
            hintText: defaultPersents,
            onChanged: onChanged,
            helpStyleFontSize: 12,
            trailing: MoonIcons.controls_close_small_24_light,
            validator: percentValidator,
            textInputSize: MoonTextInputSize.md,
            isEnables: true,
          ),
        ),
        ValueListenableBuilder<String>(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            return Text(value);
          },
        ),
      ],
    );
  }
}

class OfferPresaleDateTime extends StatelessWidget {
  const OfferPresaleDateTime({
    super.key,
    required this.onChanged,
    required this.comment,
    required this.defaultDate,
  });

  final ValueChanged<String> onChanged;
  final String comment;
  final String defaultDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.0,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          comment,
          // style: context.moonTypography?.body.text16
        ),
        SizedBox(
          width: 196,
          child: CustomCalendarPicker(
            hintText: defaultDate,
            onChanged: onChanged,
            validator: percentValidator,
            textInputSize: MoonTextInputSize.md,
            isEnables: true,
          ),
        ),
      ],
    );
  }
}
