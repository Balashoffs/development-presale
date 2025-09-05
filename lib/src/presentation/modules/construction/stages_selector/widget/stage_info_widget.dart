import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/common/color_options.dart';
import 'package:presale/src/presentation/bloc/construction/provider/provider.dart';
import 'package:presale/src/presentation/modules/construction/stages_selector/model/selected_item/selected_item.dart';
import 'package:presale/src/presentation/modules/construction/stages_selector/model/stage_view_model/stage_view_model.dart';
import 'package:provider/provider.dart';

import 'menu_items_widget.dart';
import 'multi_custom_moon_drop_down.dart';

class StageDataWidget extends StatefulWidget {
  const StageDataWidget({
    super.key,
    required this.stageViewModel, required this.onSelected,
  });

  final StageDataViewModel stageViewModel;
  final Function(Set<String> itemsId) onSelected;

  @override
  State<StageDataWidget> createState() => _StageDataWidgetState();
}

class _StageDataWidgetState extends State<StageDataWidget> {
  @override
  Widget build(BuildContext context) {
    final leadingColor = colorTable(context)[40];
    final labelTextColor = colorTable(context)[40];
    final trailingColor = colorTable(context)[40];
    final backgroundColor = colorTable(context)[40];
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(8);
    return MoonAccordion<StageDataViewModel>(
      identityValue: widget.stageViewModel,
      showDivider: true,
      trailing: ChangeNotifierProvider(
        create: (context) => MultiValueNotifierDropDown(
          infos: widget.stageViewModel.subStages
              .map(
                (value) =>
                    StagesSelectorSelectedItem(id: value.id, name: value.name),
              )
              .toList(),
        ),
        child: StagesSelectorMultiCustomMoonDropDown(
          hintText: widget.stageViewModel.stageInfo.type,
          hintWidth: 256,
          onSelected: widget.onSelected,
        ),
      ),
      onExpansionChanged: (value) {},
      shadows: const [],
      initiallyExpanded: true,
      maintainState: true,
      hasContentOutside: true,
      propagateGesturesToChild: true,
      borderRadius: borderRadius,
      accordionSize: MoonAccordionSize.xl,
      showBorder: true,
      iconColor: trailingColor,
      backgroundColor: backgroundColor,
      expandedBackgroundColor: backgroundColor,
      label: Text(
        '${widget.stageViewModel.stageInfo.name}, цена: ${widget.stageViewModel.stageInfo.value} руб. (${widget.stageViewModel.stageInfo.factor * 100}%)',
        style: context.moonTypography!.body.textDefault.copyWith(
          color: labelTextColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Icon(
        Icons.school,
        color: leadingColor,
      ),
      childrenPadding: const EdgeInsets.only(top: 8, bottom: 8, left: 24),
      children: [StagesSelectorMenuItemsWidget()],
    );
  }
}

class SectionDataWidget extends StatefulWidget {
  const SectionDataWidget({
    super.key,
    required this.stageViewModel, required this.onSelected,
  });

  final SectionDataVewModel stageViewModel;
  final Function(Set<String> itemsId) onSelected;
  @override
  State<SectionDataWidget> createState() => _SectionDataWidgetState();
}

class _SectionDataWidgetState extends State<SectionDataWidget> {
  @override
  Widget build(BuildContext context) {
    final leadingColor = colorTable(context)[40];
    final labelTextColor = colorTable(context)[40];
    final backgroundColor = colorTable(context)[40];
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(8);
    return MoonMenuItem(
      trailing: ChangeNotifierProvider(
        create: (context) => MultiValueNotifierDropDown(
          infos: widget.stageViewModel.subStages
              .map(
                (value) => StagesSelectorSelectedItem(
                    id: value.id,
                    name: '${value.typeName}-${value.subtypeName}'),
              )
              .toList(),
        ),
        child: StagesSelectorMultiCustomMoonDropDown(
          hintText: widget.stageViewModel.stageInfo.type,
          hintWidth: 256,
          onSelected: widget.onSelected,
        ),
      ),
      borderRadius: borderRadius,
      backgroundColor: backgroundColor ?? Colors.transparent,
      label: Text(
        widget.stageViewModel.stageInfo.name,
        style: context.moonTypography!.body.textDefault.copyWith(
          color: labelTextColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      content: Text(
        'цена: ${widget.stageViewModel.stageInfo.value} рублей (${widget.stageViewModel.stageInfo.factor *100}%)',
        style: TextStyle(color: colorTable(context)[40]),
      ),
      onTap: () {},
      leading: Icon(
        Icons.school,
        color: leadingColor,
      ),
    );
  }
}
