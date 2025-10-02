// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_presale_pojo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresaleExchangePojo {

 String get schemeVer; PresalePojo get presale;
/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresaleExchangePojoCopyWith<PresaleExchangePojo> get copyWith => _$PresaleExchangePojoCopyWithImpl<PresaleExchangePojo>(this as PresaleExchangePojo, _$identity);

  /// Serializes this PresaleExchangePojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresaleExchangePojo&&(identical(other.schemeVer, schemeVer) || other.schemeVer == schemeVer)&&(identical(other.presale, presale) || other.presale == presale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schemeVer,presale);

@override
String toString() {
  return 'PresaleExchangePojo(schemeVer: $schemeVer, presale: $presale)';
}


}

/// @nodoc
abstract mixin class $PresaleExchangePojoCopyWith<$Res>  {
  factory $PresaleExchangePojoCopyWith(PresaleExchangePojo value, $Res Function(PresaleExchangePojo) _then) = _$PresaleExchangePojoCopyWithImpl;
@useResult
$Res call({
 String schemeVer, PresalePojo presale
});


$PresalePojoCopyWith<$Res> get presale;

}
/// @nodoc
class _$PresaleExchangePojoCopyWithImpl<$Res>
    implements $PresaleExchangePojoCopyWith<$Res> {
  _$PresaleExchangePojoCopyWithImpl(this._self, this._then);

  final PresaleExchangePojo _self;
  final $Res Function(PresaleExchangePojo) _then;

/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schemeVer = null,Object? presale = null,}) {
  return _then(_self.copyWith(
schemeVer: null == schemeVer ? _self.schemeVer : schemeVer // ignore: cast_nullable_to_non_nullable
as String,presale: null == presale ? _self.presale : presale // ignore: cast_nullable_to_non_nullable
as PresalePojo,
  ));
}
/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PresalePojoCopyWith<$Res> get presale {
  
  return $PresalePojoCopyWith<$Res>(_self.presale, (value) {
    return _then(_self.copyWith(presale: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schemeVer,  PresalePojo presale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresaleExchangePojo() when $default != null:
return $default(_that.schemeVer,_that.presale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schemeVer,  PresalePojo presale)  $default,) {final _that = this;
switch (_that) {
case _PresaleExchangePojo():
return $default(_that.schemeVer,_that.presale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schemeVer,  PresalePojo presale)?  $default,) {final _that = this;
switch (_that) {
case _PresaleExchangePojo() when $default != null:
return $default(_that.schemeVer,_that.presale);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresaleExchangePojo implements PresaleExchangePojo {
  const _PresaleExchangePojo({required this.schemeVer, required this.presale});
  factory _PresaleExchangePojo.fromJson(Map<String, dynamic> json) => _$PresaleExchangePojoFromJson(json);

@override final  String schemeVer;
@override final  PresalePojo presale;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresaleExchangePojo&&(identical(other.schemeVer, schemeVer) || other.schemeVer == schemeVer)&&(identical(other.presale, presale) || other.presale == presale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schemeVer,presale);

@override
String toString() {
  return 'PresaleExchangePojo(schemeVer: $schemeVer, presale: $presale)';
}


}

/// @nodoc
abstract mixin class _$PresaleExchangePojoCopyWith<$Res> implements $PresaleExchangePojoCopyWith<$Res> {
  factory _$PresaleExchangePojoCopyWith(_PresaleExchangePojo value, $Res Function(_PresaleExchangePojo) _then) = __$PresaleExchangePojoCopyWithImpl;
@override @useResult
$Res call({
 String schemeVer, PresalePojo presale
});


@override $PresalePojoCopyWith<$Res> get presale;

}
/// @nodoc
class __$PresaleExchangePojoCopyWithImpl<$Res>
    implements _$PresaleExchangePojoCopyWith<$Res> {
  __$PresaleExchangePojoCopyWithImpl(this._self, this._then);

  final _PresaleExchangePojo _self;
  final $Res Function(_PresaleExchangePojo) _then;

/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schemeVer = null,Object? presale = null,}) {
  return _then(_PresaleExchangePojo(
schemeVer: null == schemeVer ? _self.schemeVer : schemeVer // ignore: cast_nullable_to_non_nullable
as String,presale: null == presale ? _self.presale : presale // ignore: cast_nullable_to_non_nullable
as PresalePojo,
  ));
}

/// Create a copy of PresaleExchangePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PresalePojoCopyWith<$Res> get presale {
  
  return $PresalePojoCopyWith<$Res>(_self.presale, (value) {
    return _then(_self.copyWith(presale: value));
  });
}
}


/// @nodoc
mixin _$PresalePojo {

 int get id;
/// Create a copy of PresalePojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresalePojoCopyWith<PresalePojo> get copyWith => _$PresalePojoCopyWithImpl<PresalePojo>(this as PresalePojo, _$identity);

  /// Serializes this PresalePojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresalePojo&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PresalePojo(id: $id)';
}


}

/// @nodoc
abstract mixin class $PresalePojoCopyWith<$Res>  {
  factory $PresalePojoCopyWith(PresalePojo value, $Res Function(PresalePojo) _then) = _$PresalePojoCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$PresalePojoCopyWithImpl<$Res>
    implements $PresalePojoCopyWith<$Res> {
  _$PresalePojoCopyWithImpl(this._self, this._then);

  final PresalePojo _self;
  final $Res Function(PresalePojo) _then;

/// Create a copy of PresalePojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PresalePojo].
extension PresalePojoPatterns on PresalePojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresalePojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresalePojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresalePojo value)  $default,){
final _that = this;
switch (_that) {
case _PresalePojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresalePojo value)?  $default,){
final _that = this;
switch (_that) {
case _PresalePojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresalePojo() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id)  $default,) {final _that = this;
switch (_that) {
case _PresalePojo():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id)?  $default,) {final _that = this;
switch (_that) {
case _PresalePojo() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresalePojo implements PresalePojo {
  const _PresalePojo({required this.id});
  factory _PresalePojo.fromJson(Map<String, dynamic> json) => _$PresalePojoFromJson(json);

@override final  int id;

/// Create a copy of PresalePojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresalePojoCopyWith<_PresalePojo> get copyWith => __$PresalePojoCopyWithImpl<_PresalePojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresalePojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresalePojo&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PresalePojo(id: $id)';
}


}

/// @nodoc
abstract mixin class _$PresalePojoCopyWith<$Res> implements $PresalePojoCopyWith<$Res> {
  factory _$PresalePojoCopyWith(_PresalePojo value, $Res Function(_PresalePojo) _then) = __$PresalePojoCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$PresalePojoCopyWithImpl<$Res>
    implements _$PresalePojoCopyWith<$Res> {
  __$PresalePojoCopyWithImpl(this._self, this._then);

  final _PresalePojo _self;
  final $Res Function(_PresalePojo) _then;

/// Create a copy of PresalePojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_PresalePojo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
