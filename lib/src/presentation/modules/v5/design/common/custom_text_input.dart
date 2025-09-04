import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/common/color_options.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/widget/text_utils.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    required this.hintText,
    this.helperText,
    this.leading,
    this.trailing,
    this.onChanged,
    this.validator,
    this.width,
    this.initValue,
    this.autofocus = false,
    required this.isEnables,
  });

  final String hintText;
  final String? helperText;
  final IconData? leading;
  final IconData? trailing;
  final double? width;
  final double? initValue;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool autofocus;
  final bool isEnables;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  final TextEditingController _textController = TextEditingController();
  Color? _borderColor;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _borderColor = widget.hintText == '0' && _textController.text.isEmpty
            ? getColor(context, MoonColor.chichi)
            : getColor(context, MoonColor.whis10);
      });
    });
  }

  @override
  void dispose() {
    _textController.clear();
    _textController.dispose();
    super.dispose(); //
  }

  @override
  void didUpdateWidget(CustomTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.key != widget.key) {
      _textController.text = widget.hintText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MoonFormTextInput(
      key: widget.key,
      focusNode: _focusNode,
      textAlign: TextAlign.center,
      controller: _textController,
      enabled: widget.isEnables,
      textInputSize: MoonTextInputSize.xl,
      hasFloatingLabel: true,
      activeBorderColor: getColor(context, MoonColor.zeno),
      inactiveBorderColor: _borderColor ?? getColor(context, MoonColor.whis10),
      errorColor: colorTable(context)[MoonColor.chichi.index]!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hintText: widget.hintText,
      helperTextStyle: TextStyle(fontSize: 16),
      validator: widget.validator,
      autofocus: widget.autofocus,
      onTapOutside: (PointerDownEvent _) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: widget.onChanged,
    );
  }
}

class CustomTextAreaInput extends StatelessWidget {
  const CustomTextAreaInput({
    super.key,
    this.hintText,
    this.helperText,
    this.leading,
    this.trailing,
    this.width,
    this.initValue,
    this.onChanged,
    this.validator,
  });

  final String? hintText;
  final String? helperText;
  final IconData? leading;
  final IconData? trailing;
  final double? width;
  final double? initValue;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MoonTextArea(
        activeBorderColor: getColor(context, MoonColor.zeno),
        inactiveBorderColor: getColor(context, MoonColor.whis10),
        errorColor: colorTable(context)[MoonColor.chichi.index]!,
        height: null,
        enabled: true,
        expands: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        borderRadius: BorderRadius.circular(8.toDouble()),
        hintText: hintText,
        validator: validator,
        onTapOutside: (PointerDownEvent _) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: onChanged,
        helper: helperText != null ? Text(helperText!) : null,
      ),
    );
  }
}
