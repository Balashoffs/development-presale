import 'package:file_picker/file_picker.dart';
import 'package:presale/src/domain/models/common/metadata_for_picking.dart';

Future<MetadataAfterPiking> pickFile(MetadataForPiking metadata) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: metadata.allowedExtensions,
    dialogTitle: metadata.dialogTitle,
    lockParentWindow: true,
  );

  if(result != null && result.count == 1){
    final xfile = result.xFiles.first;
    final fileName = xfile.name;
    final bytes = await xfile.readAsBytes();
    return MetadataAfterPiking.afterPicking(bytes: bytes, fileName: fileName);
  }

  return MetadataAfterPiking.error();

}
