import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/domain/models/v5/design/design_offer_result/division_summary_viewmodel.dart';
import 'package:presale/src/presentation/common/color_options.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_text_input.dart';
import 'package:presale/src/presentation/modules/v5/design/common/text_input_validators.dart';

class FormattedTextWidget extends StatelessWidget {
  const FormattedTextWidget({
    super.key,
    required this.fontSize,
    required this.type,
    required this.value,
  });

  final ResultType type;
  final String value;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(8.0),
      child: Text(
        textAlign: TextAlign.center,
        getViewText(type, value),
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}

class AvanceInputWidget extends StatelessWidget {
  const AvanceInputWidget({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 196,
      child: CustomTextInput(
        isEnables: true,
        hintText: '0',
        onChanged: onChanged,
        validator: ananceValidator,
      ),
    );
    ;
  }
}

class HeaderCellWidget extends StatelessWidget {
  const HeaderCellWidget({
    super.key,
    required this.title,
    required this.value,
    required this.width,
  });

  final String title;
  final String value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MoonMenuItem(
      width: width,
      label: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          color: getColor(context, MoonColor.trunks),
          decoration: TextDecoration.underline,
        ),
      ),
      content: Text(
        value,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16,
          color: getColor(context, MoonColor.popo),
        ),
      ),
    );
  }
}

class HeaderAreaWidget extends StatelessWidget {
  const HeaderAreaWidget({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return MoonMenuItem(
      label: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 14,
            color: getColor(context, MoonColor.trunks),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      content: MoonTextArea(
        hintText: value,
        expands: true,
        readOnly: true,
        textAlign: TextAlign.start,
        textStyle: TextStyle(
          fontSize: 16,
          color: getColor(context, MoonColor.popo),
        ),
      ),
    );
  }
}

class HeaderEditableWidget extends StatelessWidget {
  const HeaderEditableWidget({super.key, required this.editbledWidget});

  final List<Widget> editbledWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 16.0,
        mainAxisAlignment: MainAxisAlignment.start,
        children: MoonMenuItem.divideMenuItems(
          context: context,
          menuItems: editbledWidget,
        ).toList(),
      ),
    );
  }
}
