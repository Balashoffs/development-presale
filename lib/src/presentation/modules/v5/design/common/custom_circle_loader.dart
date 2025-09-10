import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class CustomCircleLoader extends StatelessWidget {
  const CustomCircleLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: MoonCircularLoader(
          circularLoaderSize: MoonCircularLoaderSize.md,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
