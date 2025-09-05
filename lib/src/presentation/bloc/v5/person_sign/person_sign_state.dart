part of 'person_sign_cubit.dart';

@freezed
abstract class PersonSignState with _$PersonSignState {
  const factory PersonSignState({
    @Default(false) bool isFilled,
    @Default('') labelText,
  }) = _PersonSignState;
}
