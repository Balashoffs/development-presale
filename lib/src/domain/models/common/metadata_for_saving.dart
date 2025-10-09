/*
List<int> bytes, String fileName
allowedExtensions ['.xlsx']
dialogTitle: 'Сохранить КП в xlsx',
 */
import 'dart:typed_data';

class MetadataForSaving {
  final Uint8List bytes;
  final String fileName;
  final List<String> allowedExtensions;
  final String dialogTitle;
  final bool isOpen;

  MetadataForSaving.saveAsExcel(this.bytes, this.fileName, [this.isOpen = false])
    : allowedExtensions = ['.xlsx'],
      dialogTitle = 'Сохранить КП в xlsx';

  MetadataForSaving.saveAsPresaleFile(this.bytes, this.fileName, [this.isOpen = false])
      : allowedExtensions = ['.presale'],
        dialogTitle = 'Сохранить расчет КП';
}
