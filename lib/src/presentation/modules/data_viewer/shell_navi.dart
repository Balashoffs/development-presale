import 'package:presale/src/presentation/core/navigation/nested_route.dart';
import 'package:presale/src/presentation/modules/data_viewer/viewer_info.dart';
import 'package:presale/src/presentation/modules/data_viewer/viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewerShellRoute extends StatefulShellRoute {
  ViewerShellRoute({
    required List<RouteBase> nestedRoutes,
  }) : super.indexedStack(
    builder: (context, state, shell) {
      return ViewerPage(
        // key: ValueKey(state.model),
        tabs: _routesToPaths(
          routes: nestedRoutes,
        ),
        // tabStack: _navigatorPagesFromWidget(child),
        // onChangeTab: (location) => context.go(location),
        getLocationOfContext: () => state.matchedLocation,
        shell: shell,
      );
    },
    branches: _routesToBranches(routes: nestedRoutes),
  );

  static List<ViewerTabInfo> _routesToPaths({
    required List<RouteBase> routes,
  }) {
    final paths = List<ViewerTabInfo>.empty(growable: true);

    for (var route in routes) {
      if (route is ViewerNestedRoute) {
        paths.add(ViewerTabInfo(path: route.path, info: route.tab));
      }
    }
    return paths;
  }

  static List<StatefulShellBranch> _routesToBranches({
    required List<RouteBase> routes,
  }) {
    final paths = List<StatefulShellBranch>.empty(growable: true);

    for (var route in routes) {
      if (route is ViewerNestedRoute) {
        paths.add(StatefulShellBranch(
          routes: [route],
          navigatorKey: LabeledGlobalKey(route.tab.index.toString()),
          // restorationScopeId: route.tab.index.toString(),
        ));
      }
      // else if (route is HomeShellNestedRoute) {
      //   paths.add(StatefulShellBranch(
      //     routes: [route],
      //     navigatorKey: LabeledGlobalKey(route.homeTab.index.toString()),
      //     // restorationScopeId: route.tab.index.toString(),
      //   ));
      // }
    }
    return paths;
  }

  static List<Page<dynamic>> _navigatorPagesFromWidget(Widget widget) =>
      ((widget as HeroControllerScope).child as Navigator).pages;
}
