import 'package:dartz/dartz.dart';

import 'package:presale/src/data/clients/base_client.dart';
import 'package:presale/src/data/data_sources/v5/dient_offer_counter_source.dart';
import 'package:presale/src/domain/core/failure/failure.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/extension.dart';

abstract class OfferCountClient {
  Future<Either<Failure, OfferDayCounterDto>> initialize();

  Future<Either<Failure, OfferDayCounterDto>> getCounter();

  Future<Either<Failure, bool>> updateCounter(OfferDayCounterDto counter);
}

class OfferCountClientImpl with BaseClient implements OfferCountClient {
  final OfferCounterSourceLocal _dataSource;

  OfferCountClientImpl(this._dataSource);

  @override
  Future<Either<Failure, OfferDayCounterDto>> initialize() async {
    OfferDayCounterDto? dto = await getCounter().then(
      (value) => value.fold((l) => null, (r) => r),
    );
    if (dto != null) {
      dto.updatePoint();
      print('Updated: ${dto}');
    } else {
      dto = OfferDayCounterDto.now();
    }

    await updateCounter(
      dto,
    ).then((value) => value.fold((l) => false, (r) => r));
    return handleData(() => dto!);
  }

  @override
  Future<Either<Failure, OfferDayCounterDto>> getCounter() async {
    return await handleData(
      () => _dataSource.read(OfferCounterSourceLocal.key).then((value) {
        print('getCounter: $value');
        return value.toDto();
      }),
    );
  }

  @override
  Future<Either<Failure, bool>> updateCounter(
    OfferDayCounterDto counter,
  ) async {
    return handleData(() => _dataSource.add(counter.toPojo()));
  }
}
