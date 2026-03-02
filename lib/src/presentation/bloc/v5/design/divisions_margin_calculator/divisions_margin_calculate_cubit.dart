import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/pojo_extension.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/design/divisions_margin_table/divisions_margin_summary_viewmodel.dart';
import 'package:presale/src/presentation/bloc/core/core/cubit_state_enum.dart';
import 'package:presale/src/domain/repository/v5/design/divsion_margin_repository.dart';

part 'divisions_margin_calculate_state.dart';

part 'divisions_margin_calculate_cubit.freezed.dart';

class DivisionsMarginCalculateCubit
    extends Cubit<DivisionsMarginCalculateState> {
  final DivisionsViewController _divisionsViewController;
  final DivisionsMarginRepository _repository;

  DivisionsViewController get controller => _divisionsViewController;

  DivisionsMarginCalculateCubit({required DependencyInjector di})
    : _divisionsViewController = DivisionsViewController(
        inputFactorsDTO: di.inMemoryImpl.inputDataDesignDTO!.inputFactors,
      ),
      _repository = DivisionsMarginRepository(di),
      super(const DivisionsMarginCalculateState()) {
    _init();
  }

  void _init() async {
    List<DivisionsMarginDTO> divisions = _repository.getDivisionMargins();
    _repository.updates(divisions);
    _divisionsViewController.fill(divisions);

    emit(DivisionsMarginCalculateState(stateEnum: StateEnum.showing));
  }

  void onOverPriceFactor(int id, double value) {
    final updated = _divisionsViewController.onOverPriceFactor(id, value);
    if (updated != null) {
      final dto = updated.toDto();
      _repository.update(dto);
    }
  }

  void onMarginFactor(int id, double value) {
    final updated = _divisionsViewController.onMarginFactor(id, value);
    if (updated != null) {
      final dto = updated.toDto();
      _repository.update(dto);
    }
  }

  void onClientFactor(int id, double value) {
    final updated = _divisionsViewController.onClientFactor(id, value);
    if (updated != null) {
      final dto = updated.toDto();
      _repository.update(dto);
    }
  }
}
