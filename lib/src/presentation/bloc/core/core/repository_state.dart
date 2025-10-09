import 'package:presale/src/domain/core/failure/failure.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'repository_state.g.dart';

abstract class RepositoryState<T> extends Equatable {
  const RepositoryState();

  const RepositoryState.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();

  T? get model;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => const [];
}

@JsonSerializable()
class UninitializedState<T> extends RepositoryState<T> {
  const UninitializedState();

  @override
  T? get model => null;

  @override
  factory UninitializedState.fromJson(Map<String, dynamic> json) =>
      _$UninitializedStateFromJson<T>(json);

  @override
  Map<String, dynamic> toJson() => _$UninitializedStateToJson<T>(this);
}

@JsonSerializable()
class LoadingState<T> extends RepositoryState<T> {
  @_Converter()
  final T? outdatedModel;

  const LoadingState([this.outdatedModel]);

  @override
  T? get model => outdatedModel;

  @override
  factory LoadingState.fromJson(Map<String, dynamic> json) =>
      _$LoadingStateFromJson<T>(json);

  @override
  Map<String, dynamic> toJson() => _$LoadingStateToJson<T>(this);

  @override
  List<Object?> get props => [outdatedModel];
}

@JsonSerializable()
class FailureState<T> extends RepositoryState<T> {
  final Failure failure;
  @_Converter()
  final T? outdatedModel;

  const FailureState(this.failure, [this.outdatedModel]);

  @override
  T? get model => outdatedModel;

  @override
  factory FailureState.fromJson(Map<String, dynamic> json) =>
      _$FailureStateFromJson<T>(json);

  @override
  Map<String, dynamic> toJson() => _$FailureStateToJson<T>(this);

  @override
  List<Object?> get props => [failure, outdatedModel];
}

@JsonSerializable()
class SuccessState<T> extends RepositoryState<T> {
  final int timestamp;

  @override
  @_Converter()
  final T model;

  const SuccessState(this.model, [this.timestamp = 0]);

  @override
  factory SuccessState.fromJson(Map<String, dynamic> json) =>
      _$SuccessStateFromJson<T>(json);

  @override
  Map<String, dynamic> toJson() => _$SuccessStateToJson<T>(this);

  @override
  List<Object?> get props => [model];
}

class CompletedState<T> extends SuccessState<T> {
  const CompletedState(super.model, [super.timestamp]);
}

/// TODO: Add other models at _handleList, _handleMap
class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    if (json is List) return _handleList(json) as T;

    if (json is Map<String, dynamic>) return _handleMap(json) as T;

    return json as T;
  }

  dynamic _handleMap(Map<String, dynamic> json) {
    switch (T) {
      default:
        return null;
    }
  }

  dynamic _handleList(List json) {
    switch (T) {
      default:
        return null;
    }
  }

  @override
  Object? toJson(T object) => object;
}
