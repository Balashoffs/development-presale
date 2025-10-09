import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/data/common/extensions/list.dart';
import 'package:presale/src/presentation/common/color_options.dart';

import 'package:presale/src/presentation/common/typography_page_options.dart';


class SimpleDropdownInput<T> extends StatefulWidget {
  const SimpleDropdownInput({
    super.key,
    this.menuAnchor = Alignment.topRight,
    this.childAnchor = Alignment.bottomRight,
    this.offset = Offset.zero,
    this.barrierColor,
    required this.onLoadItems,
    this.title,
    this.label,
    this.initialValue,
    this.onChanged,
    this.isNested = false,
    this.itemBuilder,
    this.labelBuilder,
    this.textColor,
    this.menuPadding,
    this.maxWidth,
    this.blank = false,
    required this.itemsStream,
  });

  final Alignment menuAnchor;
  final Alignment childAnchor;
  final Offset offset;
  final Color? barrierColor;
  final Function(String text) onLoadItems;
  final Stream<List<T>> itemsStream;
  final T? initialValue;
  final String? title;
  final String? label;
  final void Function(dynamic value)? onChanged;
  final bool isNested;
  final Widget Function(dynamic item, bool current)? itemBuilder;
  final String Function(
    dynamic item,
  )? labelBuilder;
  final Color? textColor;
  final EdgeInsets? menuPadding;
  final double? maxWidth;
  final bool blank;

  @override
  State<SimpleDropdownInput> createState() => _SimpleDropdownInputState();
}

class _SimpleDropdownInputState<T> extends State<SimpleDropdownInput<T>> with TickerProviderStateMixin {
  final ValueNotifier<bool> _opened = ValueNotifier(false);

  late ValueNotifier<T?> _currentValue;

  AnimationController? _animationController;
  late GlobalKey titleKey;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  bool top = false;

  @override
  void initState() {
    titleKey = LabeledGlobalKey('title');
    _currentValue = ValueNotifier(widget.initialValue);
    if (widget.initialValue != null) {
      _textEditingController.value = _textEditingController.value.copyWith(
          text: widget.labelBuilder?.call(_currentValue.value) ?? _currentValue.value.toString(),
          selection: TextSelection(
            baseOffset: (widget.labelBuilder?.call(_currentValue.value) ?? _currentValue.value.toString()).length,
            extentOffset: (widget.labelBuilder?.call(_currentValue.value) ?? _currentValue.value.toString()).length,
          ));
    }
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _open();
        widget.onLoadItems(_textEditingController.value.text);
      } else {
        _close();
      }
    });
    _currentValue.addListener(() {
      _textEditingController.value = _textEditingController.value.copyWith(
          text: widget.labelBuilder?.call(_currentValue.value) ?? _currentValue.value.toString(),
          selection: TextSelection(
            baseOffset: (widget.labelBuilder?.call(_currentValue.value) ?? _currentValue.value.toString()).length,
            extentOffset: (widget.labelBuilder?.call(_currentValue.value) ?? _currentValue.value.toString()).length,
          ));
    });
    super.initState();
  }

  void _open() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final Offset widgetPosition = renderBox.localToGlobal(Offset.zero);
      if (widgetPosition.dy < MediaQuery.of(context).size.height / 2) {
        top = false;
      } else {
        top = true;
      }
    }
    _opened.value = true;
    _animationController!.animateTo(1);
  }

  void _close() {
    _animationController!.animateTo(0).whenComplete(() => _opened.value = false);
  }

  double offsetForDrop() {
    if (widget.menuAnchor != Alignment.topRight &&
        widget.menuAnchor != Alignment.topLeft &&
        widget.childAnchor != Alignment.bottomRight &&
        widget.childAnchor != Alignment.bottomLeft) {
      return 0;
    }
    BuildContext? context = titleKey.currentContext;
    if (context == null) return 0;
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, opened, _) {
        return ValueListenableBuilder(
          builder: (context, currentValue, _) {
            return StreamBuilder<List<T>>(
                initialData: [],
                stream: widget.itemsStream,
                builder: (context, snapshot) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 200,
                    ),
                    child: TextFormField(
                      autofocus: false,
                      focusNode: _focusNode,
                      controller: _textEditingController,
                      // keyboardType: widget.inputType,
                      // inputFormatters: widget.inputFormatters,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                          isDense: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: widget.label,
                          errorText: null,
                          helperText: null,
                          helperMaxLines: 3,
                          helperStyle: getBodyTextStyle(context,  MoonTextSize.size10),
                          fillColor: getColor(context, MoonColor.bulma),
                          filled: false,
                          errorStyle: getBodyTextStyle(context,  MoonTextSize.size10),
                          // contentPadding: EdgeInsets.zero,
                          hoverColor: getColor(context, MoonColor.gohan),
                          labelStyle: getBodyTextStyle(context, MoonTextSize.size16),
                          suffixIcon: IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () {
                              if (opened) {
                                _close();
                              } else {
                                widget.onLoadItems(_textEditingController.value.text);
                                _open();
                              }
                            },
                            icon: Icon(
                              opened
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward_outlined,
                              size: 16,
                            ),
                          ),
                          errorMaxLines: 3,
                          alignLabelWithHint: true,
                          floatingLabelBehavior: FloatingLabelBehavior.auto),
                      obscureText: false,
                      obscuringCharacter: '*',
                      enabled: true,
                      style: getBodyTextStyle(context,  MoonTextSize.size12),
                      onChanged: (text) {
                        widget.onLoadItems(text);
                        // widget.onChanged?.call(text);
                      },
                      onTapOutside: (event) {
                        _focusNode.unfocus();
                      },
                      // onFieldSubmitted: widget.onSubmit,
                      maxLines: null,
                      expands: false,
                      keyboardType: TextInputType.multiline,
                      // textAlignVertical: widget.multiline ? TextAlignVertical.top : TextAlignVertical.center,
                    ),
                  );
                });
          },
          valueListenable: _currentValue,
        );
      },
      valueListenable: _opened,
    );
  }
}

class SimpleDropdownInputMenu<E> extends StatelessWidget {
  final List<E> items;
  final E? currentItem;
  final void Function(E value)? onChanged;
  final Widget Function(dynamic item, bool current)? itemBuilder;
  final EdgeInsets? padding;
  final double? maxWidth;

  const SimpleDropdownInputMenu({
    super.key,
    required this.items,
    this.currentItem,
    this.onChanged,
    this.itemBuilder,
    this.padding,
    this.maxWidth,
  });

  Widget _builder(
    E item,
    BuildContext context,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            item.toString(),
            style: getBodyTextStyle(context,  MoonTextSize.size16),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: items.isEmpty
            ? Center(
                child: Text(
                  'Ничего не найдено',
                  style: getBodyTextStyle(context, MoonTextSize.size14),
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  for (E item in items)
                    MoonButton(
                      onTap: () {
                        onChanged?.call(item);
                      },
                      leading: itemBuilder?.call(item, currentItem == item) ?? _builder(item, context),
                    )
                ].separate(Divider(
                  indent: 4,
                  endIndent: 4,
                  height: 1,
                  thickness: 1,
                  color: getColor(context, MoonColor.beerus),
                )),
              ),
      ),
    );
  }
}
