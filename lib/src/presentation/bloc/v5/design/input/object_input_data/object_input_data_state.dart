part of 'object_input_data_cubit.dart';


/*
SavedState
ErrorState
InitialState
LoadedState
 */
@freezed
abstract class ObjectInputDataState with _$ObjectInputDataState {
  const factory ObjectInputDataState({
    @Default(StateEnum.loading) StateEnum stateEnum,
}) = _ObjectInputDataState;

}
