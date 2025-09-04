// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserLoginState {

 bool get isFilled; dynamic get labelText;
/// Create a copy of UserLoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoginStateCopyWith<UserLoginState> get copyWith => _$UserLoginStateCopyWithImpl<UserLoginState>(this as UserLoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoginState&&(identical(other.isFilled, isFilled) || other.isFilled == isFilled)&&const DeepCollectionEquality().equals(other.labelText, labelText));
}


@override
int get hashCode => Object.hash(runtimeType,isFilled,const DeepCollectionEquality().hash(labelText));

@override
String toString() {
  return 'UserLoginState(isFilled: $isFilled, labelText: $labelText)';
}


}

/// @nodoc
abstract mixin class $UserLoginStateCopyWith<$Res>  {
  factory $UserLoginStateCopyWith(UserLoginState value, $Res Function(UserLoginState) _then) = _$UserLoginStateCopyWithImpl;
@useResult
$Res call({
 bool isFilled, dynamic labelText
});




}
/// @nodoc
class _$UserLoginStateCopyWithImpl<$Res>
    implements $UserLoginStateCopyWith<$Res> {
  _$UserLoginStateCopyWithImpl(this._self, this._then);

  final UserLoginState _self;
  final $Res Function(UserLoginState) _then;

/// Create a copy of UserLoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFilled = null,Object? labelText = freezed,}) {
  return _then(_self.copyWith(
isFilled: null == isFilled ? _self.isFilled : isFilled // ignore: cast_nullable_to_non_nullable
as bool,labelText: freezed == labelText ? _self.labelText : labelText // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLoginState].
extension UserLoginStatePatterns on UserLoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLoginState value)  $default,){
final _that = this;
switch (_that) {
case _UserLoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLoginState value)?  $default,){
final _that = this;
switch (_that) {
case _UserLoginState() when $default != null:
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
case _UserLoginState() when $default != null:
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
case _UserLoginState():
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
case _UserLoginState() when $default != null:
return $default(_that.isFilled,_that.labelText);case _:
  return null;

}
}

}

/// @nodoc


class _UserLoginState implements UserLoginState {
  const _UserLoginState({this.isFilled = false, this.labelText = ''});
  

@override@JsonKey() final  bool isFilled;
@override@JsonKey() final  dynamic labelText;

/// Create a copy of UserLoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLoginStateCopyWith<_UserLoginState> get copyWith => __$UserLoginStateCopyWithImpl<_UserLoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLoginState&&(identical(other.isFilled, isFilled) || other.isFilled == isFilled)&&const DeepCollectionEquality().equals(other.labelText, labelText));
}


@override
int get hashCode => Object.hash(runtimeType,isFilled,const DeepCollectionEquality().hash(labelText));

@override
String toString() {
  return 'UserLoginState(isFilled: $isFilled, labelText: $labelText)';
}


}

/// @nodoc
abstract mixin class _$UserLoginStateCopyWith<$Res> implements $UserLoginStateCopyWith<$Res> {
  factory _$UserLoginStateCopyWith(_UserLoginState value, $Res Function(_UserLoginState) _then) = __$UserLoginStateCopyWithImpl;
@override @useResult
$Res call({
 bool isFilled, dynamic labelText
});




}
/// @nodoc
class __$UserLoginStateCopyWithImpl<$Res>
    implements _$UserLoginStateCopyWith<$Res> {
  __$UserLoginStateCopyWithImpl(this._self, this._then);

  final _UserLoginState _self;
  final $Res Function(_UserLoginState) _then;

/// Create a copy of UserLoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFilled = null,Object? labelText = freezed,}) {
  return _then(_UserLoginState(
isFilled: null == isFilled ? _self.isFilled : isFilled // ignore: cast_nullable_to_non_nullable
as bool,labelText: freezed == labelText ? _self.labelText : labelText // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
