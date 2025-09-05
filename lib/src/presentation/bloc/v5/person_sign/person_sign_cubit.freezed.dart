// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_sign_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PersonSignState {

 bool get isFilled; dynamic get labelText;
/// Create a copy of PersonSignState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonSignStateCopyWith<PersonSignState> get copyWith => _$PersonSignStateCopyWithImpl<PersonSignState>(this as PersonSignState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonSignState&&(identical(other.isFilled, isFilled) || other.isFilled == isFilled)&&const DeepCollectionEquality().equals(other.labelText, labelText));
}


@override
int get hashCode => Object.hash(runtimeType,isFilled,const DeepCollectionEquality().hash(labelText));

@override
String toString() {
  return 'PersonSignState(isFilled: $isFilled, labelText: $labelText)';
}


}

/// @nodoc
abstract mixin class $PersonSignStateCopyWith<$Res>  {
  factory $PersonSignStateCopyWith(PersonSignState value, $Res Function(PersonSignState) _then) = _$PersonSignStateCopyWithImpl;
@useResult
$Res call({
 bool isFilled, dynamic labelText
});




}
/// @nodoc
class _$PersonSignStateCopyWithImpl<$Res>
    implements $PersonSignStateCopyWith<$Res> {
  _$PersonSignStateCopyWithImpl(this._self, this._then);

  final PersonSignState _self;
  final $Res Function(PersonSignState) _then;

/// Create a copy of PersonSignState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFilled = null,Object? labelText = freezed,}) {
  return _then(_self.copyWith(
isFilled: null == isFilled ? _self.isFilled : isFilled // ignore: cast_nullable_to_non_nullable
as bool,labelText: freezed == labelText ? _self.labelText : labelText // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonSignState].
extension PersonSignStatePatterns on PersonSignState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonSignState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonSignState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonSignState value)  $default,){
final _that = this;
switch (_that) {
case _PersonSignState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonSignState value)?  $default,){
final _that = this;
switch (_that) {
case _PersonSignState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isFilled,  dynamic labelText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonSignState() when $default != null:
return $default(_that.isFilled,_that.labelText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isFilled,  dynamic labelText)  $default,) {final _that = this;
switch (_that) {
case _PersonSignState():
return $default(_that.isFilled,_that.labelText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isFilled,  dynamic labelText)?  $default,) {final _that = this;
switch (_that) {
case _PersonSignState() when $default != null:
return $default(_that.isFilled,_that.labelText);case _:
  return null;

}
}

}

/// @nodoc


class _PersonSignState implements PersonSignState {
  const _PersonSignState({this.isFilled = false, this.labelText = ''});
  

@override@JsonKey() final  bool isFilled;
@override@JsonKey() final  dynamic labelText;

/// Create a copy of PersonSignState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonSignStateCopyWith<_PersonSignState> get copyWith => __$PersonSignStateCopyWithImpl<_PersonSignState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonSignState&&(identical(other.isFilled, isFilled) || other.isFilled == isFilled)&&const DeepCollectionEquality().equals(other.labelText, labelText));
}


@override
int get hashCode => Object.hash(runtimeType,isFilled,const DeepCollectionEquality().hash(labelText));

@override
String toString() {
  return 'PersonSignState(isFilled: $isFilled, labelText: $labelText)';
}


}

/// @nodoc
abstract mixin class _$PersonSignStateCopyWith<$Res> implements $PersonSignStateCopyWith<$Res> {
  factory _$PersonSignStateCopyWith(_PersonSignState value, $Res Function(_PersonSignState) _then) = __$PersonSignStateCopyWithImpl;
@override @useResult
$Res call({
 bool isFilled, dynamic labelText
});




}
/// @nodoc
class __$PersonSignStateCopyWithImpl<$Res>
    implements _$PersonSignStateCopyWith<$Res> {
  __$PersonSignStateCopyWithImpl(this._self, this._then);

  final _PersonSignState _self;
  final $Res Function(_PersonSignState) _then;

/// Create a copy of PersonSignState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFilled = null,Object? labelText = freezed,}) {
  return _then(_PersonSignState(
isFilled: null == isFilled ? _self.isFilled : isFilled // ignore: cast_nullable_to_non_nullable
as bool,labelText: freezed == labelText ? _self.labelText : labelText // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
