import 'package:flutter/material.dart';

typedef TransitionAnimationBuilder = Widget Function(
  BuildContext,
  Animation<double>,
  Animation<double>,
  Widget,
);

class AppPage<T> extends Page<T> {
  final int transitionDuration, reverseTransitionDuration;
  final TransitionAnimationBuilder? animationBuilder;
  final Widget child;

  const AppPage({
    required this.child,
    this.transitionDuration = 200,
    this.reverseTransitionDuration = 200,
    this.animationBuilder,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => PageRouteBuilder(
        settings: this,
        transitionDuration: Duration(milliseconds: transitionDuration),
        reverseTransitionDuration:
            Duration(milliseconds: reverseTransitionDuration),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) =>
            animationBuilder?.call(
              context,
              animation,
              secondaryAnimation,
              child,
            ) ??
            _defaultAnimationBuilder(
              context,
              animation,
              secondaryAnimation,
              child,
            ),
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> animation2,
        ) =>
            child,
      );

  Widget _defaultAnimationBuilder(
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) =>
      FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
        child: child,
      );

  @override
  String toString() => 'AppPage{child: $child}';
}
