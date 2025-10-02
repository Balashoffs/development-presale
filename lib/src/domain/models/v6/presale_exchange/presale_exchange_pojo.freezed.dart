// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presale_exchange_pojo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresaleExchangePojo {

 String get versionApi; DesignPresalePojo get designPresale;
/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresaleExchangePojoCopyWith<PresaleExchangePojo> get copyWith => _$PresaleExchangePojoCopyWithImpl<PresaleExchangePojo>(this as PresaleExchangePojo, _$identity);

  /// Serializes this PresaleExchangePojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresaleExchangePojo&&(identical(other.versionApi, versionApi) || other.versionApi == versionApi)&&(identical(other.designPresale, designPresale) || other.designPresale == designPresale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,versionApi,designPresale);

@override
String toString() {
  return 'PresaleExchangePojo(versionApi: $versionApi, designPresale: $designPresale)';
}


}

/// @nodoc
abstract mixin class $PresaleExchangePojoCopyWith<$Res>  {
  factory $PresaleExchangePojoCopyWith(PresaleExchangePojo value, $Res Function(PresaleExchangePojo) _then) = _$PresaleExchangePojoCopyWithImpl;
@useResult
$Res call({
 String versionApi, DesignPresalePojo designPresale
});


$DesignPresalePojoCopyWith<$Res> get designPresale;

}
/// @nodoc
class _$PresaleExchangePojoCopyWithImpl<$Res>
    implements $PresaleExchangePojoCopyWith<$Res> {
  _$PresaleExchangePojoCopyWithImpl(this._self, this._then);

  final PresaleExchangePojo _self;
  final $Res Function(PresaleExchangePojo) _then;

/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? versionApi = null,Object? designPresale = null,}) {
  return _then(_self.copyWith(
versionApi: null == versionApi ? _self.versionApi : versionApi // ignore: cast_nullable_to_non_nullable
as String,designPresale: null == designPresale ? _self.designPresale : designPresale // ignore: cast_nullable_to_non_nullable
as DesignPresalePojo,
  ));
}
/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignPresalePojoCopyWith<$Res> get designPresale {
  
  return $DesignPresalePojoCopyWith<$Res>(_self.designPresale, (value) {
    return _then(_self.copyWith(designPresale: value));
  });
}
}


/// Adds pattern-matching-related methods to [PresaleExchangePojo].
extension PresaleExchangePojoPatterns on PresaleExchangePojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresaleExchangePojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresaleExchangePojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresaleExchangePojo value)  $default,){
final _that = this;
switch (_that) {
case _PresaleExchangePojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresaleExchangePojo value)?  $default,){
final _that = this;
switch (_that) {
case _PresaleExchangePojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String versionApi,  DesignPresalePojo designPresale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresaleExchangePojo() when $default != null:
return $default(_that.versionApi,_that.designPresale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String versionApi,  DesignPresalePojo designPresale)  $default,) {final _that = this;
switch (_that) {
case _PresaleExchangePojo():
return $default(_that.versionApi,_that.designPresale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String versionApi,  DesignPresalePojo designPresale)?  $default,) {final _that = this;
switch (_that) {
case _PresaleExchangePojo() when $default != null:
return $default(_that.versionApi,_that.designPresale);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresaleExchangePojo implements PresaleExchangePojo {
  const _PresaleExchangePojo({required this.versionApi, required this.designPresale});
  factory _PresaleExchangePojo.fromJson(Map<String, dynamic> json) => _$PresaleExchangePojoFromJson(json);

@override final  String versionApi;
@override final  DesignPresalePojo designPresale;

/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresaleExchangePojoCopyWith<_PresaleExchangePojo> get copyWith => __$PresaleExchangePojoCopyWithImpl<_PresaleExchangePojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresaleExchangePojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresaleExchangePojo&&(identical(other.versionApi, versionApi) || other.versionApi == versionApi)&&(identical(other.designPresale, designPresale) || other.designPresale == designPresale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,versionApi,designPresale);

@override
String toString() {
  return 'PresaleExchangePojo(versionApi: $versionApi, designPresale: $designPresale)';
}


}

/// @nodoc
abstract mixin class _$PresaleExchangePojoCopyWith<$Res> implements $PresaleExchangePojoCopyWith<$Res> {
  factory _$PresaleExchangePojoCopyWith(_PresaleExchangePojo value, $Res Function(_PresaleExchangePojo) _then) = __$PresaleExchangePojoCopyWithImpl;
@override @useResult
$Res call({
 String versionApi, DesignPresalePojo designPresale
});


@override $DesignPresalePojoCopyWith<$Res> get designPresale;

}
/// @nodoc
class __$PresaleExchangePojoCopyWithImpl<$Res>
    implements _$PresaleExchangePojoCopyWith<$Res> {
  __$PresaleExchangePojoCopyWithImpl(this._self, this._then);

  final _PresaleExchangePojo _self;
  final $Res Function(_PresaleExchangePojo) _then;

/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? versionApi = null,Object? designPresale = null,}) {
  return _then(_PresaleExchangePojo(
versionApi: null == versionApi ? _self.versionApi : versionApi // ignore: cast_nullable_to_non_nullable
as String,designPresale: null == designPresale ? _self.designPresale : designPresale // ignore: cast_nullable_to_non_nullable
as DesignPresalePojo,
  ));
}

/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignPresalePojoCopyWith<$Res> get designPresale {
  
  return $DesignPresalePojoCopyWith<$Res>(_self.designPresale, (value) {
    return _then(_self.copyWith(designPresale: value));
  });
}
}

// dart format on
