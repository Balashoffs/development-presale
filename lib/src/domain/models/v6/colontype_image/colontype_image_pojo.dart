import 'package:freezed_annotation/freezed_annotation.dart';

part 'colontype_image_pojo.freezed.dart';

part 'colontype_image_pojo.g.dart';

@Freezed(toJson: false)
abstract class ColonTypeImagePojo with _$ColonTypeImagePojo {
  const factory ColonTypeImagePojo({
    required String path,
    required String colonType,
  }) = _ColonTypeImagePojo;

  factory ColonTypeImagePojo.fromJson(Map<String, dynamic> json) =>
      _$ColonTypeImagePojoFromJson(json);
}
