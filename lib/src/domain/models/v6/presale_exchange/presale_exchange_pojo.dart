import 'package:freezed_annotation/freezed_annotation.dart';

import '../design/design_presale/design_offer_pojo.dart';

part 'presale_exchange_pojo.freezed.dart';

part 'presale_exchange_pojo.g.dart';

@freezed
abstract class PresaleExchangePojo with _$PresaleExchangePojo {
  const factory PresaleExchangePojo({
    required String versionApi,
    required DesignPresalePojo designPresale,
  }) = _PresaleExchangePojo;

  factory PresaleExchangePojo.fromJson(Map<String, dynamic> json) =>
      _$PresaleExchangePojoFromJson(json);
}
