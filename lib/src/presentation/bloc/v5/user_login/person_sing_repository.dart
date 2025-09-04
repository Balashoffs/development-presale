import 'package:presale/src/data/data_sources/v3/person_sign_source.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/extension.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_pojo.dart';

class PersonSingRepository {
  PersonSignDTO _personSignDTO;
  final PersonSignDataSourceLocal _dataSourceLocal;

  PersonSingRepository({required PersonSignDataSourceLocal dataSourceLocal})
    : _dataSourceLocal = dataSourceLocal,
      _personSignDTO = PersonSignDTO.empty();

  Future<PersonSignDTO> getPersonSign() async {
    try {
      PersonSignPojo personSignPojo = await _dataSourceLocal.read(
        PersonSignDataSourceLocal.key,
      );
      _personSignDTO = personSignPojo.toDTO();
    } catch (_) {}
    return _personSignDTO;
  }

  void updateFirstName(String value) {
    _personSignDTO = _personSignDTO.copyWith(fistName: value);
  }

  void updateSecondName(String value) {
    _personSignDTO = _personSignDTO.copyWith(secondName: value);
  }

  void updateLastName(String value) {
    _personSignDTO = _personSignDTO.copyWith(lastName: value);
  }

  void updateJobTitle(String value) {
    _personSignDTO = _personSignDTO.copyWith(jobTitle: value);
  }

  void updateCompanyTitle(String value) {
    _personSignDTO = _personSignDTO.copyWith(companyTitle: value);
  }

  void updatePhoneNumber(String value) {
    _personSignDTO = _personSignDTO.copyWith(phoneNumber: value);
  }

  void updateJobEmail(String value) {
    _personSignDTO = _personSignDTO.copyWith(jobEmail: value);
  }

  Future<PersonSignDTO> build() async {
    _personSignDTO = _personSignDTO.copyWith(
      id: DateTime.now().millisecondsSinceEpoch,
    );
    PersonSignPojo? personSignPojo = _personSignDTO.toPojo();
    bool isAdd = await _dataSourceLocal.add(personSignPojo);
    return _personSignDTO;
  }
}
