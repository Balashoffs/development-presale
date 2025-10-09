import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v2/constructing/model/calculator/section_info_repository.dart';

import 'package:presale/src/presentation/bloc/construction/provider/provider.dart';
import 'package:presale/src/presentation/bloc/construction/stages_selector/stages_selector_cubit.dart';
import 'package:provider/provider.dart';

import 'custom_moon_accordion.dart';

class StagesSelectorBuilderMoonAccordion extends StatelessWidget {
  const StagesSelectorBuilderMoonAccordion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StagesSelectorCubit, StagesSelectorState>(
      key: UniqueKey(),
      builder: (context, state) {
        return state.when(
          initial: () => Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
              child: MoonCircularLoader(
                circularLoaderSize: MoonCircularLoaderSize.x2s,
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
          section: (section) => CustomMoonItem(
            viewModel: section,
            key: UniqueKey(),
          ),
          stage: (stage) => ChangeNotifierProvider(
            key: UniqueKey(),
            create: (context) => StageItemValueNotifier(
              sectionInfoRepository: context.read<SectionInfoRepository>(),
            )..setWidgets(stage.subStages, context),
            child: CustomMoonAccordion(viewModel: stage),
          ),
          error: (error) {
            return MoonAlert.outlined(
              show: true,
              color: context.moonColors!.whis,
              borderColor: context.moonColors!.whis,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              leading: const Icon(MoonIcons.notifications_alert_24_light),
              label: Text(error),
              trailing: MoonButton.icon(
                buttonSize: MoonButtonSize.xs,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                gap: 0,
                onTap: () {},
                icon: Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                  color: context.moonColors!.whis,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

