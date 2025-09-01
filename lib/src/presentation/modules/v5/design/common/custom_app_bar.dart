import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_design/moon_design.dart';

import 'package:presale/src/presentation/modules/service_type_select/navi/service_navi.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    required this.child,
  });

  final Widget? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          MoonButton.icon(
            icon: Icon(MoonIcons.controls_close_16_light),
            onTap: () {
              context.go(serviceTypeRoutePath);
            },
          ),
        ],
        title: title,
      ),
      body: child,
    );
  }
}

class TextCellWidget extends StatelessWidget {
  const TextCellWidget({
    super.key,
    required this.data,
    this.fontSize = 16.0,
    this.letterSpacing = 0.0,
  });

  final String data;
  final double fontSize;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: fontSize, letterSpacing: letterSpacing),
    );
  }
}
