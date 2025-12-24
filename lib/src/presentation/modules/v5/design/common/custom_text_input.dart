import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    required this.hintText,
    this.helperText,
    this.valueSuffix,
    this.leading,
    this.trailing,
    this.onChanged,
    this.validator,
    this.width,
    this.initValue,
    this.styleFontSize = 12,
    this.helpStyleFontSize = 12,
    this.autofocus = false,
    required this.isEnables,
    this.hasFloatingLabel = false,
    this.textInputSize = MoonTextInputSize.sm,
    this.onTap,
  });

  final String hintText;
  final String? helperText;
  final String? valueSuffix;
  final IconData? leading;
  final IconData? trailing;
  final double? width;
  final double? initValue;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool autofocus;
  final bool isEnables;
  final bool hasFloatingLabel;
  final MoonTextInputSize textInputSize;
  final double styleFontSize;
  final double helpStyleFontSize;
  final DateTime Function()? onTap;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.valueSuffix != null) {
      _textController.addListener(() {
        bool isNotPercent = !_textController.text.contains('%');
        if (isNotPercent) {
          int pos = _textController.text.length;
          final newText = _textController.text + widget.valueSuffix!;
          _textController.value = _textController.value.copyWith(
            text: newText,
            selection: TextSelection.collapsed(offset: pos),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose(); //
  }

  @override
  void didUpdateWidget(CustomTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MoonFormTextInput(
      key: widget.key,
      focusNode: _focusNode,
      textAlign: TextAlign.start,
      controller: _textController,
      enabled: widget.isEnables,
      helperTextStyle: TextStyle(fontSize: widget.helpStyleFontSize),
      textInputSize: widget.textInputSize,
      hasFloatingLabel: widget.hasFloatingLabel,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hintText: widget.hintText,
      validator: widget.validator,
      autofocus: widget.autofocus,
      onTapOutside: (PointerDownEvent _) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: widget.onChanged,
    );
  }
}

class CustomCalendarPicker extends StatefulWidget {
  const CustomCalendarPicker({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.width,
    required this.isEnables,
    this.textInputSize = MoonTextInputSize.sm,
  });

  final String hintText;
  final double? width;
  final ValueChanged<String> onChanged;
  final bool isEnables;
  final MoonTextInputSize textInputSize;

  @override
  State<CustomCalendarPicker> createState() => _CustomCalendarPickerState();
}

class _CustomCalendarPickerState extends State<CustomCalendarPicker> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose(); //
  }

  @override
  void didUpdateWidget(CustomCalendarPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MoonFormTextInput(
      key: widget.key,
      leading: Icon(MoonIcons.time_calendar_24_light, size: 24),
      focusNode: _focusNode,
      controller: _textController,
      enabled: widget.isEnables,
      readOnly: true,
      textInputSize: widget.textInputSize,
      textAlign: TextAlign.center,
      hintText: widget.hintText,
      validator: (String? value) =>
          value != null && value.isEmpty ? "Выберите дату" : null,
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          locale: Locale('ru', 'RU'),
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2050),
        );

        if (pickedDate != null) {
          final localDT = pickedDate.toLocal();
          final localS = '${localDT.day}-${localDT.month}-${localDT.year}';
          _textController.text =localS;
          widget.onChanged(localS);
        }
      },
      trailing: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: const Icon(MoonIcons.controls_close_small_24_light, size: 24),
          onTap: () => _textController.clear(),
        ),
      ),
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
  final String? initValue;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return MoonTextArea(
      height: null,
      enabled: true,
      expands: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      borderRadius: BorderRadius.circular(8.toDouble()),
      hintText: hintText,
      validator: validator,
      onChanged: onChanged,
      initialValue: initValue,
      helper: helperText != null ? Text(helperText!) : null,
    );
  }
}
