import 'package:presale/src/presentation/core/navigation/validation_routes.dart';

enum ViewerTab {
  employees,
  stages;

  const ViewerTab();

  String title() {
    switch (this) {
      case ViewerTab.employees:
        return 'Сотрудники';
      case ViewerTab.stages:
        return 'Стадии';
    }
  }
}

class ViewerNestedRoute extends AuthNeedRoute {
  final ViewerTab tab;

  ViewerNestedRoute({
    required super.path,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.routes,
    required this.tab,
  });
}