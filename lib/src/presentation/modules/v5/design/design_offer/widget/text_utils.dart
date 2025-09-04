import 'package:flutter/material.dart';
import 'package:presale/src/presentation/common/color_options.dart';

TextStyle get labelStyle => TextStyle(fontSize: 16,decoration: TextDecoration.underline);
TextStyle contentStyle(BuildContext context) {
  return TextStyle(
    fontSize: 20,
    color: getColor(context, MoonColor.bulma),
  );
}