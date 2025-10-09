import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v2/constructing/model/input/input_repository.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';
import 'package:presale/src/presentation/bloc/construction/object_input_data/object_input_data_cubit.dart';
import 'package:presale/src/presentation/bloc/construction/provider/provider.dart';
import 'package:presale/src/presentation/common/widget/text_divider.dart';
import 'package:presale/src/presentation/modules/construction/navi/construction_navi.dart';
import 'package:presale/src/presentation/modules/construction/object_input_data/widget/multi_custom_moon_drop_down.dart';
import 'package:provider/provider.dart';

class ObjectInputData extends StatelessWidget {
  const ObjectInputData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ObjectInputDataRepositoryBuilderWidget(),
    );
  }
}

class ObjectInputDataRepositoryBuilderWidget extends StatelessWidget {
  const ObjectInputDataRepositoryBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InputFactorsValueNotifier(),
      child: ObjectInputDataBlocBuilderWidget(),
    );
  }
}

class ObjectInputDataBlocBuilderWidget extends StatelessWidget {
  const ObjectInputDataBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ObjectDataCubit(
          resultId: selectRoutePath,
          notifier: context.read<InputFactorsValueNotifier>(),
          dbClient: di.dbClientImpl),
      child: ObjectInputDataConsumerWidget(),
    );
  }
}

class ObjectInputDataConsumerWidget extends StatelessWidget {
  const ObjectInputDataConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObjectDataCubit, ObjectDataState>(
      listener: (context, state) {
        if (state is SavedState) {
          context.go(selectGoRoutePath);
        }
      },
      builder: (context, state) {
        if (state is InitialState) {
          return MoonCircularLoader();
        }
        if (state is LoadedState) {
          return ChangeNotifierProvider.value(
            value: context.read<InputFactorsValueNotifier>(),
            child: LoadedWidget(model: state.model),
          );
        }

        return Center();
      },
    );
  }
}

class LoadedWidget extends StatelessWidget {
  const LoadedWidget({super.key, required this.model});

  final InputFactorsViewModel model;

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(4.0);
    ObjectDataCubit cubit = context.read<ObjectDataCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextDivider(
          text: "Введите данные об объекте",
          paddingTop: 4,
          paddingBottom: 4,
        ),
        Expanded(
          flex: 10,
          child: SingleChildScrollView(
            child: Column(
              children: [
                RowInputWidget(
                  firstRowLabel: "\u03A3",
                  secondRowLabel: "Имя объекта",
                  secondRowIcon: Icons.house,
                  thirdRowWidget: MoonFormTextInput(
                    width: 272,
                    initialValue: "",
                    autofocus: true,
                    style: getBodyTextStyle(context, MoonTextSize.size12),
                    onChanged: cubit.setObjectName,
                  ),
                ),
                RowInputWidget(
                  firstRowLabel: "A",
                  secondRowLabel: InputFactorType.a.value,
                  secondRowIcon: Icons.square_outlined,
                  thirdRowWidget: MoonFormTextInput(
                    width: 272,
                    initialValue: "0.0",
                    autofocus: true,
                    style: getBodyTextStyle(context, MoonTextSize.size12),
                    onChanged: cubit.updateTotalSquare,
                  ),
                ),
                RowInputWidget(
                  firstRowLabel: "B",
                  secondRowLabel: InputFactorType.b.value,
                  secondRowIcon: Icons.height,
                  thirdRowWidget: ChangeNotifierProvider(
                    create: (context) => ValueNotifierDropDown(
                      inputData: model.factors(InputFactorType.b.value),
                    ),
                    child: CustomMoonDropDown(
                      onSelected: cubit.updateHeight,
                    ),
                  ),
                ),
                RowInputWidget(
                  firstRowLabel: "C",
                  secondRowLabel: InputFactorType.c.value,
                  secondRowIcon: Icons.location_on,
                  thirdRowWidget: ChangeNotifierProvider(
                    create: (context) => ValueNotifierDropDown(
                      inputData: model.factors(
                        InputFactorType.c.value,
                      ),
                    ),
                    child: CustomMoonDropDown(
                      onSelected: cubit.updateRegion,
                    ),
                  ),
                ),
                RowInputWidget(
                  firstRowLabel: "D",
                  secondRowLabel: InputFactorType.d.value,
                  secondRowIcon: Icons.splitscreen,
                  thirdRowWidget: ChangeNotifierProvider(
                    create: (context) => ValueNotifierDropDown(
                      inputData: model.factors(
                        InputFactorType.d.value,
                      ),
                    ),
                    child: CustomMoonDropDown(
                      onSelected: cubit.updateSquare,
                    ),
                  ),
                ),
                RowInputWidget(
                  firstRowLabel: "E",
                  secondRowLabel: InputFactorType.e.value,
                  secondRowIcon: Icons.hardware,
                  thirdRowWidget: ChangeNotifierProvider(
                    create: (context) => MultiCustomValueNotifierDropDown(
                      inputData: model.complexities,
                    ),
                    child: ObjectInputDataMultiCustomMoonDropDown(
                      onSelected: cubit.updateHardFactor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MoonMenuItem(
                      width: 48,
                      borderRadius: borderRadius,
                      menuItemCrossAxisAlignment: CrossAxisAlignment.center,
                      label: Text(
                        "F",
                        style:
                            getHeadingTextStyle(context, MoonTextSize.size32),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            MoonMenuItem(
                              width: 256,
                              borderRadius: borderRadius,
                              menuItemCrossAxisAlignment:
                                  CrossAxisAlignment.center,
                              label: Text(
                                InputFactorType.f1.value,
                                style: getHeadingTextStyle(
                                    context, MoonTextSize.size16),
                              ),
                              leading: MoonAvatar(
                                borderRadius: borderRadius,
                                backgroundColor: context.moonColors!.jiren,
                                avatarSize: MoonAvatarSize.lg,
                                content: const Icon(Icons.select_all),
                              ),
                            ),
                            ChangeNotifierProvider(
                              create: (context) => ValueNotifierDropDown(
                                inputData: model.estateByType.byTypes,
                              ),
                              child: CustomMoonDropDown(
                                onSelected: cubit.updateByType,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MoonMenuItem(
                              width: 256,
                              borderRadius: borderRadius,
                              menuItemCrossAxisAlignment:
                                  CrossAxisAlignment.center,
                              label: Text(
                                InputFactorType.f2.value,
                                style: getHeadingTextStyle(
                                    context, MoonTextSize.size16),
                              ),
                              leading: MoonAvatar(
                                borderRadius: borderRadius,
                                backgroundColor: context.moonColors!.jiren,
                                avatarSize: MoonAvatarSize.lg,
                                content: const Icon(Icons.currency_ruble),
                              ),
                            ),
                            ChangeNotifierProvider(
                              create: (context) => ValueNotifierDropDown(
                                  inputData: model.estateByType.byCosts),
                              child: CustomMoonDropDown(
                                onSelected: cubit.updateByCost,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: Column(
              children: [
                const TextDivider(
                  text: "Итого",
                  paddingTop: 4,
                  paddingBottom: 4,
                ),
                ResultWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: MoonOutlinedButton(
                    width: 500,
                    onTap: () {
                      cubit.calculatePlannedCost();
                    },
                    buttonSize: MoonButtonSize.xl,
                    isFullWidth: false,
                    showPulseEffect: true,
                    trailing: Icon(Icons.arrow_forward_outlined),
                    label: Text('Выбрать стади и работы'),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final BorderRadiusGeometry borderRadius = BorderRadius.circular(4.0);
    return Consumer<InputFactorsValueNotifier>(
      builder: (context, value, child) => MoonMenuItem(
        menuItemPadding: EdgeInsets.all(12),
        width: 1000,
        borderRadius: borderRadius,
        menuItemCrossAxisAlignment: CrossAxisAlignment.center,
        label: Center(
          child: Text(
            value.equation(),
            style: getHeadingTextStyle(context, MoonTextSize.size40),
          ),
        ),
      ),
    );
  }
}

class RowInputWidget extends StatelessWidget {
  final String firstRowLabel;
  final String secondRowLabel;
  final IconData secondRowIcon;
  final Widget thirdRowWidget;

  const RowInputWidget({
    super.key,
    required this.firstRowLabel,
    required this.secondRowLabel,
    required this.secondRowIcon,
    required this.thirdRowWidget,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(4.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MoonMenuItem(
          width: 48,
          borderRadius: borderRadius,
          menuItemCrossAxisAlignment: CrossAxisAlignment.center,
          label: Text(
            firstRowLabel,
            style: getHeadingTextStyle(context, MoonTextSize.size32),
          ),
        ),
        MoonMenuItem(
          width: 256,
          borderRadius: borderRadius,
          menuItemCrossAxisAlignment: CrossAxisAlignment.center,
          label: Text(
            secondRowLabel,
            style: getHeadingTextStyle(context, MoonTextSize.size16),
          ),
          leading: MoonAvatar(
            borderRadius: borderRadius,
            backgroundColor: context.moonColors!.jiren,
            avatarSize: MoonAvatarSize.lg,
            content: Icon(secondRowIcon),
          ),
        ),
        thirdRowWidget,
      ],
    );
  }
}

class CustomMoonDropDown extends StatefulWidget {
  const CustomMoonDropDown({super.key, required this.onSelected});

  final Function(String result) onSelected;

  @override
  State<CustomMoonDropDown> createState() => _CustomMoonDropDownState();
}

class _CustomMoonDropDownState extends State<CustomMoonDropDown> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ValueNotifierDropDown>(
      builder: (context, value, child) {
        return MoonDropdown(
          show: value.showMenu,
          maxWidth: 256,
          constrainWidthToChild: true,
          distanceToTarget: 8.0,
          dropdownAnchorPosition: MoonDropdownAnchorPosition.bottom,
          dropdownShadows: null,
          onTapOutside: () {
            value.tapOutside();
          },
          content: Column(
            children: _generateItems(
                value, context.read<InputFactorsValueNotifier>()),
          ),
          child: MoonTextInput(
            width: 270,
            readOnly: true,
            canRequestFocus: false,
            mouseCursor: MouseCursor.defer,
            hintText: value.current,
            onTap: () => value.onTap(),
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Center(
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: value.showMenu ? -0.5 : 0,
                  child: const Icon(
                    MoonIcons.controls_chevron_down_16_light,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _generateItems(
      ValueNotifierDropDown vn, InputFactorsValueNotifier results) {
    return vn.items.map(
      (e) {
        return MoonMenuItem(
          menuItemCrossAxisAlignment: CrossAxisAlignment.center,
          labelAndContentCrossAxisAlignment: CrossAxisAlignment.center,
          width: 196,
          onTap: () {
            widget.onSelected(e);
            vn.selected(e);
          },
          label: Text(e),
        );
      },
    ).toList();
  }
}
