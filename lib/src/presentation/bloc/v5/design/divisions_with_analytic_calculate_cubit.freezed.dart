// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'divisions_with_analytic_calculate_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DivisionsWithAnalyticCalculateState {

 StateEnum get stateEnum;
/// Create a copy of DivisionsWithAnalyticCalculateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DivisionsWithAnalyticCalculateStateCopyWith<DivisionsWithAnalyticCalculateState> get copyWith => _$DivisionsWithAnalyticCalculateStateCopyWithImpl<DivisionsWithAnalyticCalculateState>(this as DivisionsWithAnalyticCalculateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DivisionsWithAnalyticCalculateState&&(identical(other.stateEnum, stateEnum) || other.stateEnum == stateEnum));
}


@override
int get hashCode => Object.hash(runtimeType,stateEnum);

@override
String toString() {
  return 'DivisionsWithAnalyticCalculateState(stateEnum: $stateEnum)';
}


}

/// @nodoc
abstract mixin class $DivisionsWithAnalyticCalculateStateCopyWith<$Res>  {
  factory $DivisionsWithAnalyticCalculateStateCopyWith(DivisionsWithAnalyticCalculateState value, $Res Function(DivisionsWithAnalyticCalculateState) _then) = _$DivisionsWithAnalyticCalculateStateCopyWithImpl;
@useResult
$Res call({
 StateEnum stateEnum
});




}
/// @nodoc
class _$DivisionsWithAnalyticCalculateStateCopyWithImpl<$Res>
    implements $DivisionsWithAnalyticCalculateStateCopyWith<$Res> {
  _$DivisionsWithAnalyticCalculateStateCopyWithImpl(this._self, this._then);

  final DivisionsWithAnalyticCalculateState _self;
  final $Res Function(DivisionsWithAnalyticCalculateState) _then;

/// Create a copy of DivisionsWithAnalyticCalculateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stateEnum = null,}) {
  return _then(_self.copyWith(
stateEnum: null == stateEnum ? _self.stateEnum : stateEnum // ignore: cast_nullable_to_non_nullable
as StateEnum,
  ));
}

}


/// Adds pattern-matching-related methods to [DivisionsWithAnalyticCalculateState].
extension DivisionsWithAnalyticCalculateStatePatterns on DivisionsWithAnalyticCalculateState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DivisionsWithAnalyticCalculateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DivisionsWithAnalyticCalculateState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DivisionsWithAnalyticCalculateState value)  $default,){
final _that = this;
switch (_that) {
case _DivisionsWithAnalyticCalculateState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DivisionsWithAnalyticCalculateState value)?  $default,){
final _that = this;
switch (_that) {
case _DivisionsWithAnalyticCalculateState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateEnum stateEnum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DivisionsWithAnalyticCalculateState() when $default != null:
return $default(_that.stateEnum);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateEnum stateEnum)  $default,) {final _that = this;
switch (_that) {
case _DivisionsWithAnalyticCalculateState():
return $default(_that.stateEnum);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateEnum stateEnum)?  $default,) {final _that = this;
switch (_that) {
case _DivisionsWithAnalyticCalculateState() when $default != null:
return $default(_that.stateEnum);case _:
  return null;

}
}

}

/// @nodoc


class _DivisionsWithAnalyticCalculateState implements DivisionsWithAnalyticCalculateState {
  const _DivisionsWithAnalyticCalculateState({this.stateEnum = StateEnum.loading});
  

@override@JsonKey() final  StateEnum stateEnum;

/// Create a copy of DivisionsWithAnalyticCalculateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DivisionsWithAnalyticCalculateStateCopyWith<_DivisionsWithAnalyticCalculateState> get copyWith => __$DivisionsWithAnalyticCalculateStateCopyWithImpl<_DivisionsWithAnalyticCalculateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DivisionsWithAnalyticCalculateState&&(identical(other.stateEnum, stateEnum) || other.stateEnum == stateEnum));
}


@override
int get hashCode => Object.hash(runtimeType,stateEnum);

@override
String toString() {
  return 'DivisionsWithAnalyticCalculateState(stateEnum: $stateEnum)';
}


}

/// @nodoc
abstract mixin class _$DivisionsWithAnalyticCalculateStateCopyWith<$Res> implements $DivisionsWithAnalyticCalculateStateCopyWith<$Res> {
  factory _$DivisionsWithAnalyticCalculateStateCopyWith(_DivisionsWithAnalyticCalculateState value, $Res Function(_DivisionsWithAnalyticCalculateState) _then) = __$DivisionsWithAnalyticCalculateStateCopyWithImpl;
@override @useResult
$Res call({
 StateEnum stateEnum
});




}
/// @nodoc
class __$DivisionsWithAnalyticCalculateStateCopyWithImpl<$Res>
    implements _$DivisionsWithAnalyticCalculateStateCopyWith<$Res> {
  __$DivisionsWithAnalyticCalculateStateCopyWithImpl(this._self, this._then);

  final _DivisionsWithAnalyticCalculateState _self;
  final $Res Function(_DivisionsWithAnalyticCalculateState) _then;

/// Create a copy of DivisionsWithAnalyticCalculateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stateEnum = null,}) {
  return _then(_DivisionsWithAnalyticCalculateState(
stateEnum: null == stateEnum ? _self.stateEnum : stateEnum // ignore: cast_nullable_to_non_nullable
as StateEnum,
  ));
}


}

// dart format on
