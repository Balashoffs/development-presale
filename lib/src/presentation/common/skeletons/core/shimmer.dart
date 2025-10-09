import 'package:presale/src/presentation/common/skeletons/skeleton_theme.dart';
import 'package:flutter/material.dart';

class ShimmerWidget extends StatefulWidget {
  final Widget? child;
  final Duration? duration;
  final SkeletonColorTween? lightColorTween;
  final SkeletonColorTween? darkColorTween;
  final LinearGradient? shimmerGradient;
  final LinearGradient? darkShimmerGradient;
  final ThemeMode? themeMode;

  const ShimmerWidget({
    super.key,
    this.child,
    this.duration,
    this.lightColorTween,
    this.darkColorTween,
    this.shimmerGradient,
    this.darkShimmerGradient,
    this.themeMode,
  });

  @override
  State<ShimmerWidget> createState() => ShimmerWidgetState();
}

class ShimmerWidgetState extends State<ShimmerWidget> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Color?>? animation;
  AnimationController? _shimmerController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bool light = Theme.of(context).brightness == Brightness.light;
    SkeletonColorTween? colorTween = light
        ? SkeletonTheme.of(context)?.light ?? widget.lightColorTween
        : SkeletonTheme.of(context)?.dark ?? widget.darkColorTween;
    Color first = colorTween?.firstColor ?? Theme.of(context).colorScheme.surface;
    Color second = colorTween?.secondColor ?? Theme.of(context).colorScheme.onSurface;

    if (!mounted) {
      return;
    }
    _animationController ??= AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    animation ??= ColorTween(begin: first, end: second).animate(_animationController!);
    _shimmerController ??= AnimationController.unbounded(vsync: this)
      ..repeat(
          min: -2.0,
          max: 2,
          period: widget.duration ?? const Duration(milliseconds: 1000));
  }

  ThemeMode get _appThemeMode => Theme.of(context).brightness == Brightness.dark
      ? ThemeMode.dark
      : ThemeMode.light;

  LinearGradient get gradient => ((widget.themeMode ??
      SkeletonTheme.of(context)?.themeMode ??
      _appThemeMode) ==
      ThemeMode.dark)
      ? _darkGradient
      : _lightGradient;

  LinearGradient get _lightGradient =>
      widget.shimmerGradient ??
          SkeletonTheme.of(context)?.shimmerGradient ??
          SHIMMER_GRADIENT;

  LinearGradient get _darkGradient =>
      widget.darkShimmerGradient ??
          SkeletonTheme.of(context)?.darkShimmerGradient ??
          DARK_SHIMMER_GRADIENT;

  Color get currentColor => animation!.value ?? Colors.red;

  LinearGradient get currentGradient => LinearGradient(
    colors: gradient.colors,
    stops: gradient.stops,
    begin: gradient.begin,
    end: gradient.end,
    transform:
    _SlidingGradientTransform(slidePercent: _shimmerController!.value),
  );

  bool get isSized => context.findRenderObject() != null ? (context.findRenderObject() as RenderBox).hasSize : false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    if (descendant.attached) {
      return descendant.localToGlobal(offset, ancestor: shimmerBox);
    }
    return Offset.zero;
  }

  Listenable get colorChanges => _animationController!;

  Listenable get shimmerChanges => _shimmerController!;

  @override
  Widget build(BuildContext context) {
    if (widget.child == null) return const SizedBox();
    return Shimmer(
      shimmer: this,
      child: widget.child!,
    );
  }

  @override
  void dispose() {
    _animationController?.stop();
    _shimmerController?.stop();
    _animationController?.dispose();
    _shimmerController?.dispose();
    super.dispose();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class Shimmer extends InheritedWidget {
  final ShimmerWidgetState shimmer;

  const Shimmer({
    super.key,
    required super.child,
    required this.shimmer,
  });

  static ShimmerWidgetState? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Shimmer>()?.shimmer;

  @override
  bool updateShouldNotify(Shimmer oldWidget) => shimmer != oldWidget.shimmer;
}
