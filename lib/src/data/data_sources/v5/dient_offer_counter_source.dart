import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/input_result_data_source.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/pojo/offer_day_counter.dart';

class OfferCounterSourceLocal
    implements AbstractDataSource<OfferDayCounterPojo> {
  final DBClient _client;
  static String key = 'offer_counter';

  const OfferCounterSourceLocal(this._client);

  @override
  Future<bool> add(OfferDayCounterPojo result) async {
    _client.write(key, result);
    return true;
  }

  @override
  Future<bool> delete(String id) async {
    _client.delete(id);
    return true;
  }

  @override
  Future<OfferDayCounterPojo> read(String id) async {
    Map<String, dynamic> pojoMap = await _client.read(key);
    return OfferDayCounterPojo.fromJson(pojoMap);
  }

}
