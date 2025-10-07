import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/common/color_options.dart';

class TextWithRowHint extends StatelessWidget {
  const TextWithRowHint({
    super.key,
    required this.hintText,
    required this.textWidget,
    this.leading,
  });

  final String hintText;
  final Widget textWidget;
  final IconData? leading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 4.0,
        children: [
          SizedBox(
            width: 256,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 4.0,
              children: [
                if (leading != null) Icon(leading, size: 24),
                Text(hintText),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 8.0), child: textWidget),
        ],
      ),
    );
  }
}

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    this.initValue,
    this.helpText,
    this.hintText,
    this.leading,
    this.trailing,
    this.onChanged,
    this.validator,
    this.width,
    this.autofocus = false,
  });

  final String? initValue;
  final String? helpText;
  final String? hintText;
  final IconData? leading;
  final IconData? trailing;
  final double? width;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool autofocus;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  final TextEditingController _textController = TextEditingController();
  bool isEntered = true;

  @override
  void initState() {
    super.initState();
    if (widget.initValue != null) {
      _textController.text = widget.initValue!;
    }
  }

  @override
  void didUpdateWidget(covariant CustomTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: MoonFormTextInput(
        focusNode: FocusNode(),
        width: widget.width,
        controller: _textController,
        enabled: true,
        textInputSize: MoonTextInputSize.md,
        hasFloatingLabel: false,
        onChanged: widget.onChanged,
        textColor: colorTable(context)[40],
        hintTextColor: colorTable(context)[40],
        backgroundColor: colorTable(context)[40],
        activeBorderColor: getColor(context, MoonColor.trunks),
        inactiveBorderColor: colorTable(context)[40],
        hoverBorderColor: colorTable(context)[40],
        errorColor: colorTable(context)[40],
        borderRadius: BorderRadius.circular(8.toDouble()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: widget.hintText,
        helper: widget.helpText != null ? Text(widget.helpText!) : null,
        validator: widget.validator,
        autofocus: widget.autofocus,
        onTapOutside: (PointerDownEvent _) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        onTap: () {
          if(isEntered){
            isEntered = !isEntered;
            _textController.clear();
            widget.onChanged!('');
          }
        },
        leading: widget.leading != null ? Icon(widget.leading, size: 24) : null,
        trailing: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: widget.trailing != null
                ? Icon(widget.trailing, size: 24)
                : null,
            onTap: () => _textController.clear(),
          ),
        ),
      ),
    );
  }
}

class CustomTextAreaInput extends StatelessWidget {
  const CustomTextAreaInput({
    super.key,
    required this.hintText,
    this.helperText,
    this.leading,
    this.trailing,
    this.initValue,
    this.width,
    this.onChanged,
    this.validator,
  });

  final String hintText;
  final String? helperText;
  final IconData? leading;
  final IconData? trailing;
  final String? initValue;
  final double? width;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MoonTextArea(
        initialValue: initValue,
        enabled: true,
        expands: true,
        height: 98,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        activeBorderColor: getColor(context, MoonColor.trunks),
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
