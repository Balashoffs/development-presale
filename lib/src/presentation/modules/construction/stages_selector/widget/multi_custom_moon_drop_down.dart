import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/bloc/construction/provider/provider.dart';
import 'package:provider/provider.dart';

class StagesSelectorMultiCustomMoonDropDown extends StatefulWidget {
  const StagesSelectorMultiCustomMoonDropDown({
    super.key,
    required this.onSelected,
    required this.hintText,
    required this.hintWidth,
  });

  final Function(Set<String>) onSelected;
  final String hintText;
  final double hintWidth;

  @override
  State<StagesSelectorMultiCustomMoonDropDown> createState() =>
      _StagesSelectorMultiCustomMoonDropDownState();
}

class _StagesSelectorMultiCustomMoonDropDownState
    extends State<StagesSelectorMultiCustomMoonDropDown> {
  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(4.0);

    return Consumer<MultiValueNotifierDropDown>(
      builder: (context, value, child) {
        return MoonDropdown(
          targetAnchor: Alignment.topLeft,
          dropdownAnchorPosition: MoonDropdownAnchorPosition.topLeft,
          show: value.showChoices,
          constrainWidthToChild: false,
          distanceToTarget: 8.0,
          dropdownShadows: null,
          onTapOutside: () => value.tapOutside(),
          followerAnchor: Alignment.topCenter,
          content: ClipRRect(
            borderRadius: borderRadius,
            child: Column(
              children: _generateItems(value),
            ),
          ),
          child: MoonTextInput(
            width: widget.hintWidth,
            readOnly: true,
            canRequestFocus: false,
            mouseCursor: MouseCursor.defer,
            hintText: widget.hintText,
            onTap: () => value.onTap(),
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: value.isLeading
                ? Center(
              child: MoonTag(
                tagSize: MoonTagSize.xs,
                backgroundColor: context.moonColors!.bulma,
                onTap: () {
                  value.clearAllSelected();
                  widget.onSelected.call({});
                },
                label: Text(
                  "${value.totalSelected}/${value.total}",
                  style: TextStyle(color: context.moonColors!.gohan),
                ),
                trailing: Icon(
                  MoonIcons.controls_close_small_16_light,
                  color: context.moonColors!.gohan,
                ),
              ),
            )
                : Center(
              child: MoonTag(
                tagSize: MoonTagSize.xs,
                backgroundColor: context.moonColors!.bulma,
                onTap: () {
                },
                label: Text(
                  "./${value.total}",
                  style: TextStyle(color: context.moonColors!.gohan),
                ),
              ),
            ),
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Center(
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: value.showChoices ? -0.5 : 0,
                  child: const Icon(
                    MoonIcons.controls_chevron_down_16_light,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _generateItems(MultiValueNotifierDropDown value) {
    return value.items.map(
          (selected) {
        return MoonMenuItem(
          width: 384,
          absorbGestures: true,
          onTap: () {
            widget.onSelected(value.selected(selected.id));
            value.onCheck();
          },
          label: Text(selected.name),
          trailing: MoonCheckbox(
            value: value.isSelected(selected.id),
            tapAreaSizeValue: 0,
            onChanged: (_) {},
          ),
        );
      },
    ).toList();
  }
}