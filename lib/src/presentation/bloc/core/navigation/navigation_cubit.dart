import 'package:presale/src/presentation/bloc/core/core/repository_state.dart';
import 'package:presale/src/presentation/bloc/user/user_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:presale/src/presentation/core/navigation/app_router.dart';

part 'navigation_mode.dart';

class NavigationCubit extends HydratedCubit<NavigationMode> {
  final GoRouter _goRouter;

  NavigationCubit(
    UserRepository userRepository,
    this._goRouter,
  ) : super(NavigationMode.unauthorized) {
    userRepository.stream
        .distinct((previous, next) => previous.runtimeType == next.runtimeType)
        .listen((state) => _handleUserState(state, userRepository.fromPath));
  }

  void _handleUserState(RepositoryState userState, String? fromPath) {
    if (userState is UninitializedState || userState is FailureState) {
      if (fromPath != null) {
        emit(NavigationMode.unauthorized);
        _goRouter.go(fromPath);
        return;
      }
      setUnauthorizedMode();
    }
    if (userState is SuccessState) {
      if (fromPath == null) {
        setAuthorizedMode();
        return;
      }
      emit(NavigationMode.authorized);
      _goRouter.go(fromPath);
    }
  }

  void setUnauthorizedMode() {
    emit(NavigationMode.unauthorized);
    _goRouter.go(defaultUnauthorizedPath);
  }

  void setAuthorizedMode() {
    emit(NavigationMode.authorized);
    _goRouter.go(defaultAuthorizedPath);
  }

  String redirectBaseRoute() => state.route;

  String? redirectUnauthorizedRoute(String routePath) =>
      state.isUnauthorized ? null : state.route;

  String? redirectAuthorizedRoute(String routePath) =>
      state.isAuthorized ? null : state.route;

  @override
  NavigationMode? fromJson(Map<String, dynamic> json) {
    return NavigationMode.fromString(json['route']);
  }

  @override
  Map<String, dynamic>? toJson(NavigationMode state) {
    return {'route': state.route};
  }
}
