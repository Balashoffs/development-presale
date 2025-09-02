import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presale/src/data/core/string_converter.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v4/design/division_resource_table/widget_action_type.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/vc/division_with_all_vc.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/vc/division_with_unselected_vc.dart';
import 'package:presale/src/presentation/bloc/v5/design/division_resource_calculator/division_resource_calculate_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_app_bar.dart';
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
      child: DivisionResourceCalculateRepository(),
    );
  }
}

class DivisionResourceCalculateRepository extends StatelessWidget {
  const DivisionResourceCalculateRepository({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ResourcesWithUnselectedViewController(),
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
        return DivisionResourceCalculateCubit(
          dbClient: di.dbClientImpl,
          resourcesViewController: context
              .read<ResourcesWithUnselectedViewController>(),
        )..init();
      },
      child: DivisionResourceCalculateConsumer(),
    );
  }
}

class DivisionResourceCalculateConsumer extends StatelessWidget {
  const DivisionResourceCalculateConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      DivisionResourceCalculateCubit,
      DivisionResourceCalculateState
    >(
      builder: (context, state) {
        return state.mapOrNull(
              initial: (value) => CustomCircleLoader(),
              showPage: (value) => DivisionResourceCalculateWidget(),
            ) ??
            SizedBox();
      },
      listener: (context, state) {
        state.whenOrNull(nextPage: () => context.go(designDivisionsRoute));
      },
    );
  }
}

class DivisionResourceCalculateWidget extends StatelessWidget {
  const DivisionResourceCalculateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ResourcesWithUnselectedViewController>();
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Разделы для проектирования",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  CustomDropdownWithSearchWidget(
                    onTap: controller.sortTable,
                    autoFocus: true,
                    enabled: true,
                    divisions: controller.divisionsVM,
                    onSelected: (p0) =>
                        controller.onRowAction(p0.id, WidgetActionType.add),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder<String>(
                  valueListenable: controller.divisionTypeVN,
                  builder: (context, value, child) {
                    return Text(
                      value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder<double>(
                  valueListenable: controller.summaryVN,
                  builder: (context, value, child) {
                    return TextCustomWidget(
                      name: 'Итого',
                      value: convertToString(value, 0),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: ValueListenableBuilder<List<DivisionWithResourceRowVM>>(
            valueListenable: controller.selectedRows,
            builder: (context, value, child) {
              return Center(
                child: DivisionsResourceTableWidget(
                  rowAttributes: divisionResourceTableAttributes,
                  tableDataRows: value,
                  onRowAction: controller.onRowAction,
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder<bool>(
              valueListenable: controller.isValid,
              builder: (context, value, child) {
                return NextPageWidget(
                  onTap: value == true
                      ? context
                            .read<DivisionResourceCalculateCubit>()
                            .onNextPage
                      : null,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
