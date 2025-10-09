import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/service/v6/design/share_presale.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/bloc/v5/design/divisions_margin_calculator/divisions_margin_calculate_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_app_bar.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_circle_loader.dart';
import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/divisions_margin_calculate/widget/division_app_bar_title.dart';
import 'package:presale/src/presentation/modules/v5/design/divisions_margin_calculate/widget/divisions_table_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';

class DivisionsMarginCalculatePage extends StatelessWidget {
  const DivisionsMarginCalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: DivisionAppBarTitle(),
      child: DivisionsMarginCalculateProvider(),
    );
  }
}

class DivisionsMarginCalculateProvider extends StatelessWidget {
  const DivisionsMarginCalculateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DivisionsMarginCalculateCubit>(
      create: (context) {
        return DivisionsMarginCalculateCubit(di: di);
      },
      child: DivisionsMarginCalculateConsumer(),
    );
  }
}

class DivisionsMarginCalculateConsumer extends StatelessWidget {
  const DivisionsMarginCalculateConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DivisionsMarginCalculateCubit,
      DivisionsMarginCalculateState
    >(
      builder: (context, state) {
        if (state.stateEnum == StateEnum.loading) {
          return CustomCircleLoader();
        }
        return DivisionsMarginCalculateWidget();
      },
    );
  }
}

class DivisionsMarginCalculateWidget extends StatelessWidget {
  const DivisionsMarginCalculateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: DivisionsMarginTableWidget(
            rowAttributes: divisionMarginTableAttributes,
            tableDataRows: context
                .read<DivisionsMarginCalculateCubit>()
                .controller
                .rows,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            spacing: 16.0,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonWidget(text: '  Назад  ', onTap: context.pop),
              CustomButtonWidget(
                  text: 'Поделиться',
                onTap: () {
                  final designData = di.inMemoryImpl.designPresaleDTO;
                  final defineModel = di.dartDefineModel;
                  if (designData != null) {
                    onShare(designData, defineModel);
                  }
                },
              ),
              CustomButtonWidget(
                text: ' Вперед ',
                onTap: () {
                  context.go(designOfferRoute);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
