

import 'dart:typed_data';

class MetadataForPiking {
  final List<String> allowedExtensions;
  final String dialogTitle;

  MetadataForPiking()
    : allowedExtensions = ['presale'],
      dialogTitle = 'Загрузить расчеты ПД/РД';
}

class MetadataAfterPiking {
  final Uint8List bytes;
  final String fileName;

  MetadataAfterPiking.afterPicking({required this.bytes, required this.fileName});
  MetadataAfterPiking.error(): bytes = Uint8List(0), fileName = '';
}
