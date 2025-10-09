import 'package:presale/src/presentation/common/skeletons/core/shimmer.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  final bool isLoading;
  final Widget? skeleton;
  final Widget child;
  final Duration swapDuration;
  final bool sameWidget;

  const Skeleton({
    super.key,
    required this.isLoading,
    this.skeleton,
    required this.child,
    this.swapDuration = const Duration(milliseconds: 250),
    this.sameWidget = false,
  });

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  late ValueNotifier<bool> _loading;

  @override
  void initState() {
    super.initState();
    _loading = ValueNotifier(widget.isLoading);
  }

  @override
  void didUpdateWidget(Skeleton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loading.value = widget.isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _loading,
        builder: (context, loading, _) {
          return AnimatedSwitcher(
            duration: widget.swapDuration,
            reverseDuration: const Duration(milliseconds: 200),
            switchInCurve: Curves.easeInOutCubic,
            switchOutCurve: Curves.easeInOutCubic,
            child: loading
                ? SizedBox(
                    key: ValueKey('first_skeleton'),
                    child: ShimmerWidget(
                      child: ShimmerWidget(
                        child: _SkeletonWidget(
                          isLoading: widget.isLoading,
                          skeleton: widget.skeleton ?? widget.child,
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    key: ValueKey('second_skeleton'),
                    child: widget.child,
                  ),
          );
        });
  }
}

class _SkeletonWidget extends StatefulWidget {
  const _SkeletonWidget({
    required this.isLoading,
    required this.skeleton,
  });

  final bool isLoading;
  final Widget skeleton;

  @override
  _SkeletonWidgetState createState() => _SkeletonWidgetState();
}

class _SkeletonWidgetState extends State<_SkeletonWidget> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      return const SizedBox();
    }
    // final color = shimmer.currentColor;
    final shimmerSize = shimmer.size;
    final gradient = shimmer.currentGradient;

    if (context.findRenderObject() == null) return const SizedBox();

    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.skeleton,
    );

    // return ShaderMask(
    //   blendMode: BlendMode.srcATop,
    //   shaderCallback: (bounds) {
    //     return LinearGradient(
    //       colors: [
    //         color,
    //         color,
    //       ]
    //     ).createShader(bounds);
    //   },
    //   child: widget.skeleton,
    // );
  }
}
