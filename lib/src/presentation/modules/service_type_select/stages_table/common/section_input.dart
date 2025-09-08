import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v1/section/section.dart';
import 'package:presale/src/domain/models/v1/service_stage/service_stage.dart';

import 'package:presale/src/presentation/common/typography_page_options.dart';

import 'package:presale/src/presentation/common/inputs/simple_dropdown_input.dart';
import 'package:presale/src/presentation/modules/service_type_select/stages_table/common/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SectionInput extends StatelessWidget {
  final Section? initial;
  final Function(Section section)? onChanged;
  final bool blank;
  final ServiceStage stage;

  const SectionInput({
    super.key,
    this.initial,
    this.onChanged,
    this.blank = false,
    required this.stage
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return BlocProvider(
    //   // create: (context) => SectionInputCubit(
    //   //   di.sectionClient,
    //   //   di.employeeClient,
    //   // ),
    //   child: _SectionInput(
    //     section: initial,
    //     onChanged: onChanged,
    //     blank: blank,
    //     stage: stage,
    //   ),
    // );
  }
}

class _SectionInput extends StatelessWidget {
  final Section? section;
  final Function(Section section)? onChanged;
  final bool blank;
  final ServiceStage stage;

  const _SectionInput({
    super.key,
    this.section,
    this.onChanged,
    this.blank = false,
    required this.stage,
  });

  @override
  Widget build(BuildContext context) {
    SectionInputCubit cubitOf(BuildContext context) => context.read<SectionInputCubit>();

    return SimpleDropdownInput<Section>(
      onLoadItems: (text) => cubitOf(context).load(text, stage),
      itemsStream: cubitOf(context).stream,
      maxWidth: 600,
      menuPadding: EdgeInsets.symmetric(vertical: 8),
      initialValue: section,
      blank: blank,
      itemBuilder: (value, chosen) {
        value = value as Section;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            value.name,
            style: getBodyTextStyle(context, MoonTextSize.size14),
          ),
        );
      },
      onChanged: (value) {
        onChanged?.call(value);
      },
      labelBuilder: (value) {
        value = value as Section;
        return value.name;
      },
    );
  }
}
