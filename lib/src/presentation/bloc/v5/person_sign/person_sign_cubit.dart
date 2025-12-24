import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sing_repository.dart';
import 'package:presale/src/presentation/modules/v5/design/common/person_sign/person_sign_validator.dart';

part 'person_sign_state.dart';

part 'person_sign_cubit.freezed.dart';

final String _addDataText = 'Ввести данные о контактном лице';
final String _signTemplateText = 'Составил: ';

class PersonSignCubit extends Cubit<PersonSignState> {
  final PersonSignTextInputValidator textGroupController;
  final PersonSingRepository _personSingRepository;

  PersonSignCubit({
    required DependencyInjector di,
    required PersonSingRepository personRepository,
  }) : textGroupController = PersonSignTextInputValidator(),
       _personSingRepository = personRepository,

       super(PersonSignState(labelText: _addDataText)) {
    _init();
  }

  void _init() async {
    _personSingRepository.personStream.listen((personSignDTO) {
      if (personSignDTO != null && personSignDTO.id != 0) {
        textGroupController.setPersonSign(personSignDTO);
        _emitNewState(personSignDTO);
      }
    });
    _emitNewState(PersonSignDTO.empty());
  }

  void onFirstNameChange(String value) {
    _personSingRepository.updateFirstName(value);
  }

  void onSecondNameChange(String value) {
    _personSingRepository.updateSecondName(value);
  }

  void onLastNameChange(String value) {
    _personSingRepository.updateLastName(value);
  }

  void onJobTitleChange(String value) {
    _personSingRepository.updateJobTitle(value);
  }

  void onCompanyTitleChange(String value) {
    _personSingRepository.updateCompanyTitle(value);
  }

  void onPhoneNumberChange(String value) {
    _personSingRepository.updatePhoneNumber(value);
  }

  void onJobEmailChange(String value) {
    _personSingRepository.updateJobEmail(value);
  }

  void onSaved() {
    _personSingRepository.save();
  }

  void _emitNewState([PersonSignDTO? dto]) {
    PersonSignState state = _buildState(dto);
    emit(state);
  }

  PersonSignState _buildState(PersonSignDTO? personSignDTO) {
    String labelText = personSignDTO!.id != 0
        ? '$_signTemplateText ${personSignDTO.fullName}'
        : _addDataText;
    return state.copyWith(
      labelText: labelText,
      isFilled: personSignDTO.id != 0,
    );
  }

  void edit() {
    emit(state.copyWith(isFilled: false));
  }
}
