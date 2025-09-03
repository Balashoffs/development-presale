import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

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
  bool checkboxWithLabelValue = false;

  @override
  Widget build(BuildContext context) {
    return MoonMenuItem(
      width: widget.width,
      absorbGestures: true,
      onTap: () {
        checkboxWithLabelValue = !checkboxWithLabelValue;
        widget.onChanged(checkboxWithLabelValue);
        setState(() {});
      },
      label: Text(widget.labelText),
      trailing: MoonCheckbox(
        tristate: false,
        value: checkboxWithLabelValue,
        tapAreaSizeValue: 0,
        onChanged: (_) {},
      ),
    );
  }
}
