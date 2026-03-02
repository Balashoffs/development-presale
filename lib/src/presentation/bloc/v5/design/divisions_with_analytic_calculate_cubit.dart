import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/design/divisions_table_with_analytic/divisions_with_analytic_summary_viewmodel.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/repository/v5/design/divsions_with_analytic_repository.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';

part 'divisions_with_analytic_calculate_state.dart';

part 'divisions_with_analytic_calculate_cubit.freezed.dart';

class DivisionsWithAnalyticCalculateCubit
    extends Cubit<DivisionsWithAnalyticCalculateState> {
  final DivisionsWithAnalyticViewController _divisionsViewController;
  final DivisionsWithAnalyticRepository _repository;

  DivisionsWithAnalyticViewController get controller =>
      _divisionsViewController;

  DivisionsWithAnalyticCalculateCubit({required DependencyInjector di})
      : _divisionsViewController = DivisionsWithAnalyticViewController(),
        _repository = DivisionsWithAnalyticRepository(di),
        super(const DivisionsWithAnalyticCalculateState()) {
    _init();
  }

  void _init() async {
    List<DivisionsWithAnalyticDTO> divisions = await _repository
        .getDivisionsWithAnalytic();
    _divisionsViewController.fill(divisions);

    emit(DivisionsWithAnalyticCalculateState(stateEnum: StateEnum.showing));
  }

  void onResult(int id, double value) async {
    _divisionsViewController.onResult(id, value);
    _repository.updateDivisionWithAnalytic(id, value);
  }

  void onBack() {
    List<DivisionsWithAnalyticDTO> forSave = _divisionsViewController.rows.map((e) =>
        DivisionsWithAnalyticDTO(id: e.id,
            shifr: e.shifr,
            section: e.section,
            humanHours: e.humanHours,
            localAnalytic: e.localAnalytic,
            outsideAnalytic: e.outsideAnalytic,
            result: e.result),).toList();
    _repository.save(forSave);
  }
}
