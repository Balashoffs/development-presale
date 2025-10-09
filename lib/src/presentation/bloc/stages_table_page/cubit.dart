import 'package:presale/src/domain/models/v1/section/section.dart';
import 'package:presale/src/domain/models/v1/service_stage/service_stage.dart';
import 'package:presale/src/presentation/bloc/object_table_page/cubit.dart';
import 'package:presale/src/presentation/bloc/object_table_page/state/state.dart';
import 'package:presale/src/presentation/bloc/stages_table_page/state/state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';



class StagesTableCubit extends HydratedCubit<StagesTableState> {
  final ObjectTableCubit _objectTableCubit;
  ObjectTableState objectState = ObjectTableState();
  ServiceStage? _serviceStage;

  StagesTableCubit(
    this._objectTableCubit,
  ) : super(const StagesTableState()) {
    objectState = _objectTableCubit.state;
    _objectTableCubit.stream.listen((event) {
      objectState = event;
    });
  }

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
    emit(const StagesTableState());
  }

  void removeStage(int index) {
    var entities = [...state.entities];
    entities.removeAt(index);

    emit(state.copyWith(entities: entities));
  }

  void addStage(Section section) {
    double cost = 0;
    cost = 1 *
        (section.employee?.salaryInDay ?? 0) *
        objectState.profitNorm *
        objectState.distanceCoefficient *
        objectState.difficultyCoefficient *
        objectState.customerCoefficient *
        objectState.durationCoefficient *
        objectState.workDuration;

    StagesTableEntity newEntity = StagesTableEntity(
      section: section,
      sectionName: section.name,
      coefficient: 1,
      costInDay: (section.employee?.salaryInDay ?? 0 )*1,
      durationOfWork: objectState.workDuration,
      cost: cost,
    );
    

    emit(state.copyWith(entities: [
      ...state.entities,
      newEntity,
    ]));
  }

  void changeSectionCoefficient(double coef, int index){
    StagesTableEntity entity = state.entities[index];
    entity = entity.copyWith(
      coefficient: coef,
      costInDay: (entity.section?.employee?.salaryInDay ?? 0 )*coef,
      cost: (entity.section?.employee?.salaryInDay ?? 0 )*coef *
          objectState.profitNorm *
          objectState.distanceCoefficient *
          objectState.difficultyCoefficient *
          objectState.customerCoefficient *
          objectState.durationCoefficient *
          (entity.durationOfWork ?? 100),
    );
    var entities = [...state.entities];
    entities.removeAt(index);
    entities.insert(index, entity);
    emit(state.copyWith(entities: entities));
  }

  void changeSectionSalaryInDay(double value, int index){
    StagesTableEntity entity = state.entities[index];
    entity = entity.copyWith(
        costInDay: value,
      cost: value *
          objectState.profitNorm *
          objectState.distanceCoefficient *
          objectState.difficultyCoefficient *
          objectState.customerCoefficient *
          objectState.durationCoefficient *
          (entity.durationOfWork ?? 100),
    );
    var entities = [...state.entities];
    entities.removeAt(index);
    entities.insert(index, entity);
    emit(state.copyWith(entities: entities));
  }

  void changeSectionWorkDuration(int duration, int index){
    StagesTableEntity entity = state.entities[index];
    entity = entity.copyWith(
        durationOfWork: duration,
        cost: (entity.costInDay ?? 0) *
            objectState.profitNorm *
            objectState.distanceCoefficient *
            objectState.difficultyCoefficient *
            objectState.customerCoefficient *
            objectState.durationCoefficient *
            duration,
    );
    var entities = [...state.entities];
    entities.removeAt(index);
    entities.insert(index, entity);
    emit(state.copyWith(entities: entities));
  }

  void changeSectionCost(double value, int index){
    StagesTableEntity entity = state.entities[index];
    entity = entity.copyWith(
      cost: value,
    );
    var entities = [...state.entities];
    entities.removeAt(index);
    entities.insert(index, entity);
    emit(state.copyWith(entities: entities));
  }

  void changeSectionSection(Section section, int index){
    StagesTableEntity entity = state.entities[index];
    entity = entity.copyWith(
      section: section,
      sectionName: section.name,
      costInDay: (section.employee?.salaryInDay ?? 0 )*entity.coefficient,
      cost: (entity.costInDay ?? 0) *
          objectState.profitNorm *
          objectState.distanceCoefficient *
          objectState.difficultyCoefficient *
          objectState.customerCoefficient *
          objectState.durationCoefficient *
          (entity.durationOfWork ?? 0),
    );
    var entities = [...state.entities];
    entities.removeAt(index);
    entities.insert(index, entity);
    emit(state.copyWith(entities: entities));
  }

  int? get workSum {
    if (state.entities.isEmpty) return null;
    return state.entities.map((e) => e.durationOfWork).reduce((value, element) => (value ?? 0) + (element ?? 0));
  }

  double? get costSum {
    if (state.entities.isEmpty) return null;
    return state.entities.map((e) => e.cost).reduce((value, element) => (value ?? 0) + (element ?? 0));
  }

  void makeXlsx() {
    // ;
    // final data = ExcelClient.generateDiarySheet(state, objectState);
    //
    // final blob = html.Blob([data], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    // final url = html.Url.createObjectUrlFromBlob(blob);
    // final anchor = html.document.createElement('a') as html.AnchorElement
    //   ..href = url
    //   ..style.display = 'none'
    //   ..download = 'Отчет_${objectState.objectName ?? DateTime.now()}.xlsx';
    // anchor.click();
  }

  @override
  StagesTableState? fromJson(Map<String, dynamic> json) => StagesTableState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(StagesTableState state) => state.toJson();
}
