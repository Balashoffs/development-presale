import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/data/data_sources/v3/memory_cashed/design_offer_dto.dart';
import 'package:presale/src/domain/models/v3/design/commercial_offer/commercial_offer.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_result_controller.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sign_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/person_sign/sign_person_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';

import '../../common/custom_text_input.dart';

class DesignOfferHeaderWidget extends StatelessWidget {
  const DesignOfferHeaderWidget({super.key, required this.offerResult});

  final DesignOfferResultVM offerResult;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read()<DesignOfferCubit>();

    return SizedBox(
      width: 786,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            type: "Наименование объекта",
            value: offerResult.objectName,
          ),
          DesignOfferHeaderRowHeaderWidget(
            type: "Адрес объекта",
            value: offerResult.objectLocation,
          ),
          DesignOfferHeaderRowHeaderWidget(
            type: "Площадь объекта, м\u00B2",
            value: '${offerResult.objectSquare}',
          ),

          DesignOfferHeaderRowHeaderWidget(
            type: "Сроки выполнения, дн.",
            value: '${offerResult.totalDays}',
          ),
          DesignOfferHeaderRowWithTextInputHeaderWidget(
            type: 'Авансирование, %',
            onChanged: cubit.onAvance,
            validator: onlyInfiniteNumberValidator,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: 788,
              child: CustomTextAreaInput(
                helperText: 'Примечание (Поддерживает многострочность)',
                onChanged: cubit.onComments,
                trailing: MoonIcons.controls_close_small_24_light,
                validator: commentValidator,
              ),
            ),
          ),
          PersonSignBuilderWidget(
            onSaved: context.read<PersonSignCubit>().onSaved,
          ),
        ],
      ),
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
            style: context.moonTypography?.body.text16.copyWith(
              color: context.moonColors?.popo,
            ),
          ),
        ),
        Text(
          value,
          style: context.moonTypography?.body.text20.copyWith(
            color: context.moonColors?.popo,
          ),
        ),
      ],
    );
  }
}

class DesignOfferHeaderRowWithTextInputHeaderWidget extends StatelessWidget {
  const DesignOfferHeaderRowWithTextInputHeaderWidget({
    super.key,
    required this.type,
    this.onChanged,
    this.validator,
  });

  final String type;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 32.0,
      children: [
        SizedBox(
          width: 196,
          child: Text(
            type,
            style: context.moonTypography?.body.text16.copyWith(
              color: context.moonColors?.popo,
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: CustomTextInput(
            hasFloatingLabel: false,
            hintText: '30',
            onChanged: onChanged,
            styleFontSize: 16,
            helpStyleFontSize: 12,
            trailing: MoonIcons.controls_close_small_24_light,
            validator: validator,
            textInputSize: MoonTextInputSize.xl,
            isEnables: true,
          ),
        ),
      ],
    );
  }
}
