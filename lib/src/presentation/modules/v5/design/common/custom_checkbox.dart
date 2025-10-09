import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/common/color_options.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.onChanged,
    required this.labelText,
    this.width = 250,
    this.isCheck = false,
  });

  final ValueChanged<bool> onChanged;
  final String labelText;
  final double width;
  final bool isCheck;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _checkboxWithLabelValue = false;

  @override
  void initState() {
    super.initState();
    _checkboxWithLabelValue = widget.isCheck;
  }

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
        tristate: false,
        value: _checkboxWithLabelValue,
        tapAreaSizeValue: 0,
        onChanged: (_) {},
      ),
    );
  }
}
