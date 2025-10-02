import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_presale_pojo.g.dart';

part 'test_presale_pojo.freezed.dart';

@freezed
abstract class PresaleExchangePojo with _$PresaleExchangePojo {
  const factory PresaleExchangePojo({
    required String schemeVer,
    required PresalePojo presale,
  }) = _PresaleExchangePojo;

  factory PresaleExchangePojo.fromJson(Map<String, dynamic> json) =>
      _$PresaleExchangePojoFromJson(json);
}

@freezed
abstract class PresalePojo with _$PresalePojo {
  const factory PresalePojo({required int id}) = _PresalePojo;

  factory PresalePojo.fromJson(Map<String, dynamic> json) =>
      _$PresalePojoFromJson(json);
}
