import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';


class SimpleTextField extends StatefulWidget {
  final String? initialValue;
  final String? labelText;
  final String? errorText;
  final String? titleText;
  final String? helperText;
  final bool enabled;
  final bool autofocus;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType inputType;
  final bool password;
  final bool canClear;
  final Widget? suffix;
  final bool multiline;
  final double maxHeight;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool phoneInput;
  final FloatingLabelBehavior? behavior;
  final bool? expands;
  final bool labelInput;
  final bool changeAfterSubmit;

  const SimpleTextField({
    super.key,
    this.initialValue,
    this.labelText,
    this.errorText,
    this.titleText,
    this.onChanged,
    this.onSubmit,
    this.enabled = true,
    this.autofocus = false,
    this.suffix,
    this.inputFormatters,
    this.inputType = TextInputType.text,
    this.password = false,
    this.helperText,
    this.multiline = false,
    this.maxHeight = double.infinity,
    this.canClear = false,
    this.textInputAction,
    this.focusNode,
    this.behavior,
    this.expands,
    this.phoneInput = false,
    this.labelInput = false,
    this.changeAfterSubmit = false,
  });

  @override
  State<SimpleTextField> createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  final _controller = TextEditingController();
  late FocusNode _focus;
  bool _obscure = false;
  String? error;

  @override
  void initState() {
    _focus = widget.focusNode ?? FocusNode();
    if (widget.initialValue != null) {
      _controller.value = TextEditingValue(
          text: widget.initialValue!,
          selection: TextSelection(baseOffset: widget.initialValue!.length, extentOffset: widget.initialValue!.length));
    }

    if (widget.phoneInput) {
      _controller.addListener(() {});
    }

    if (widget.password) _obscure = true;

    super.initState();
  }

  @override
  void didUpdateWidget(SimpleTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != null) {
      // if (_focus.hasFocus) return;
      _controller.value = TextEditingValue(
          text: widget.initialValue!,
          selection: TextSelection(baseOffset: widget.initialValue!.length, extentOffset: widget.initialValue!.length));
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.multiline || widget.multiline && widget.maxHeight != double.infinity);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
            child: Text(
              widget.titleText!,
              style: getBodyTextStyle(context, MoonTextSize.size16),
            ),
          ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: widget.maxHeight,
          ),
          child: TextFormField(
            autofocus: widget.autofocus,
            focusNode: _focus,
            controller: _controller,
            keyboardType: widget.phoneInput ? TextInputType.phone : widget.inputType,
            inputFormatters: widget.inputFormatters,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              labelText: widget.labelText,
              // label: widget.errorText == null ? null : Text(widget.errorText ?? ''),
              // errorText: error ?? widget.errorText,
              helperText: widget.helperText,
              helperMaxLines: 3,
              helperStyle: getBodyTextStyle(context, MoonTextSize.size12),
              fillColor: Colors.transparent,
              filled: widget.enabled,
              errorStyle: getBodyTextStyle(context, MoonTextSize.size12),
              // contentPadding: EdgeInsets.zero,
              labelStyle: getBodyTextStyle(context, MoonTextSize.size16),
              suffixIcon: widget.suffix != null || widget.password || widget.canClear
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.password)
                          IconButton(
                            splashRadius: 14,
                            visualDensity: VisualDensity.compact,
                            onPressed: () => setState(() => _obscure = !_obscure),
                            icon: Icon(
                              _obscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                              size: 16,
                            ),
                          ),
                        if (widget.canClear && (_controller.text.isNotEmpty || _focus.hasFocus))
                          IconButton(
                            splashRadius: 14,
                            visualDensity: VisualDensity.compact,
                            onPressed: () {
                              setState(_controller.clear);
                              widget.onChanged?.call('');
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 16,
                            ),
                          ),
                        if (widget.suffix != null) widget.suffix!,
                      ],
                    )
                  : null,
              errorMaxLines: 3,
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            obscureText: _obscure,
            obscuringCharacter: '*',
            enabled: widget.enabled,
            style: getBodyTextStyle(context, MoonTextSize.size12),
            onChanged: (text) {
              if (widget.phoneInput) {
                // late PhoneNumber phoneParsed;
                // if (_controller.text.isEmpty || (_controller.value.text.length == 1 && _controller.value.text == '+')) {
                //   setState(() {
                //     error = null;
                //   });
                //   return;
                // }
                // if (_controller.value.text.length == 1 && _controller.value.text != '+') {
                //   phoneParsed = PhoneNumber.parse(_controller.value.text, callerCountry: IsoCode.RU);
                //   String newVal = '+${phoneParsed.countryCode}';
                //   _controller.value = TextEditingValue(
                //       text: newVal, selection: TextSelection(baseOffset: newVal.length, extentOffset: newVal.length));
                //   return;
                // }
                // try {
                //   phoneParsed = PhoneNumber.parse(_controller.value.text);
                //   if (phoneParsed.isValidLength(type: PhoneNumberType.mobile)) {
                //     widget.onChanged?.call(phoneParsed.international);
                //     final formattedNsn = phoneParsed.formatNsn(isoCode: phoneParsed.isoCode);
                //     String newVal = '+${phoneParsed.countryCode}$formattedNsn';
                //     _controller.value = TextEditingValue(
                //         text: newVal, selection: TextSelection(baseOffset: newVal.length, extentOffset: newVal.length));
                //   }else{
                //     widget.onChanged?.call('');
                //   }
                //   setState(() {
                //     error = null;
                //   });
                // } catch (e) {
                //   try {
                //     phoneParsed = PhoneNumber.parse(_controller.value.text);
                //     if (phoneParsed.isValidLength(type: PhoneNumberType.mobile)) {
                //       error = 'Некорректный номер телефона';
                //       setState(() {});
                //     }
                //   } catch (e) {
                //     error = 'Некорректный номер телефона';
                //     setState(() {});
                //   }
                // }
                // return;
              }
              if (widget.changeAfterSubmit) return;
              widget.onChanged?.call(text);
            },
            onTapOutside: (event) => _focus.unfocus(),
            onFieldSubmitted: (text) {
              if (!widget.changeAfterSubmit) return;
              widget.onChanged?.call(text);
            },
            maxLines: widget.multiline ? null : 1,
            minLines: widget.multiline ? null : 1,
            expands: widget.expands ?? widget.multiline,
            textAlignVertical: widget.multiline ? TextAlignVertical.top : TextAlignVertical.center,
          ),
        ),
      ],
    );
  }
}
