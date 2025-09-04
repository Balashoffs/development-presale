import 'package:presale/src/data/core/csv_parser.dart';

class PersonSignDTO {
  final int id;
  final String fistName;
  final String secondName;
  final String lastName;
  final String jobTitle;
  final String companyTitle;
  final String phoneNumber;
  final String jobEmail;

  String? get fullName => id == 0 ? '' : '$lastName ${fistName[0]}. ${secondName[0]}.';

  PersonSignDTO({
    this.id = 0,
    required this.fistName,
    required this.secondName,
    required this.lastName,
    required this.jobTitle,
    required this.companyTitle,
    required this.phoneNumber,
    required this.jobEmail,
  });

  static PersonSignDTO empty(){
   return PersonSignDTO(
     id: 0,
     fistName: '',
     secondName: '',
     lastName: '',
     jobTitle: '',
     companyTitle: '',
     phoneNumber: '',
     jobEmail: '',
   );
  }


  factory PersonSignDTO.fromCsvRow(List<dynamic> row) {
    return PersonSignDTO(
      id: int.tryParse(row[0]) ?? 0,
      fistName: row[1],
      secondName: row[2],
      lastName: row[3],
      jobTitle: row[4],
      companyTitle: row[5],
      phoneNumber: row[6],
      jobEmail: row[7],
    );
  }

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

typedef DivisionCSVParser =
    List<PersonSignDTO> Function(List<List<dynamic>> rows);

const path = 'assets/calculator_data/v5/sign_person.csv';

class DivisionCostDtoBuilder extends CsvParser<PersonSignDTO> {
  DivisionCostDtoBuilder(super.path);

  DivisionCSVParser get _parser =>
      (rows) => rows.skip(1).map((row) => PersonSignDTO.fromCsvRow(row)).toList();

  @override
  Future<List<PersonSignDTO>> build() async {
    return await parse(_parser);
  }
}
