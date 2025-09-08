import 'package:presale/src/di/di.dart';
import 'package:presale/src/presentation/bloc/auth/state/auth_state.dart';
import 'package:presale/src/domain/core/voidcallback.dart';
import 'package:presale/src/presentation/bloc/core/core/form_stage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit(
      ) : super(const AuthState());

  void changePassword(String value) {
    emit(state.copyWith(password: value));
  }

  void confirm(VoidCallback onSuccess) {
    if (state.formStage.isLoading) return;
    if (state.password?.isEmpty ?? true) {
      emit(state.copyWith(formError: 'Обязательное поле'));
      return;
    }
    emit(state.copyWith(formStage: FormStage.loading));

    if (state.password == di.dartDefineModel.user){
      emit(state.copyWith(
        formStage: FormStage.common,
        formError: null,
      ));
      onSuccess();
    }else{
      emit(state.copyWith(formError: 'Неверный пароль', formStage: FormStage.failed));
    }
  }
}
