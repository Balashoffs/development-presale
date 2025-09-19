import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.iconData,
    this.text,
  });

  final String? text;
  final VoidCallback? onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return MoonButton(
      buttonSize: MoonButtonSize.lg,
      onTap: onTap,
      trailing: Icon(iconData),
      showBorder: true,
      label: text != null
          ? Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            )
          : null,
    );
  }
}
