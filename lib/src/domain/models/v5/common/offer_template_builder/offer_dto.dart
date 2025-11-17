import 'package:presale/src/data/core/string_converter.dart';
import 'package:presale/src/domain/models/v6/design/design_presale/design_offer_dto.dart';
import 'package:presale/src/domain/service/v5/design/excel_service.dart';

class OfferDTOBuilder {
  static OfferDTO build(
    ExcelSaveType type,
    CommercialOfferDTO commercialOffer,
  ) {
    switch (type) {
      case ExcelSaveType.manager:
        List<OfferRowDTO> rows = List.generate(
          commercialOffer.divisionResults.length,
          (index) {
            int pos = index + 1;
            DivisionResultDTO dr = commercialOffer.divisionResults[index];
            return OfferRowDTO(
              id: pos.toString(),
              divisionName: dr.divisionName,
              divisionSummaryWithTax: dr.divisionSummaryWithTax.toStringAsFixed(
                2,
              ),
            );
          },
        );
        return OfferDTO(
          id: commercialOffer.id,
          created: commercialOffer.created,
          objectName: commercialOffer.objectName,
          objectAddress: commercialOffer.objectAddress,
          deadline: commercialOffer.deadline == 0
              ? ''
              : '${commercialOffer.deadline}',

          objectSquare: commercialOffer.objectSquare == 0
              ? ''
              : '${commercialOffer.objectSquare}',
          summaryWithTax: commercialOffer.divisionSummary.toStringAsFixed(2),
          rows: rows,
          tax: '',
          presaleCostValue: commercialOffer.presaleCostValue.toStringAsFixed(2),
          noteText: commercialOffer.noteText,
          companyTitle: commercialOffer.personSign?.companyTitle ?? '',
          jobTitle: commercialOffer.personSign?.jobTitle ?? '',
          fullName: commercialOffer.personSign?.fullName ?? '',
          isPersonSing: commercialOffer.personSign != null,
        );
      case ExcelSaveType.client:
        List<OfferRowDTO> rows = List.generate(
          commercialOffer.divisionResults.length,
          (index) {
            int pos = index + 1;
            DivisionResultDTO dr = commercialOffer.divisionResults[index];
            return OfferRowDTO(
              id: pos.toString(),
              divisionName: dr.divisionName,
              divisionSummaryWithTax: convertToString(
                dr.divisionSummaryWithTax,
                2,
              ),
            );
          },
        );
        return OfferDTO(
          id: commercialOffer.id,
          created: commercialOffer.created,
          objectName: commercialOffer.objectName,
          objectAddress: commercialOffer.objectAddress,
          deadline: commercialOffer.deadline == 0
              ? ''
              : '${commercialOffer.deadline}',

          objectSquare: commercialOffer.objectSquare == 0
              ? ''
              : '${commercialOffer.objectSquare}',
          summaryWithTax: convertToString(commercialOffer.summaryWithTax, 2),
          rows: rows,
          tax: convertToString(commercialOffer.tax, 2),
          presaleCostValue: convertToString(
            commercialOffer.presaleCostValue,
            2,
          ),
          noteText: commercialOffer.noteText,
          companyTitle: commercialOffer.personSign?.companyTitle ?? '',
          jobTitle: commercialOffer.personSign?.jobTitle ?? '',
          fullName: commercialOffer.personSign?.fullName ?? '',
          isPersonSing: commercialOffer.personSign != null,
        );
    }
  }
}

class OfferDTO {
  final String id;

  final String created;

  final String objectName;

  final String objectAddress;

  final String deadline;

  final List<OfferRowDTO> rows;

  final String summaryWithTax;

  final String tax;

  final String objectSquare;

  final String presaleCostValue;

  final String noteText;

  final String companyTitle;

  final String jobTitle;

  final String fullName;

  final bool isPersonSing;

  OfferDTO({
    required this.id,
    required this.created,
    required this.objectName,
    required this.objectAddress,
    required this.deadline,
    required this.summaryWithTax,
    required this.rows,
    required this.tax,
    required this.objectSquare,
    required this.presaleCostValue,
    required this.noteText,
    required this.companyTitle,
    required this.jobTitle,
    required this.fullName,
    required this.isPersonSing,
  });
}

class OfferRowDTO {
  final String id;

  final String divisionName;

  final String divisionSummaryWithTax;

  OfferRowDTO({
    required this.id,
    required this.divisionName,
    required this.divisionSummaryWithTax,
  });
}
