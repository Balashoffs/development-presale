import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/common/color_options.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.onChanged,
    required this.labelText,
    this.width = 250,
  });

  final ValueChanged<bool> onChanged;
  final String labelText;
  final double width;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _checkboxWithLabelValue = false;

  @override
  Widget build(BuildContext context) {
    return MoonMenuItem(
      width: widget.width,
      absorbGestures: true,
      onTap: () {
        _checkboxWithLabelValue = !_checkboxWithLabelValue;
        widget.onChanged(_checkboxWithLabelValue);
        setState(() {});
      },
      label: Text(widget.labelText),
      trailing: MoonCheckbox(
        checkColor: getColor(context, MoonColor.zeno),
        activeColor: getColor(context, MoonColor.goku),
        borderColor: getColor(context, MoonColor.trunks),
        tristate: false,
        value: _checkboxWithLabelValue,
        tapAreaSizeValue: 0,
        onChanged: (_) {},
      ),
    );
  }
}
