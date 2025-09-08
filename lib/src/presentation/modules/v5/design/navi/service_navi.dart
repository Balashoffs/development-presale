import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presale/src/presentation/core/navigation/app_page.dart';
import 'package:presale/src/presentation/core/navigation/validation_routes.dart';
import 'package:presale/src/presentation/modules/service_type_select/navi/service_navi.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/division_resorce_calculator_page.dart';
import 'package:presale/src/presentation/modules/v5/design/divisions_margin_calculate/divisions_margin_calculator_page.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/offer_page_with_table.dart';
import 'package:presale/src/presentation/modules/v5/design/object_data_input/object_input_data_page.dart';

const designInputRoutePath = "design-input";
const designInputRoute = "$serviceTypeRoutePath/$designInputRoutePath";
const designResourcesRoutePath = "design-resources";
const designResourcesRoute = "$designInputRoute/$designResourcesRoutePath";
const designDivisionsRoutePath = "design-divisions";
const designDivisionsRoute = "$designResourcesRoute/$designDivisionsRoutePath";
const designOfferRoutePath = "design-offer";
const designOfferRoute = "$designDivisionsRoute/$designOfferRoutePath";

class DesignInputRoute extends AuthNeedRoute {
  DesignInputRoute({
    String? path,
    String? name,
    super.builder,
    super.parentNavigatorKey,

    Page Function(BuildContext, GoRouterState)? pageBuilder,
    super.routes,
  }) : super(
         path: designInputRoutePath,
         name: name ?? (path ?? designInputRoutePath).toUpperCase(),
         pageBuilder: (context, state) => AppPage(child: InputDataPage(),),
         redirect: (context, state) {
           return null;
         },
       );
}

class DesignResourcesRoute extends AuthNeedRoute {
  DesignResourcesRoute({
    String? path,
    String? name,
    super.builder,
    Page Function(BuildContext, GoRouterState)? pageBuilder,
    super.parentNavigatorKey,
    super.routes,
  }) : super(
         path: designResourcesRoutePath,
         name: name ?? (path ?? designResourcesRoutePath).toUpperCase(),
         pageBuilder: (context, state) =>
             AppPage(child: DivisionResourceCalculatePage()),
         redirect: (context, state) {
           return null;
         },
       );
}

class DesignDivisionsRoute extends AuthNeedRoute {
  DesignDivisionsRoute({
    String? path,
    String? name,
    super.builder,
    Page Function(BuildContext, GoRouterState)? pageBuilder,
    super.parentNavigatorKey,
    super.routes,
  }) : super(
         path: designDivisionsRoutePath,
         name: name ?? (path ?? designDivisionsRoutePath).toUpperCase(),
         pageBuilder: (context, state) =>
             AppPage(child: DivisionsMarginCalculatePage()),
         redirect: (context, state) {
           return null;
         },
       );
}

class DesignOfferRoute extends AuthNeedRoute {
  DesignOfferRoute({
    String? path,
    String? name,
    super.builder,
    Page Function(BuildContext, GoRouterState)? pageBuilder,
    super.parentNavigatorKey,
    super.routes,
  }) : super(
         path: designOfferRoutePath,
         name: name ?? (path ?? designOfferRoutePath).toUpperCase(),
         pageBuilder: (context, state) => AppPage(child: DesignOfferPage()),
         redirect: (context, state) {
           return null;
         },
       );
}
