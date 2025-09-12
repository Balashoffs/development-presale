import 'package:presale/src/data/clients/base_client.dart';
import 'package:presale/src/data/data_sources/v3/division_data_source.dart';
import 'package:presale/src/data/data_sources/v6/dient_offer_counter_source.dart';
import 'package:presale/src/domain/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:presale/src/domain/models/v3/design/divison/division.dart';
import 'package:presale/src/domain/models/v3/design/employee_cost/employee_cost.dart';
import 'package:presale/src/domain/models/v6/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v6/offer_counter/extension.dart';
import 'package:presale/src/domain/models/v6/offer_counter/pojo/offer_day_counter.dart';

abstract class OfferCountClient {
  const OfferCountClient();

  Future<OfferDayCounterDto?> read();

  Future<void> update(OfferDayCounterDto value);

  Future<void> delete();
}

class OfferCountClientImpl with BaseClient implements OfferCountClient {
  final OfferCounterSourceLocal _dataSource;

  OfferCountClientImpl(this._dataSource);

  @override
  Future<void> delete() async {
    return handleData(
      () => _dataSource.delete(OfferCounterSourceLocal.key),
    ).then((value) => value.fold((l) => false, (r) => r));
  }

  @override
  Future<OfferDayCounterDto?> read() async {
    OfferDayCounterDto? dto = await handleData(
      () => _dataSource.read(OfferCounterSourceLocal.key),
    ).then((value) => value.fold((l) => null, (r) => r.toDto()));
    return dto;
  }

  @override
  Future<bool> update(OfferDayCounterDto dto) async {
    return handleData(
      () => _dataSource.add(dto.toPojo()),
    ).then((value) => value.fold((l) => false, (r) => r));
  }
}
