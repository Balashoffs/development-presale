part of 'user_login_cubit.dart';

@freezed
abstract class UserLoginState with _$UserLoginState {
  const factory UserLoginState({
    @Default(false) bool isFilled,
    @Default('') labelText,
  }) = _UserLoginState;
}
