import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v2/constructing/model/calculator/section_info_repository.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v2/constructing/model/calculator/stage_info_repository.dart';
import 'package:presale/src/domain/models/v2/constructing/model/calculator/stage_section_repository.dart';
import 'package:presale/src/presentation/bloc/construction/stages_selector/stage_selector_root_cubit/stage_selector_root_cubit.dart';
import 'package:presale/src/presentation/common/widget/text_divider.dart';
import 'package:presale/src/presentation/modules/construction/navi/construction_navi.dart';
import 'package:presale/src/presentation/modules/construction/stages_selector/widget/result_button.dart';
import 'package:presale/src/presentation/modules/construction/stages_selector/widget/stage_selector_tree_widget.dart';

class StagesSelectorPage extends StatelessWidget {
  const StagesSelectorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => StageSectionRepository(),
          ),
          RepositoryProvider(
            create: (context) => StageInfoRepository(
                objectId: selectRoutePath, dbClient: di.dbClientImpl),
          ),
          RepositoryProvider(
            create: (context) =>
                SectionInfoRepository(dbClient: di.dbClientImpl),
          ),
        ],
        child: StagesSelectorBlocProvider(),
      ),
    );
  }
}

class StagesSelectorBlocProvider extends StatelessWidget {
  const StagesSelectorBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StageSelectorRootCubit(
        infoRepository: context.read<StageInfoRepository>(),
        sectionInfoRepository: context.read<SectionInfoRepository>(),
      ),
      child: StagesSelectorBlocBuilder(),
    );
  }
}

class StagesSelectorBlocBuilder extends StatelessWidget {
  const StagesSelectorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StageSelectorRootCubit, StageSelectorRootState>(
      listener: (context, state) {
        if (state is NextPageState) {
          context.go(fillGoRoutePath);
        }
      },
      builder: (context, state) {
        if (state is InitialState) {
          return Center(
            child: MoonCircularLoader(),
          );
        }
        if (state is LoadedState) {
          return StagesSelectorWidget();
        }
        if (state is ErrorState) {
          String error = state.errorText;
          return Center(child: MoonAlert(label: Text(error)));
        }
        return Center();
      },
    );
  }
}

class StagesSelectorWidget extends StatelessWidget {
  const StagesSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextDivider(
            text: "Выбирете производственные работы",
            paddingTop: 0,
          ),
          ResultButton(),
          StageSelectorTreeWidget(),
        ],
      ),
    );
  }
}



