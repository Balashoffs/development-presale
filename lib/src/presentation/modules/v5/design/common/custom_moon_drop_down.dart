import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/modules/v5/design/common/drop_down_text_controller.dart';
import 'package:provider/provider.dart';

class CustomMoonDropDown extends StatefulWidget {
  const CustomMoonDropDown({
    super.key,
    this.width = 256,
    required this.initText,
    required this.onSelected,
    this.helperText,
    required this.leadingIcon,
    this.validator,
  });

  final Function(String result) onSelected;
  final String? helperText;
  final String initText;
  final IconData leadingIcon;
  final double width;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomMoonDropDown> createState() => _CustomMoonDropDownState();
}

class _CustomMoonDropDownState extends State<CustomMoonDropDown> {
  final TextEditingController _textEditController = TextEditingController();
  final FocusNode _focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    _textEditController.text = widget.initText;
  }

  @override
  void dispose() {
    _textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DropDownTextController>(
      builder: (context, value, child) {
        return MoonDropdown(
          show: value.showMenu,
          constrainWidthToChild: true,
          dropdownAnchorPosition: MoonDropdownAnchorPosition.bottom,
          dropdownShadows: null,
          onTapOutside: value.tapOutside,
          content: Column(children: _generateItems(value, widget.onSelected)),
          child: MoonFormTextInput(
            width: widget.width,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: _focusNode,
            validator: widget.validator,
            controller: _textEditController,
            helper: widget.helperText != null ? Text(widget.helperText!) : null,
            readOnly: true,
            textAlign: TextAlign.center,
            canRequestFocus: false,
            mouseCursor: MouseCursor.defer,
            hintText: widget.initText,
            onTap: value.onTap,
            onTapOutside: (PointerDownEvent _) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            leading: value.isLeading ? Icon(widget.leadingIcon, size: 24) : null,
            trailing: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Center(
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: value.showMenu ? -0.5 : 0,
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

  List<Widget> _generateItems(
    DropDownTextController vn,
    Function(String result) onSelected,
  ) {
    return vn.items.map((e) {
      return MoonMenuItem(
        menuItemPadding: EdgeInsetsGeometry.symmetric(vertical: 4.0),
        menuItemCrossAxisAlignment: CrossAxisAlignment.center,
        labelAndContentCrossAxisAlignment: CrossAxisAlignment.center,
        onTap: () {
          onSelected(e);
          vn.selected(e);
          setState(() {
            _textEditController.text = e;
          });
        },
        label: Text(e),
      );
    }).toList();
  }
}

