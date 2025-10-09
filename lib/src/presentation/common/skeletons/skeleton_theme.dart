import 'package:flutter/material.dart';

const SHIMMER_GRADIENT = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFD6D6E4),
    Color(0xFFD1D1DF),
    Color(0xFFD6D6E4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.0,
    0.3,
    0.5,
    0.7,
    1,
  ],
  begin: Alignment(-2.4, -0.2),
  end: Alignment(2.4, 0.2),
  tileMode: TileMode.clamp,
);

const DARK_SHIMMER_GRADIENT = LinearGradient(
  colors: [
    Color(0xFF222222),
    Color(0xFF242424),
    Color(0xFF2B2B2B),
    Color(0xFF242424),
    Color(0xFF222222),
  ],
  stops: [
    0.0,
    0.2,
    0.5,
    0.8,
    1,
  ],
  begin: Alignment(-2.4, -0.2),
  end: Alignment(2.4, 0.2),
  tileMode: TileMode.clamp,
);

class SkeletonColorTween{
  final Color firstColor;
  final Color secondColor;

  const SkeletonColorTween(this.firstColor, this.secondColor);
}

class SkeletonTheme extends InheritedWidget {
  final SkeletonColorTween? light;
  final SkeletonColorTween? dark;
  final LinearGradient? shimmerGradient;
  final LinearGradient? darkShimmerGradient;
  final ThemeMode? themeMode;

  const SkeletonTheme({
    super.key,
    this.light,
    this.dark,
    this.shimmerGradient,
    this.darkShimmerGradient,
    this.themeMode,
    required super.child,
  });

  static SkeletonTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SkeletonTheme>();
  }

  @override
  bool updateShouldNotify(SkeletonTheme oldWidget) {
    return light != oldWidget.light ||
        dark != oldWidget.dark || themeMode!=oldWidget.themeMode;
  }
}
