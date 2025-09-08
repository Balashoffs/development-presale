// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'division_resource_calculate_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DivisionResourceCalculateState implements DiagnosticableTreeMixin {

 StateEnum get stateEnum;
/// Create a copy of DivisionResourceCalculateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DivisionResourceCalculateStateCopyWith<DivisionResourceCalculateState> get copyWith => _$DivisionResourceCalculateStateCopyWithImpl<DivisionResourceCalculateState>(this as DivisionResourceCalculateState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DivisionResourceCalculateState'))
    ..add(DiagnosticsProperty('stateEnum', stateEnum));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DivisionResourceCalculateState&&(identical(other.stateEnum, stateEnum) || other.stateEnum == stateEnum));
}


@override
int get hashCode => Object.hash(runtimeType,stateEnum);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DivisionResourceCalculateState(stateEnum: $stateEnum)';
}


}

/// @nodoc
abstract mixin class $DivisionResourceCalculateStateCopyWith<$Res>  {
  factory $DivisionResourceCalculateStateCopyWith(DivisionResourceCalculateState value, $Res Function(DivisionResourceCalculateState) _then) = _$DivisionResourceCalculateStateCopyWithImpl;
@useResult
$Res call({
 StateEnum stateEnum
});




}
/// @nodoc
class _$DivisionResourceCalculateStateCopyWithImpl<$Res>
    implements $DivisionResourceCalculateStateCopyWith<$Res> {
  _$DivisionResourceCalculateStateCopyWithImpl(this._self, this._then);

  final DivisionResourceCalculateState _self;
  final $Res Function(DivisionResourceCalculateState) _then;

/// Create a copy of DivisionResourceCalculateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stateEnum = null,}) {
  return _then(_self.copyWith(
stateEnum: null == stateEnum ? _self.stateEnum : stateEnum // ignore: cast_nullable_to_non_nullable
as StateEnum,
  ));
}

}


/// Adds pattern-matching-related methods to [DivisionResourceCalculateState].
extension DivisionResourceCalculateStatePatterns on DivisionResourceCalculateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DivisionResourceCalculateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DivisionResourceCalculateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DivisionResourceCalculateState value)  $default,){
final _that = this;
switch (_that) {
case _DivisionResourceCalculateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DivisionResourceCalculateState value)?  $default,){
final _that = this;
switch (_that) {
case _DivisionResourceCalculateState() when $default != null:
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
case _DivisionResourceCalculateState() when $default != null:
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
case _DivisionResourceCalculateState():
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
case _DivisionResourceCalculateState() when $default != null:
return $default(_that.stateEnum);case _:
  return null;

}
}

}

/// @nodoc


class _DivisionResourceCalculateState with DiagnosticableTreeMixin implements DivisionResourceCalculateState {
  const _DivisionResourceCalculateState({this.stateEnum = StateEnum.loading});
  

@override@JsonKey() final  StateEnum stateEnum;

/// Create a copy of DivisionResourceCalculateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DivisionResourceCalculateStateCopyWith<_DivisionResourceCalculateState> get copyWith => __$DivisionResourceCalculateStateCopyWithImpl<_DivisionResourceCalculateState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DivisionResourceCalculateState'))
    ..add(DiagnosticsProperty('stateEnum', stateEnum));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DivisionResourceCalculateState&&(identical(other.stateEnum, stateEnum) || other.stateEnum == stateEnum));
}


@override
int get hashCode => Object.hash(runtimeType,stateEnum);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DivisionResourceCalculateState(stateEnum: $stateEnum)';
}


}

/// @nodoc
abstract mixin class _$DivisionResourceCalculateStateCopyWith<$Res> implements $DivisionResourceCalculateStateCopyWith<$Res> {
  factory _$DivisionResourceCalculateStateCopyWith(_DivisionResourceCalculateState value, $Res Function(_DivisionResourceCalculateState) _then) = __$DivisionResourceCalculateStateCopyWithImpl;
@override @useResult
$Res call({
 StateEnum stateEnum
});




}
/// @nodoc
class __$DivisionResourceCalculateStateCopyWithImpl<$Res>
    implements _$DivisionResourceCalculateStateCopyWith<$Res> {
  __$DivisionResourceCalculateStateCopyWithImpl(this._self, this._then);

  final _DivisionResourceCalculateState _self;
  final $Res Function(_DivisionResourceCalculateState) _then;

/// Create a copy of DivisionResourceCalculateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stateEnum = null,}) {
  return _then(_DivisionResourceCalculateState(
stateEnum: null == stateEnum ? _self.stateEnum : stateEnum // ignore: cast_nullable_to_non_nullable
as StateEnum,
  ));
}


}

// dart format on
