class PersonSignDTO {
  final int id;
  final String fistName;
  final String secondName;
  final String lastName;
  final String jobTitle;
  final String companyTitle;
  final String phoneNumber;
  final String jobEmail;

  String get fullName => id == 0 ? '' : '$lastName ${fistName[0]}. ${secondName[0]}.';

  PersonSignDTO({
    this.id = 0,
    this.fistName = '',
    this.secondName = '',
    this.lastName = '',
    this.jobTitle = '',
    this.companyTitle = '',
    this.phoneNumber = '',
    this.jobEmail = '',
  });

  PersonSignDTO copyWith({
    int? id,
    String? fistName,
    String? secondName,
    String? lastName,
    String? jobTitle,
    String? companyTitle,
    String? phoneNumber,
    String? jobEmail,
  }) {
    return PersonSignDTO(
      id: id ?? this.id,
      fistName: fistName ?? this.fistName,
      secondName: secondName ?? this.secondName,
      lastName: lastName ?? this.lastName,
      jobTitle: jobTitle ?? this.jobTitle,
      companyTitle: companyTitle ?? this.companyTitle,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      jobEmail: jobEmail ?? this.jobEmail,
    );
  }
}





