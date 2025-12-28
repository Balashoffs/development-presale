import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'offer_parts/offer_parts.dart';


class OfferParts {
  final OfferHeader offerHeader;
  final OfferTable offerTable;
  final OfferFooter offerFooter;

  OfferParts(Worksheet worksheet, RowPos rowPos)
    : offerHeader = OfferHeader(worksheet: worksheet, rowPos: rowPos),
      offerTable = OfferTable(worksheet: worksheet, rowPos: rowPos),
      offerFooter = OfferFooter(worksheet: worksheet, rowPos: rowPos);
}
