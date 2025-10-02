import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:presale/src/data/clients/base_client.dart';
import 'package:presale/src/domain/core/failure/failure.dart';
import 'package:presale/src/domain/models/v6/presale_exchange/presale_exchange_pojo.dart';
import 'package:presale/src/domain/service/v6/design/encrypt_json_to_bytes.dart';

class EncryptShareDesignOfferService with BaseClient {
  final int xorKey;

  EncryptShareDesignOfferService(this.xorKey);

  Future<Either<Failure, Uint8List>> encrypt(PresaleExchangePojo input) {
    return handleData(() {
      final toJson = input.toJson();
      return toXorBytes(toJson, xorKey);
    });
  }

  Future<Either<Failure, PresaleExchangePojo>> decrypt(Uint8List input) {
    return handleData(() {
      final toPojo = fromXorByte(input, xorKey);
      return PresaleExchangePojo.fromJson(toPojo);
    });
  }
}
