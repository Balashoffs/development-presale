// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'object_input_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ObjectInputDataState implements DiagnosticableTreeMixin {

 StateEnum get stateEnum;
/// Create a copy of ObjectInputDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObjectInputDataStateCopyWith<ObjectInputDataState> get copyWith => _$ObjectInputDataStateCopyWithImpl<ObjectInputDataState>(this as ObjectInputDataState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ObjectInputDataState'))
    ..add(DiagnosticsProperty('stateEnum', stateEnum));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObjectInputDataState&&(identical(other.stateEnum, stateEnum) || other.stateEnum == stateEnum));
}


@override
int get hashCode => Object.hash(runtimeType,stateEnum);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ObjectInputDataState(stateEnum: $stateEnum)';
}


}

/// @nodoc
abstract mixin class $ObjectInputDataStateCopyWith<$Res>  {
  factory $ObjectInputDataStateCopyWith(ObjectInputDataState value, $Res Function(ObjectInputDataState) _then) = _$ObjectInputDataStateCopyWithImpl;
@useResult
$Res call({
 StateEnum stateEnum
});




}
/// @nodoc
class _$ObjectInputDataStateCopyWithImpl<$Res>
    implements $ObjectInputDataStateCopyWith<$Res> {
  _$ObjectInputDataStateCopyWithImpl(this._self, this._then);

  final ObjectInputDataState _self;
  final $Res Function(ObjectInputDataState) _then;

/// Create a copy of ObjectInputDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stateEnum = null,}) {
  return _then(_self.copyWith(
stateEnum: null == stateEnum ? _self.stateEnum : stateEnum // ignore: cast_nullable_to_non_nullable
as StateEnum,
  ));
}

}


/// Adds pattern-matching-related methods to [ObjectInputDataState].
extension ObjectInputDataStatePatterns on ObjectInputDataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ObjectInputDataState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ObjectInputDataState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ObjectInputDataState value)  $default,){
final _that = this;
switch (_that) {
case _ObjectInputDataState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ObjectInputDataState value)?  $default,){
final _that = this;
switch (_that) {
case _ObjectInputDataState() when $default != null:
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
case _ObjectInputDataState() when $default != null:
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
case _ObjectInputDataState():
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
case _ObjectInputDataState() when $default != null:
return $default(_that.stateEnum);case _:
  return null;

}
}

}

/// @nodoc


class _ObjectInputDataState with DiagnosticableTreeMixin implements ObjectInputDataState {
  const _ObjectInputDataState({this.stateEnum = StateEnum.loading});
  

@override@JsonKey() final  StateEnum stateEnum;

/// Create a copy of ObjectInputDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObjectInputDataStateCopyWith<_ObjectInputDataState> get copyWith => __$ObjectInputDataStateCopyWithImpl<_ObjectInputDataState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ObjectInputDataState'))
    ..add(DiagnosticsProperty('stateEnum', stateEnum));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ObjectInputDataState&&(identical(other.stateEnum, stateEnum) || other.stateEnum == stateEnum));
}


@override
int get hashCode => Object.hash(runtimeType,stateEnum);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ObjectInputDataState(stateEnum: $stateEnum)';
}


}

/// @nodoc
abstract mixin class _$ObjectInputDataStateCopyWith<$Res> implements $ObjectInputDataStateCopyWith<$Res> {
  factory _$ObjectInputDataStateCopyWith(_ObjectInputDataState value, $Res Function(_ObjectInputDataState) _then) = __$ObjectInputDataStateCopyWithImpl;
@override @useResult
$Res call({
 StateEnum stateEnum
});




}
/// @nodoc
class __$ObjectInputDataStateCopyWithImpl<$Res>
    implements _$ObjectInputDataStateCopyWith<$Res> {
  __$ObjectInputDataStateCopyWithImpl(this._self, this._then);

  final _ObjectInputDataState _self;
  final $Res Function(_ObjectInputDataState) _then;

/// Create a copy of ObjectInputDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stateEnum = null,}) {
  return _then(_ObjectInputDataState(
stateEnum: null == stateEnum ? _self.stateEnum : stateEnum // ignore: cast_nullable_to_non_nullable
as StateEnum,
  ));
}


}

// dart format on
