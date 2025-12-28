import 'package:presale/src/domain/models/v5/common/person_sign/person_sign_dto.dart';
import 'package:presale/src/domain/models/v6/company_info/company_info_dto.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'offer_parts.dart';

class OfferCompanySign extends OfferBase {
  OfferCompanySign({required super.worksheet, required super.rowPos});

  void addSign(CompanyInfoDTO companyInfo) {
    StringBuffer sb = StringBuffer();
    sb.writeln('С уважением,');
    sb.writeln('Генеральный директор');
    sb.writeln(companyInfo.companyName);
    sb.writeln(companyInfo.fullSign);

    buildCell(
      sb.toString(),
        currentRangeFromStartToEnd(1,2),
      alignType: HAlignType.left,
      isWrap: true,
      isMerge: true,
    );
    worksheet.getRangeByName( currentRangeFromStartToEnd(1,2)).rowHeight = 3 * 28.0;
    sb.clear();
  }
}

class OfferPersonSign extends OfferBase {
  OfferPersonSign({required super.worksheet, required super.rowPos});

  void addSign(PersonSignDTO? personSign) {
    StringBuffer sb = StringBuffer();
    sb.writeln('КОНТАКТНАЯ ИНФОРМАЦИЯ:');
    sb.writeln('${personSign!.fullName} | ${personSign.jobTitle}');
    sb.writeln('${personSign.phoneNumber} | ${personSign.jobEmail}');
    sb.writeln('www.liis.su');
    buildCell(
      sb.toString(),
      currentCell(3),
      alignType: HAlignType.left,
      isWrap: true,
      isMerge: true,
    );
    worksheet.getRangeByName( currentRangeFromStartToEnd(1,2)).rowHeight = 3 * 28.0;
  }
}
