import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_pojo.dart';

extension PersonSignDTOExt on PersonSignDTO {
  PersonSignPojo toPojo() {
    return PersonSignPojo(
      id: id,
      fistName: fistName,
      secondName: secondName,
      lastName: lastName,
      jobTitle: jobTitle,
      companyTitle: companyTitle,
      phoneNumber: phoneNumber,
      jobEmail: jobEmail,
    );
  }
}

extension PersonSignPojoExt on PersonSignPojo {
  PersonSignDTO toDTO() {
    return PersonSignDTO(
      id: id,
      fistName: fistName,
      secondName: secondName,
      lastName: lastName,
      jobTitle: jobTitle,
      companyTitle: companyTitle,
      phoneNumber: phoneNumber,
      jobEmail: jobEmail,
    );
  }
}
