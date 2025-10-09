import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';


class RowInputWidget extends StatelessWidget {
  final String secondRowLabel;
  final IconData secondRowIcon;
  final Widget thirdRowWidget;

  const RowInputWidget({
    super.key,
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
          width: 256,
          borderRadius: borderRadius,
          menuItemCrossAxisAlignment: CrossAxisAlignment.center,
          label: Text(
            secondRowLabel,
            style: getHeadingTextStyle(context, MoonTextSize.size16),
          ),
          leading: MoonAvatar(
            borderRadius: borderRadius,
            avatarSize: MoonAvatarSize.lg,
            content: Icon(secondRowIcon),
          ),
        ),
        thirdRowWidget,
      ],
    );
  }
}