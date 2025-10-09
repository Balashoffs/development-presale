import 'package:presale/src/domain/models/v1/service_stage/service_stage.dart';
import 'package:presale/src/presentation/bloc/object_table_page/state/state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ObjectTableCubit extends HydratedCubit<ObjectTableState> {
  ServiceStage? _serviceStage;

  ObjectTableCubit() : super(const ObjectTableState());

  void setServiceStage(ServiceStage stage){

    if (_serviceStage == null) {
      _serviceStage = stage;
      return;
    }
    if (_serviceStage != stage){
      clean();
      _serviceStage = stage;
    }
  }

  void clean() {
    clear();
    emit(const ObjectTableState());
  }

  void changeName(String value) {
    emit(state.copyWith(objectName: value));
  }

  void changeAddress(String value) {
    emit(state.copyWith(address: value));
  }

  void changeSquare(double value) {
    emit(state.copyWith(square: value));
  }

  void changeWorkDuration(int value) {
    emit(state.copyWith(workDuration: value));
  }

  void changeProfitNorm(double value) {
    emit(state.copyWith(profitNorm: value));
  }

  void changeDistance(double value) {
    emit(state.copyWith(distanceCoefficient: value));
  }

  void changeDuration(double value) {
    emit(state.copyWith(durationCoefficient: value));
  }

  void changeCustomer(double value) {
    emit(state.copyWith(customerCoefficient: value));
  }

  void changeDifficulty(double value) {
    emit(state.copyWith(difficultyCoefficient: value));
  }

  @override
  ObjectTableState? fromJson(Map<String, dynamic> json) => ObjectTableState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ObjectTableState state) => state.toJson();

}