import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/data/core/string_converter.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/widget_action_type.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_with_unselected_vc.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/bloc/v5/design/division_resource_calculator/division_resource_calculate_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_app_bar.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_checkbox.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_circle_loader.dart';
import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/common/result_sum_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/widget/custom_dropdown_with_search_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/widget/divisions_resources_table_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/widget/resource_app_bar_title.dart';
import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';

class DivisionResourceCalculatePage extends StatelessWidget {
  const DivisionResourceCalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: ResourceAppBarTitle(),
      child: DivisionResourceCalculateProvider(),
    );
  }
}

class DivisionResourceCalculateProvider extends StatelessWidget {
  const DivisionResourceCalculateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DivisionResourceCalculateCubit>(
      create: (context) {
        return DivisionResourceCalculateCubit(di: di);
      },
      child: DivisionResourceCalculateConsumer(),
    );
  }
}

class DivisionResourceCalculateConsumer extends StatelessWidget {
  const DivisionResourceCalculateConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DivisionResourceCalculateCubit,
      DivisionResourceCalculateState
    >(
      builder: (context, state) {
        if (state.stateEnum == StateEnum.loading) {
          return CustomCircleLoader();
        }
        return DivisionResourceCalculateWidget();
      },
    );
  }
}

class DivisionResourceCalculateWidget extends StatelessWidget {
  const DivisionResourceCalculateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DivisionResourceCalculateCubit>();
    final controller = cubit.controller;
    final isAll = context
        .watch<DivisionResourceCalculateCubit>()
        .state
        .isAllResourcesShow;
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                spacing: 8.0,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomDropdownWithSearchWidget(
                    onTap: controller.sortTable,
                    autoFocus: true,
                    enabled: true,
                    divisions: controller.divisionsVM,
                    onSelected: (p0) =>
                        cubit.onRowAction(p0.id, WidgetActionType.add),
                  ),
                  CustomCheckBox(
                    isCheck: isAll,
                    labelText: 'Отображать все разделы (кроме ИД)',
                    onChanged: context
                        .read<DivisionResourceCalculateCubit>()
                        .changeTableView,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: ValueListenableBuilder(
            valueListenable: controller.isAllRow,
            builder: (context, allRow, child) {
              return ValueListenableBuilder<
                List<DivisionWithResourceViewModel>
              >(
                valueListenable: controller.selectedRows,
                builder: (context, value, child) {
                  return Center(
                    child: DivisionsResourceTableWidget(
                      rowAttributes: divisionResourceTableAttributes,
                      tableDataRows: value,
                      isAll: allRow,
                    ),
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            spacing: 8.0,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonWidget(
                iconData: MoonIcons.arrows_chevron_left_double_32_regular,
                onTap: context.pop,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder<bool>(
                  valueListenable: controller.isValid,
                  builder: (context, value, child) {
                    return CustomButtonWidget(
                      iconData:
                          MoonIcons.arrows_chevron_right_double_32_regular,
                      onTap: value == true
                          ? () {
                              cubit.updateCashed();
                              context.go(designDivisionsRoute);
                            }
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
