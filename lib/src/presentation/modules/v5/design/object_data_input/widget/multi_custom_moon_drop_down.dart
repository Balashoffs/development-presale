import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/presentation/modules/v5/design/object_data_input/widget/drop_down_factors_controller.dart';
import 'package:provider/provider.dart';

class ObjectInputDataMultiCustomMoonDropDown extends StatefulWidget {
  const ObjectInputDataMultiCustomMoonDropDown({
    super.key,
    required this.onSelected,
  });

  final Function(Set<String>) onSelected;

  @override
  State<ObjectInputDataMultiCustomMoonDropDown> createState() =>
      _ObjectInputDataMultiCustomMoonDropDownState();
}

class _ObjectInputDataMultiCustomMoonDropDownState
    extends State<ObjectInputDataMultiCustomMoonDropDown> {
  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(4.0);

    return Consumer<MultiObjectValueNotifierDropDown>(
      builder: (context, value, child) {
        return MoonDropdown(
          maxWidth: 700,
          show: value.showChoices,
          constrainWidthToChild: false,
          distanceToTarget: 8.0,
          dropdownAnchorPosition: MoonDropdownAnchorPosition.bottom,
          dropdownShadows: null,
          onTapOutside: () => value.tapOutside(),
          content: ClipRRect(
            borderRadius: borderRadius,
            child: Column(children: _generateItems(value)),
          ),
          child: MoonTextInput(
            width: 250,
            readOnly: true,
            canRequestFocus: false,
            mouseCursor: MouseCursor.defer,
            hintText: "Доп. сложность",
            onTap: () => value.onTap(),
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: value.isLeading
                ? Center(
                    child: MoonTag(
                      tagSize: MoonTagSize.xs,
                      onTap: () => value.clearAllSelected(),
                      label: Text(
                        "${value.totalSelected}",
                      ),
                      trailing: Icon(
                        MoonIcons.controls_close_small_16_light,
                      ),
                    ),
                  )
                : null,
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

  List<Widget> _generateItems(MultiObjectValueNotifierDropDown value) {
    return value.items.map(
      (e) {
        return MoonMenuItem(
          width: 384,
          absorbGestures: true,
          onTap: () {
            widget.onSelected(value.selected(e));
            value.onCheck(e);
          },
          label: Text(e),
          trailing: MoonCheckbox(
            value: value.isSelected(e),
            tapAreaSizeValue: 0,
            onChanged: (_) {},
          ),
        );
      },
    ).toList();
  }
}
