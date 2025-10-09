import 'dart:async';

import 'package:presale/src/data/core/exceptions.dart';
import 'package:presale/src/domain/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

mixin BaseClient {
  Future<Either<Failure, T>> handleData<T>(
    FutureOr<T> Function() callback,
  ) async {
    try {
      return Right(await callback());
    } on NetworkException catch (error) {
      return Left(Failure(FailureType.network, error.message));
    } on ServerException catch (error) {
      return Left(Failure(FailureType.api, error.message));
    } on UnauthorizedException catch (error) {
      return Left(Failure(FailureType.unauthorized, error.message));
    } on ResponseException catch (error) {
      return Left(Failure(FailureType.response, error.message));
    } on DataBaseException catch (error) {
      return Left(Failure(FailureType.database, error.message));
    } catch (e) {
      return const Left(Failure(FailureType.unknown, null));
    }
  }
}
