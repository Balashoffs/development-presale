import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';


class RowMultiInputWidget extends StatelessWidget {
  final String firstRowLabel;
  final String secondRowLabel;
  final IconData secondRowIcon;
  final Widget thirdRowWidget;

  const RowMultiInputWidget({
    super.key,
    required this.firstRowLabel,
    required this.secondRowLabel,
    required this.secondRowIcon,
    required this.thirdRowWidget,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(4.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MoonMenuItem(
          width: 48,
          borderRadius: borderRadius,
          menuItemCrossAxisAlignment: CrossAxisAlignment.center,
          label: Text(
            firstRowLabel,
            style: getHeadingTextStyle(context, MoonTextSize.size32),
          ),
        ),
        MoonMenuItem(
          width: 256,
          borderRadius: borderRadius,
          menuItemCrossAxisAlignment: CrossAxisAlignment.center,
          label: Text(
            secondRowLabel,
            style: getHeadingTextStyle(context, MoonTextSize.size16),
          ),
          leading: MoonAvatar(
            borderRadius: borderRadius,
            backgroundColor: context.moonColors!.jiren,
            avatarSize: MoonAvatarSize.lg,
            content: Icon(secondRowIcon),
          ),
        ),
        thirdRowWidget,
      ],
    );
  }
}