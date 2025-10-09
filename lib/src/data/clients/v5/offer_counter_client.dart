import 'package:dartz/dartz.dart';

import 'package:presale/src/data/clients/base_client.dart';
import 'package:presale/src/data/data_sources/v5/dient_offer_counter_source.dart';
import 'package:presale/src/domain/core/failure/failure.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/dto/offer_day_counter_dto.dart';
import 'package:presale/src/domain/models/v5/common/offer_counter/extension.dart';

abstract class OfferCountClient {
  Future<Either<Failure, OfferDayCounterDTO>> initialize();

  Future<Either<Failure, OfferDayCounterDTO>> getCounter();

  Future<Either<Failure, bool>> updateCounter(OfferDayCounterDTO counter);
}

class OfferCountClientImpl with BaseClient implements OfferCountClient {
  final OfferCounterSourceLocal _dataSource;

  OfferCountClientImpl(this._dataSource);

  @override
  Future<Either<Failure, OfferDayCounterDTO>> initialize() async {
    OfferDayCounterDTO? dto = await getCounter().then(
      (value) => value.fold((l) => null, (r) => r),
    );
    if (dto != null) {
      if(!dto.isDayEqual()){
        dto = OfferDayCounterDTO.now();
      }else{
        dto.updatePoint();
      }
    } else {
      dto = OfferDayCounterDTO.now();
    }

    await updateCounter(
      dto,
    ).then((value) => value.fold((l) => false, (r) => r));
    return handleData(() => dto!);
  }

  @override
  Future<Either<Failure, OfferDayCounterDTO>> getCounter() async {
    return await handleData(
      () => _dataSource.read(OfferCounterSourceLocal.key).then((value) {
        return value.toDto();
      }),
    );
  }

  @override
  Future<Either<Failure, bool>> updateCounter(
    OfferDayCounterDTO counter,
  ) async {
    return handleData(() => _dataSource.add(counter.toPojo()));
  }
}
