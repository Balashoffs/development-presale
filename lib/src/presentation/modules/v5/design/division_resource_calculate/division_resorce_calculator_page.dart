import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/common/metadata_for_saving.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/division_resource_row_viewmodel.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_pojo.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/dto_extension.dart';
import 'package:presale/src/domain/models/v6/presale_exchange/presale_exchange_pojo.dart';
import 'package:presale/src/domain/service/v6/design/encrypt_json_to_bytes.dart';
import 'package:presale/src/domain/service/v6/design/encrypt_shared_design_offer.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/bloc/v5/design/division_resource_calculator/division_resource_calculate_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_app_bar.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_checkbox.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_circle_loader.dart';
import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/widget/custom_dropdown_with_search_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/widget/divisions_resources_table_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/widget/resource_app_bar_title.dart';
import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';
import 'package:presale/src/data/helpers/file_saver_helper/save_file_mobile.dart'
    if (dart.library.html) 'package:presale/src/data/helpers/file_saver_helper/save_file_web.dart';

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
                    onSelected: (p0) => cubit.onAddRow(p0.id),
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
              CustomButtonWidget(text: '  Назад  ', onTap: context.pop),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder<bool>(
                  valueListenable: controller.isValid,
                  builder: (context, value, child) {
                    return Row(
                      spacing: 16.0,
                      children: [
                        CustomButtonWidget(
                          iconData: MoonIcons.files_share_24_light,
                          onTap: value == true
                              ? () {
                                  _onShare(context);
                                }
                              : null,
                        ),
                        CustomButtonWidget(
                          text: ' Вперед ',
                          onTap: value == true
                              ? () {
                                  context.go(designDivisionsRoute);
                                }
                              : null,
                        ),
                      ],
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

  void _onShare(BuildContext context) async {
    if (di.inMemoryImpl.designPresaleDTO != null) {
      final designDto = di.inMemoryImpl.designPresaleDTO!;
      DesignPresalePojo designPresalePojo = designDto.toPojo();
      int key = stringToInt(di.dartDefineModel.user);
      String api = di.dartDefineModel.api;
      EncryptShareDesignOfferService service = EncryptShareDesignOfferService(
        key,
      );
      PresaleExchangePojo exchangePojo = PresaleExchangePojo(
        designPresale: designPresalePojo,
        versionApi: api,
      );

      await service
          .encrypt(exchangePojo)
          .then(
            (value) => value.fold((l) => {}, (r) {
              String id = designDto.inputDataDesignDTO!.dayCounter
                  .getOfferUniqueNumber();
              String end = formatDate(DateTime.now(), [
                'HH',
                '-',
                'nn',
                '-',
                'ss',
              ]);
              MetadataForSaving metaData = MetadataForSaving.saveAsPresaleFile(
                r,
                '${id}_$end',
              );
              saveAndLaunchFile(metaData);
            }),
          );
    }
  }
}
