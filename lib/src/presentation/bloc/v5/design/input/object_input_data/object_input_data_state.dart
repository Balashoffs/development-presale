part of 'object_input_data_cubit.dart';


/*
SavedState
ErrorState
InitialState
LoadedState
 */
@freezed
abstract class ObjectInputDataState with _$ObjectInputDataState {
  const factory ObjectInputDataState.initial() = _Initial;
  const factory ObjectInputDataState.enterInputData() = _EnterInputData;
  const factory ObjectInputDataState.nextPage() = _NextPage;
  const factory ObjectInputDataState.errorMessage(String errorText) = _ErrorMessage;
}
