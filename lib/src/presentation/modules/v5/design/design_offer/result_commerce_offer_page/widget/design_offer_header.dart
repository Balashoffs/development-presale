import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/design_offer_result_viewmodel.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_result_controller.dart';
import 'package:presale/src/presentation/common/color_options.dart';
import 'package:presale/src/presentation/modules/v5/design/common/drop_down_text_controller.dart';
import 'package:presale/src/presentation/modules/v5/design/common/opacity_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/result_commerce_offer_page/widget/table_utils.dart';
import 'package:provider/provider.dart';

import '../../../common/custom_moon_drop_down.dart';

class DesignOfferHeaderWidget extends StatelessWidget {
  const DesignOfferHeaderWidget({super.key, required this.results});

  final DesignOfferResultVM results;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DesignOfferResultController>();
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.0,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 8.0,
                children: [
                  HeaderCellWidget(
                    title: "Тип документации",
                    value: results.divisionType,
                    width: 256,
                  ),
                  HeaderCellWidget(
                    title: "Дата создания",
                    value: results.createdDesignOffer,
                    width: 128,
                  ),
                  HeaderCellWidget(
                    title: "Сроки",
                    value: '${results.totalDays} дн.',
                    width: 96,
                  ),
                  HeaderCellWidget(
                    title: "Площадь",
                    value: '${results.objectSquare} м2.',
                    width: 96,
                  ),
                  HeaderEditableWidget(
                    editbledWidget: [
                      Text(
                        'Авансирование, рубл.*',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          color: getColor(context, MoonColor.trunks),
                        ),
                      ),
                      AvanceInputWidget(onChanged: controller.onAvance),
                    ],
                  ),
                  HeaderEditableWidget(
                    editbledWidget: [
                      Text(
                        'Подготовил*',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          color: getColor(context, MoonColor.trunks),
                        ),
                      ),
                      controller.sign.isNotEmpty
                          ? ChangeNotifierProvider(
                              create: (context) => DropDownTextController(
                                inputData: controller.signsNames.value,
                              ),
                              child: CustomMoonDropDown(
                                validator: personSignDropDownValidator,
                                initText: "Выбрать",
                                onSelected: controller.onSelectSign,
                                leadingIcon: MoonIcons.other_player_24_light,
                              ),
                            )
                          : HeaderCellWidget(
                              title: 'Заполняется непосредственно ',
                              value: 'в файле КП',
                              width: 148,
                            ),
                    ],
                  ),
                  HeaderEditableWidget(
                    editbledWidget: [
                      Text(
                        'Сформировать КП',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          color: getColor(context, MoonColor.trunks),
                        ),
                      ),
                      MoonButton(
                        width: 128,
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
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: HeaderAreaWidget(
                      title: "Название объекта",
                      value: results.objectName,
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: HeaderAreaWidget(
                      title: "Адрес объекта",
                      value: results.objectLocation,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  spacing: 8.0,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Поле для примечаний',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: getColor(context, MoonColor.trunks),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    MoonTextArea(
                      textColor: colorTable(context)[40],
                      hintTextColor: colorTable(context)[40],
                      backgroundColor: colorTable(context)[40],
                      activeBorderColor: getColor(context, MoonColor.zeno),
                      inactiveBorderColor: getColor(context, MoonColor.whis10),
                      hoverBorderColor: colorTable(context)[40],
                      errorColor: colorTable(context)[MoonColor.chichi.index]!,
                      expands: true,
                      textAlign: TextAlign.start,
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: getColor(context, MoonColor.popo),
                      ),
                      onChanged: context
                          .read<DesignOfferResultController>()
                          .onComments,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
