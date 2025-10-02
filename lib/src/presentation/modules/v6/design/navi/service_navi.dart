import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presale/src/presentation/core/navigation/app_page.dart';
import 'package:presale/src/presentation/core/navigation/validation_routes.dart';
import 'package:presale/src/presentation/modules/service_type_select/navi/service_navi.dart';
import 'package:presale/src/presentation/modules/v5/design/division_resource_calculate/division_resorce_calculator_page.dart';
import 'package:presale/src/presentation/modules/v5/design/divisions_margin_calculate/divisions_margin_calculator_page.dart';
import 'package:presale/src/presentation/modules/v5/design/design_offer/offer_page_with_table.dart';
import 'package:presale/src/presentation/modules/v5/design/object_data_input/object_input_data_page.dart';
import 'package:presale/src/presentation/modules/v6/design/offer_preview_page.dart';

const offerPreviewRoutePath = "offer-preview";
const offerPreviewRoute = "$serviceTypeRoutePath/$offerPreviewRoutePath";

class OfferPreviewRoute extends AuthNeedRoute {
  OfferPreviewRoute({
    String? path,
    String? name,
    super.builder,
    super.parentNavigatorKey,

    Page Function(BuildContext, GoRouterState)? pageBuilder,
    super.routes,
  }) : super(
         path: offerPreviewRoutePath,
         name: name ?? (path ?? offerPreviewRoutePath).toUpperCase(),
         pageBuilder: (context, state) => AppPage(child: OfferPreviewPage(),),
         redirect: (context, state) {
           return null;
         },
       );
}
