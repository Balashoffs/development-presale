import 'package:presale/src/data/clients/v1/employee_client.dart';
import 'package:presale/src/domain/models/v1/employee/employee.dart';
import 'package:presale/src/presentation/bloc/core/core/bloc_mixin.dart';
import 'package:presale/src/presentation/bloc/core/core/repository_state.dart';

typedef EmployeeRepositoryState = RepositoryState<List<Employee>>;

class EmployeeRepository extends Repository<List<Employee>> with StateMixin {
  final EmployeeClient _client;
  bool canLoadMore;
  bool loading;

  EmployeeRepository(this._client)
    :
      canLoadMore = true,
      loading = false,
      super(const UninitializedState());


  void load({bool add = false, bool reload = true, bool update = false}) async {
    // if (!(_reload ?? reload) && model != null) return;
    if (!add) loading = true;
    setLoadingState();
    _client.getEmployees().then(
      (successOrFailure) => successOrFailure.fold(
        (failure) {
          setFailureState(failure);
        },
        (employees) {
          // canLoadMore = employees.length == _count;
          emit(SuccessState(employees));
          loading = false;
        },
      ),
    );
  }
}
