import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v3/person_sign_source.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/presentation/bloc/v5/person_sign/person_sing_repository.dart';
import 'package:presale/src/presentation/modules/v5/design/common/person_sign/person_sign_validator.dart';

part 'person_sign_state.dart';

part 'person_sign_cubit.freezed.dart';

final String _addDataText = 'Ввести данные о подсписанте';
final String _signTemplateText = 'Подписант: ';

class PersonSignCubit extends Cubit<PersonSignState> {
  final PersonSignTextInputValidator textGroupController;
  final PersonSingRepository _personSingRepository;
  final StreamSink<PersonSignDTO> _streamSink;

  PersonSignCubit({
    required DBClient client,
    required StreamSink<PersonSignDTO> sinkPersonSign,
  }) : textGroupController = PersonSignTextInputValidator(),
       _personSingRepository = PersonSingRepository(
         dataSourceLocal: PersonSignDataSourceLocal(client),
       ),
       _streamSink = sinkPersonSign,
       super(PersonSignState(labelText: _addDataText));

  void init() async {
    PersonSignDTO personSignDTO = await _personSingRepository.getPersonSign();
    if (personSignDTO.id != 0) {
      textGroupController.setPersonSign(personSignDTO);
      _streamSink.add(personSignDTO);
    }

    PersonSignState state = _buildState(personSignDTO);
    emit(state);
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

  void onSaved() async {
    PersonSignDTO? personSignDTO = await _personSingRepository.build();
    if (personSignDTO.id != 0) {
      _streamSink.add(personSignDTO);
      PersonSignState state = _buildState(personSignDTO);
      emit(state);
    }
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
