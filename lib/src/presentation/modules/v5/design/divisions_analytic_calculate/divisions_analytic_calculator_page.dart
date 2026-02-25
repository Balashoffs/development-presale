import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/service/v6/design/share_presale.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/bloc/v5/design/divisions_with_analytic_calculate_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_app_bar.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_circle_loader.dart';
import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/divisions_analytic_calculate/widget/divisions_table_with_analytic_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';

class DivisionsWithAnalyticCalculatePage extends StatelessWidget {
  const DivisionsWithAnalyticCalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      child: DivisionsWithAnalyticCalculateProvider(),
    );
  }
}

class DivisionsWithAnalyticCalculateProvider extends StatelessWidget {
  const DivisionsWithAnalyticCalculateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DivisionsWithAnalyticCalculateCubit>(
      create: (context) {
        return DivisionsWithAnalyticCalculateCubit(di: di);
      },
      child: DivisionsWithAnalyticCalculateConsumer(),
    );
  }
}

class DivisionsWithAnalyticCalculateConsumer extends StatelessWidget {
  const DivisionsWithAnalyticCalculateConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DivisionsWithAnalyticCalculateCubit,
      DivisionsWithAnalyticCalculateState
    >(
      builder: (context, state) {
        if (state.stateEnum == StateEnum.loading) {
          return CustomCircleLoader();
        }
        return DivisionsWithAnalyticCalculateWidget();
      },
    );
  }
}

class DivisionsWithAnalyticCalculateWidget extends StatelessWidget {
  const DivisionsWithAnalyticCalculateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: DivisionsTableWithAnalyticWidget(
            rowAttributes: divisionTableWithAnalyticAttributes,
            tableDataRows: context
                .read<DivisionsWithAnalyticCalculateCubit>()
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
