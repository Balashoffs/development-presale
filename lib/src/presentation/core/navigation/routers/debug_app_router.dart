import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:presale/src/presentation/core/navigation/not_found_page.dart';
import 'package:presale/src/presentation/modules/auth/navi/auth_navi.dart';
import 'package:presale/src/presentation/modules/service_type_select/navi/service_navi.dart';
import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';
import 'package:presale/src/presentation/modules/v5/user_login/navi/service_navi.dart';

final appRouterDebug = GoRouter(
  routes: [
    ServiceTypeSelectRoute(
      routes: [
        DesignInputRoute(
          routes: [
            DesignResourcesRoute(
              routes: [
                DesignDivisionsRoute(routes: [DesignOfferRoute(routes: [])]),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
  initialLocation: serviceTypeRoutePath,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const NotFoundPage(),
  redirect: (context, state) {
    return null;
  },
);
