import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:presale/src/presentation/core/navigation/app_page.dart';
import 'package:presale/src/presentation/core/navigation/validation_routes.dart';
import 'package:presale/src/presentation/modules/service_type_select/service_type_select_page.dart';

const serviceTypeRoutePath = "/service-type-select";
const stageSelectRoutePath = "stage-select";
const objectTableRoutePath = "object-table";
const stagesTableRoutePath = "stages-table";

class ServiceTypeSelectRoute extends AuthNeedRoute {
  ServiceTypeSelectRoute({
    String? path,
    String? name,
    super.builder,
    Page Function(BuildContext, GoRouterState)? pageBuilder,
    super.parentNavigatorKey,
    super.routes,
  }) : super(
          path: path ?? serviceTypeRoutePath,
          name: name ?? (path ?? serviceTypeRoutePath).toUpperCase(),
          pageBuilder: (context, state) => AppPage(child: ServiceTypeSelectPage()),
        );
}
