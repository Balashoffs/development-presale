import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:provider/provider.dart';

import 'package:presale/src/presentation/bloc/construction/provider/provider.dart';


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
    return Consumer<MultiCustomValueNotifierDropDown>(
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
            child: Column(children: _generateItems(value)),
          ),
          child: MoonTextInput(
            width: 270,
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
                      backgroundColor: context.moonColors!.bulma,
                      onTap: () => value.clearAllSelected(),
                      label: Text(
                        "${value.totalSelected}",
                        style: TextStyle(color: context.moonColors!.gohan),
                      ),
                      trailing: Icon(
                        MoonIcons.controls_close_small_16_light,
                        color: context.moonColors!.gohan,
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

  List<Widget> _generateItems(MultiCustomValueNotifierDropDown value) {
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
