import 'package:presale/src/di/di.dart';
import 'package:presale/src/presentation/bloc/auth/auth_cubit.dart';
import 'package:presale/src/presentation/core/navigation/validation_routes.dart';
import 'package:presale/src/presentation/modules/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// const loginRoutePath = "/service-type-select/offer-preview/design-input";
const loginRoutePath = "/login";

class LoginRoute extends NoAuthNeedRoute {
  LoginRoute({
    String? path,
    String? name,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.routes,
  }) : super(
          path: path ?? loginRoutePath,
          name: name ?? (path ?? loginRoutePath).toUpperCase(),
          builder: (context, _) => AuthPage(
            onPasswordChanged: (value) => _authCubit(context).changePassword(value),
            onConfirmed: () => _authCubit(context).confirm(
              () {
                di.userRepository.login();
              },
            ),
            loadingStream: _authCubit(context)
                .stream
                .distinct((p, n) => p.formStage == n.formStage)
                .map((element) => element.formStage.isLoading),
            errorStream: _authCubit(context)
                .stream
                .distinct((p, n) => p.formError == n.formError)
                .map((element) => element.formError),
          ),
        );

  static AuthCubit _authCubit(BuildContext context) => BlocProvider.of<AuthCubit>(context);
}
