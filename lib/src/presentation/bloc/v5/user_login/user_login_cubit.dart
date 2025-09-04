import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v3/person_sign_source.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/presentation/bloc/v5/user_login/person_sing_repository.dart';
import 'package:presale/src/presentation/modules/v5/design/common/person_sign/person_sign_validator.dart';

part 'user_login_state.dart';

part 'user_login_cubit.freezed.dart';

final String _addDataText = 'Для ввода нажмите на икноку справа';
final String _signTemplateText = 'Подписант: ';

class UserLoginCubit extends Cubit<UserLoginState> {
  final PersonSignTextInputValidator textGroupController;
  final PersonSingRepository _personSingRepository;
  final StreamSink<PersonSignDTO> _streamSink;


  UserLoginCubit({required DBClient client, required  StreamSink<PersonSignDTO> sinkPersonSign})
    : textGroupController = PersonSignTextInputValidator(),
      _personSingRepository = PersonSingRepository(
        dataSourceLocal: PersonSignDataSourceLocal(client),
      ),
        _streamSink = sinkPersonSign,
      super(const UserLoginState());

  void init() async {
    PersonSignDTO personSignDTO = await _personSingRepository.getPersonSign();
    if(personSignDTO.id != 0){
      textGroupController.setPersonSign(personSignDTO);
      _streamSink.add(personSignDTO);
    }

    UserLoginState state = _buildState(personSignDTO);
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
    if (personSignDTO != null && personSignDTO.id != 0) {
      UserLoginState state = _buildState(personSignDTO);
      emit(state);
    }
  }

  UserLoginState _buildState(PersonSignDTO? personSignDTO) {
    String labelText = personSignDTO!.id != 0
        ? '$_signTemplateText ${personSignDTO.fullName}'
        : _addDataText;
    return state.copyWith(
      labelText: labelText,
      isFilled: personSignDTO.id != 0,
    );
  }

  void edit() {
    emit(state.copyWith(isFilled: false,));
  }
}
