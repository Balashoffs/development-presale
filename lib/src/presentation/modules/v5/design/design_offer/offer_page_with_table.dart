import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_cubit.dart';
import 'package:presale/src/presentation/bloc/v5/design/offer/design_offer_result_controller.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sign_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_app_bar.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_circle_loader.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/design_offer_root_widget.dart';

class DesignOfferPage extends StatelessWidget {
  const DesignOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(child: DesignOfferRepository());
  }
}

class DesignOfferRepository extends StatelessWidget {
  const DesignOfferRepository({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DesignOfferResultController(),
      child: DesignOfferBlocProviderWidget(),
    );
  }
}

class DesignOfferBlocProviderWidget extends StatelessWidget {
  const DesignOfferBlocProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DesignOfferCubit(
            dbClient: di.dbClientImpl,
            controller: context.read<DesignOfferResultController>(),
          ),
        ),
        BlocProvider(
          create: (context) => PersonSignCubit(
            client: di.dbClientImpl,
            sinkPersonSign: context
                .read<DesignOfferResultController>()
                .personSignSink,
          )..init(),
        ),
      ],
      child: DesignOfferBlocConsumerWidget(),
    );
  }
}

class DesignOfferBlocConsumerWidget extends StatelessWidget {
  const DesignOfferBlocConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesignOfferCubit, DesignOfferState>(
      builder: (context, state) {
        if (state.stateEnum == StateEnum.loading) {
          return CustomCircleLoader();
        }
        return DesignOfferRootWidget();
      },
    );
  }
}
