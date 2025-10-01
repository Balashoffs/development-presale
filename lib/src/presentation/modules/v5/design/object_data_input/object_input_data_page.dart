import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/modules/v5/design/common/result_sum_widget.dart';
import 'package:provider/provider.dart';

import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/presentation/common/widget/text_divider.dart';
import 'package:presale/src/domain/models/v3/design/division_type/division_type.dart';
import 'package:presale/src/presentation/bloc/v5/design/input/object_input_data/object_input_data_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_app_bar.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_circle_loader.dart';
import 'package:presale/src/presentation/modules/v5/design/common/drop_down_text_controller.dart';
import 'package:presale/src/presentation/modules/v5/design/object_data_input/widget/custon_text_input.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';

import 'widget/widget.dart';

class InputDataPage extends StatelessWidget {
  const InputDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Center(
        child: Text(
          'Первоначальные данные о проекте',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
      child: ObjectInputDataBlocBuilderWidget(),
    );
  }
}

class ObjectInputDataBlocBuilderWidget extends StatelessWidget {
  const ObjectInputDataBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ObjectDataCubit(di),
      child: ObjectInputDataConsumerWidget(),
    );
  }
}

class ObjectInputDataConsumerWidget extends StatelessWidget {
  const ObjectInputDataConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObjectDataCubit, ObjectInputDataState>(
      builder: (context, state) {
        if (state.stateEnum == StateEnum.loading) {
          return CustomCircleLoader();
        }
        return LoadedWidget();
      },
    );
  }
}

class LoadedWidget extends StatelessWidget {
  const LoadedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ObjectDataCubit cubit = context.read<ObjectDataCubit>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Form(
                child: Builder(
                  builder: (context) {
                    return Column(
                      spacing: 16.0,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 16.0,
                          children: [
                            FutureBuilder(future: cubit.counterFuture, builder: (context, snapshot) {
                              OfferDayCounterDto? counter = snapshot.data;
                              if(counter != null){
                                cubit.setCounter(counter);
                               return RowTextWidgets(
                                  values: [
                                    counter.localDate,
                                    '№ ${counter.getOfferUniqueNumber()}',
                                  ],
                                );
                              }
                              return CustomCircleLoader();
                            },),
                            CustomTextInput(
                              width: 500,
                              hintText: 'Наименование объекта*',
                              onChanged: cubit.setObjectName,
                              trailing: MoonIcons.controls_close_small_24_light,
                              validator: objectNameValidator,
                            ),
                            CustomTextAreaInput(
                              width: 500,
                              hintText: 'Адрес объекта*',
                              onChanged: cubit.setObjectLocation,
                              trailing: MoonIcons.controls_close_small_24_light,
                              validator: objectLocationValidator,
                            ),
                            TextWithRowHint(
                              hintText: "Виды проектной документации*",
                              textWidget: ChangeNotifierProvider(
                                create: (context) => DropDownTextController(
                                  inputData: DivisionType.values
                                      .map((e) => e.text)
                                      .toList(),
                                ),
                                child: CustomMoonDropDown(
                                  width: 240,
                                  validator: divisionTypeValidator(
                                    'Нужно выбрать',
                                  ),
                                  initText: 'Нужно выбрать',
                                  onSelected: cubit.setResultDesignDocumentations,
                                  leadingIcon:
                                      MoonIcons.text_bullets_list_16_light,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextDivider(
                          text: 'Необязательные параметры',
                          paddingTop: 8.0,
                          paddingBottom: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 16.0,
                          children: [
                            TextWithRowHint(
                              leading: Icons.square_outlined,
                              hintText: 'Площадь объекта, м2',
                              textWidget: CustomTextInput(
                                width: 128,
                                onChanged: cubit.setSquare,
                                trailing: MoonIcons.controls_close_small_24_light,
                                validator: onlyInfiniteNumberValidator,
                                initValue: '0',
                              ),
                            ),
                            TextWithRowHint(
                              leading: Icons.timer,
                              hintText: 'Сроки выполнения, дн.',
                              textWidget: CustomTextInput(
                                width: 128,
                                onChanged: cubit.setDeadline,
                                trailing: MoonIcons.controls_close_small_24_light,
                                validator: onlyInfiniteNumberValidator,
                                initValue: '0',
                              ),
                            ),
                            TextWithRowHint(
                              leading: Icons.money_off,
                              hintText: 'Накладные',
                              textWidget: CustomTextInput(
                                width: 128,
                                onChanged: cubit.setOverPriceFactor,
                                trailing: MoonIcons.controls_close_small_24_light,
                                validator: onlyFactorValidator,
                                initValue: '1.0',
                              ),
                            ),
                            TextWithRowHint(
                              leading: Icons.calculate,
                              hintText: 'Норма прибыли',
                              textWidget: CustomTextInput(
                                width: 128,
                                onChanged: cubit.setMarginFactor,
                                trailing: MoonIcons.controls_close_small_24_light,
                                validator: onlyFactorValidator,
                                initValue: '1.0',
                              ),
                            ),
                            TextWithRowHint(
                              leading: Icons.person,
                              hintText: 'Заказчик',
                              textWidget: CustomTextInput(
                                width: 128,
                                onChanged: cubit.setCustomerFactor,
                                trailing: MoonIcons.controls_close_small_24_light,
                                validator: onlyFactorValidator,
                                initValue: '1.0',
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonWidget(
                  iconData: MoonIcons.arrows_chevron_left_double_32_regular,
                  onTap: () {
                    cubit.clearCached();
                    context.pop();
                  },
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: context.read<ObjectDataCubit>().isValid,
                  builder: (context, value, child) {
                    return CustomButtonWidget(
                      iconData:
                          MoonIcons.arrows_chevron_right_double_32_regular,
                      onTap: value ? (){
                        cubit.updateCashed();
                        context.go(designResourcesRoute);
                      } : null,
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
