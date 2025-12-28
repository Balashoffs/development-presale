// import 'dart:math';
// import 'dart:ui';
//
// import 'package:syncfusion_flutter_pdf/pdf.dart';
//
// class PdfBuilder {
//   final PdfDocument document;
//   late final PdfPage page;
//
//   PdfBuilder() : document = PdfDocument() {
//     page = document.pages.add();
//   }
//
//   String fileNameTemplate(String fileName) => '$fileName.pdf';
//
//   Future<List<int>> saveToBytes() async {
//     return document.save();
//   }
// }
//
// class PdfDocumentSetup {
//   final PdfDocument _document;
//
//   PdfDocumentSetup({required PdfDocument document}) : _document = document;
//
//   void setup() {
//     _document.pageSettings.size = PdfPageSize.a4;
//     _document.pageSettings.orientation = PdfPageOrientation.portrait;
//     _document.fileStructure.incrementalUpdate = false;
//     _document.compressionLevel = PdfCompressionLevel.normal;
//   }
// }
//
// class PdfImageElement {
//   final PdfDocument _document;
//
//   PdfImageElement({required PdfDocument document}) : _document = document;
//
//   /*
//   The following raster images are supported in Flutter PDF:
//     JPEG
//     PNG
//    */
//
//   void addImage(List<int> imageAsBytes, Size imageSize, Point<double> point) {
//     _document.pages[0].graphics.drawImage(
//       PdfBitmap(imageAsBytes),
//       Rect.fromLTWH(point.x, point.y, imageSize.width, imageSize.height),
//     );
//   }
// }
//
// class PdfTextElement {
//   final PdfDocument _document;
//
//   PdfTextElement({required PdfDocument document}) : _document = document;
//
//   void addText(String text, [PdfStandardFont pdfFont/**/]) {
//     var page = _document.pages[0];
//
//     page.graphics.drawString(
//       text,
//       PdfStandardFont(PdfFontFamily.helvetica, 20),
//       bounds: Rect.fromLTWH(40, 40, 500, 40),
//     );
//   }
// }
