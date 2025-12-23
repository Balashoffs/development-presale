import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/data/core/string_converter.dart';
import 'package:presale/src/domain/models/v5/design/division_resource_table/divisions_with_resources_dto.dart';
import 'package:presale/src/presentation/modules/v5/design/common/collum_attributes.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_text_input.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/widget/custom_dropdown_with_search_widget.dart';

typedef ValueChangedWithContext<T> =
    void Function(BuildContext context, T value);

class CellDecorationWidget extends StatelessWidget {
  const CellDecorationWidget({
    super.key,
    this.isFistCell = false,
    required this.child,
  });

  final bool isFistCell;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: isFistCell
          ? BoxDecoration()
          : BoxDecoration(
              border: Border(
                left: Directionality.of(context) == TextDirection.ltr
                    ? Divider.createBorderSide(
                        context,
                        width: 1,
                      )
                    : BorderSide.none,
                right: Directionality.of(context) == TextDirection.rtl
                    ? Divider.createBorderSide(
                        context,
                        width: 1,
                      )
                    : BorderSide.none,
              ),
            ),
      child: child,
    );
  }
}

class HeaderCellWidget extends StatelessWidget {
  const HeaderCellWidget({super.key, required this.attribute});

  final CollumAttribute attribute;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          attribute.name,
          // style: context.moonTypography?.body.text14
        ),
        if (attribute.tooltip.isNotEmpty)
          InkWell(
            onTap: () {}, // Optional tap handler
            child: Tooltip(
              message: attribute.tooltip,
              child: Icon(MoonIcons.generic_info_16_light, size: 16.0),
            ),
          ),
      ],
    );
  }
}

class TextCellWidget extends StatelessWidget {
  const TextCellWidget({super.key, this.label});

  final dynamic label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        label.toString(),
        // style: context.moonTypography?.body.text16
      ),
    );
  }
}

class TextWithNotifier extends StatelessWidget {
  const TextWithNotifier({super.key, required this.vn});

  final ValueNotifier<double> vn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(8.0),
          child: ValueListenableBuilder<double>(
            valueListenable: vn,
            builder: (context, value, child) {
              return Text(
                textAlign: TextAlign.center,
                convertToRubleString(value, 0),
                // style: context.moonTypography?.body.text16
              );
            },
          ),
        ),
      ),
    );
  }
}

class IntInputCellWidget extends StatelessWidget {
  const IntInputCellWidget({
    super.key,
    required this.defaultValue,
    required this.onChanged,
    this.autoFocus = false,
  });

  final int defaultValue;
  final ValueChangedWithContext<int> onChanged;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 56,
        child: CustomTextInput(
          autofocus: autoFocus,
          key: super.key,
          isEnables: true,
          hintText: '$defaultValue',
          onChanged: (input) {
            int? parsed = onChangeIntValue(input);
            if (parsed != null) {
              onChanged(context, parsed);
            }
          },
          validator: onlyIntValidator,
        ),
      ),
    );
  }
}

class FloatInputCellWidget extends StatelessWidget {
  const FloatInputCellWidget({
    super.key,
    required this.defaultValue,
    required this.onChanged,
    this.autoFocus = false,
  });

  final double defaultValue;
  final ValueChangedWithContext<double> onChanged;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 56,
        child: CustomTextInput(
          autofocus: autoFocus,
          key: super.key,
          isEnables: true,
          hintText: '$defaultValue',
          onChanged: (input) {
            double? parsed = onChangeFactorValue(input);
            if (parsed != null) {
              onChanged(context, parsed);
            }
          },
          validator: onlyFactorValidator,
        ),
      ),
    );
  }
}

class ResourcesDropdownWidget extends StatelessWidget {
  const ResourcesDropdownWidget({
    super.key,
    required this.onChanged,
    required this.resources,
    required this.preloaded,
  });

  final ValueChangedWithContext<String> onChanged;
  final List<ResourceDTO> resources;
  final ResourceDTO preloaded;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResourceObjectDropDownSelector(
        onSelected: (p0) => onChanged(context, p0?.resourceName ?? ''),
        unloaded: resources,
        defaultValue: preloaded,
      ),
    );
  }
}

class CellWithIconWidget extends StatelessWidget {
  const CellWithIconWidget({super.key, required this.iconData, this.onTap});

  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Center(
        child: MoonButton.icon(icon: Icon(iconData), onTap: onTap),
      ),
    );
  }
}

class CellWithMultiLineWidget extends StatelessWidget {
  const CellWithMultiLineWidget({
    super.key,
    required this.label,
    required this.hint,
  });

  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        spacing: 4.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: Text(
              label,
              maxLines: 3,
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              // style: context.moonTypography?.body.text16
            ),
          ),
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: () {}, // Optional tap handler
              child: Tooltip(
                message: hint,
                child: Icon(MoonIcons.generic_info_16_light, size: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double? onChangeFactorValue(String? newValue) {
  if (newValue != null) {
    double? tryParse = newValue.length < 4 ? double.tryParse(newValue) : 0.0;
    if (tryParse != null) {
      return tryParse;
    }
  }
  return null;
}

int? onChangeIntValue(String? newValue) {
  if (newValue != null) {
    int? tryParse = newValue.length < 4 ? int.tryParse(newValue) : null;
    if (tryParse != null) {
      return tryParse;
    }
  }
  return null;
}
