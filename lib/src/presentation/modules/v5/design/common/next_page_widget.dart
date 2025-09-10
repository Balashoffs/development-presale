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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MoonButton(
            buttonSize: MoonButtonSize.md,
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
          ),
        ],
      ),
    );
  }
}
