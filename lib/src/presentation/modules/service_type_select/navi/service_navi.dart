import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v1/service_stage/service_stage.dart';
import 'package:presale/src/domain/models/v1/service_type/service_type.dart';
import 'package:presale/src/presentation/core/navigation/app_page.dart';
import 'package:presale/src/presentation/core/navigation/app_routes.dart';
import 'package:presale/src/presentation/core/navigation/validation_routes.dart';
import 'package:presale/src/presentation/modules/service_type_select/object_table/object_table_page.dart';
import 'package:presale/src/presentation/modules/service_type_select/service_type_select_page.dart';
import 'package:presale/src/presentation/modules/service_type_select/stage_select/stage_select_page.dart';
import 'package:presale/src/presentation/modules/service_type_select/stages_table/stages_table_page.dart';
import 'package:presale/src/presentation/modules/v5/design/object_data_input/object_input_data_page.dart';

const serviceTypeRoutePath = "/";
const stageSelectRoutePath = "stage-select";
const objectTableRoutePath = "object-table";
const stagesTableRoutePath = "stages-table";

class ServiceTypeSelectRoute extends GoRoute {
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
