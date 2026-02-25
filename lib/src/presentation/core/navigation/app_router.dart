import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presale/src/presentation/core/navigation/base_route.dart';
import 'package:presale/src/presentation/core/navigation/not_found_page.dart';
import 'package:presale/src/presentation/modules/auth/navi/auth_navi.dart';
import 'package:presale/src/presentation/modules/service_type_select/navi/service_navi.dart';
import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';
import 'package:presale/src/presentation/modules/v6/design/navi/service_navi.dart';

const String defaultUnauthorizedPath = loginRoutePath;
const String defaultAuthorizedPath = serviceTypeRoutePath;


class AppRouter extends GoRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  AppRouter()
      : super.routingConfig(

    routingConfig: _ConstantRoutingConfig(

      RoutingConfig(
        routes: [
          BaseRoute(parentNavigatorKey: _rootNavigatorKey),
          LoginRoute(parentNavigatorKey: _rootNavigatorKey),
          ServiceTypeSelectRoute(
            parentNavigatorKey: _rootNavigatorKey,
            routes: [
              OfferPreviewRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  routes: [
                    DesignInputRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      routes: [
                        DesignResourcesRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          routes: [
                            DivisionsWithAnalyticRoute(
                              parentNavigatorKey: _rootNavigatorKey,
                              routes: [DesignOfferRoute(routes: [])],
                            ),
                            // DesignDivisionsRoute(
                            //   parentNavigatorKey: _rootNavigatorKey,
                            //   routes: [DesignOfferRoute(routes: [])],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
              )
            ],
          ),
        ],
        redirect: (context, state) {
          return null;
        },
      ),
    ),
    navigatorKey: _rootNavigatorKey,
    initialLocation: defaultUnauthorizedPath,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}

class _ConstantRoutingConfig extends ValueListenable<RoutingConfig> {
  const _ConstantRoutingConfig(this.value);

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}
  @override
  final RoutingConfig value;
}
