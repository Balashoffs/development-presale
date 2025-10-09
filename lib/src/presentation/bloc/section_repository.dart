import 'package:presale/src/data/clients/v1/employee_client.dart';
import 'package:presale/src/data/clients/v1/section_client.dart';
import 'package:presale/src/domain/models/v1/employee/employee.dart';
import 'package:presale/src/domain/models/v1/section/section.dart';
import 'package:presale/src/presentation/bloc/core/core/bloc_mixin.dart';
import 'package:presale/src/presentation/bloc/core/core/repository_state.dart';

typedef SectionRepositoryState = RepositoryState<List<Section>>;

class SectionRepository extends Repository<List<Section>> with StateMixin {
  final SectionClient _client;
  final EmployeeClient _employeeClient;
  bool canLoadMore;
  bool loading;

  SectionRepository(this._client, this._employeeClient)
    :
      canLoadMore = true,
      loading = false,
      super(const UninitializedState());

  void loadMore() {
    if (isLoadingState) return;
    load(add: true, reload: false);
  }


  void load({bool add = false, bool reload = true, bool update = false}) async {
    // if (!(_reload ?? reload) && model != null) return;
    if (!add) loading = true;
    setLoadingState();
    Map<String, Employee>? employeesMap;
    final emp = await _employeeClient.getEmployeesMap();
    emp.fold((l) => null, (r) => employeesMap = r);
    _client
        .getSections(employeesMap)
        .then(
          (successOrFailure) => successOrFailure.fold(
            (failure) {
              setFailureState(failure);
            },
            (sections) {
              sections = sections
                  .map((e) => e.loadEmployee(employeesMap))
                  .toList();
              // canLoadMore = sections.length == _count;
              emit(SuccessState(sections));
              loading = false;
            },
          ),
        );
  }
}
