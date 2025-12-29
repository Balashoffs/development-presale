// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'colontype_image_pojo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ColonTypeImagePojo {

 String get path; String get colonType;
/// Create a copy of ColonTypeImagePojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColonTypeImagePojoCopyWith<ColonTypeImagePojo> get copyWith => _$ColonTypeImagePojoCopyWithImpl<ColonTypeImagePojo>(this as ColonTypeImagePojo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColonTypeImagePojo&&(identical(other.path, path) || other.path == path)&&(identical(other.colonType, colonType) || other.colonType == colonType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,colonType);

@override
String toString() {
  return 'ColonTypeImagePojo(path: $path, colonType: $colonType)';
}


}

/// @nodoc
abstract mixin class $ColonTypeImagePojoCopyWith<$Res>  {
  factory $ColonTypeImagePojoCopyWith(ColonTypeImagePojo value, $Res Function(ColonTypeImagePojo) _then) = _$ColonTypeImagePojoCopyWithImpl;
@useResult
$Res call({
 String path, String colonType
});




}
/// @nodoc
class _$ColonTypeImagePojoCopyWithImpl<$Res>
    implements $ColonTypeImagePojoCopyWith<$Res> {
  _$ColonTypeImagePojoCopyWithImpl(this._self, this._then);

  final ColonTypeImagePojo _self;
  final $Res Function(ColonTypeImagePojo) _then;

/// Create a copy of ColonTypeImagePojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? colonType = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,colonType: null == colonType ? _self.colonType : colonType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ColonTypeImagePojo].
extension ColonTypeImagePojoPatterns on ColonTypeImagePojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColonTypeImagePojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColonTypeImagePojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColonTypeImagePojo value)  $default,){
final _that = this;
switch (_that) {
case _ColonTypeImagePojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColonTypeImagePojo value)?  $default,){
final _that = this;
switch (_that) {
case _ColonTypeImagePojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String colonType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColonTypeImagePojo() when $default != null:
return $default(_that.path,_that.colonType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String colonType)  $default,) {final _that = this;
switch (_that) {
case _ColonTypeImagePojo():
return $default(_that.path,_that.colonType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String colonType)?  $default,) {final _that = this;
switch (_that) {
case _ColonTypeImagePojo() when $default != null:
return $default(_that.path,_that.colonType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _ColonTypeImagePojo implements ColonTypeImagePojo {
  const _ColonTypeImagePojo({required this.path, required this.colonType});
  factory _ColonTypeImagePojo.fromJson(Map<String, dynamic> json) => _$ColonTypeImagePojoFromJson(json);

@override final  String path;
@override final  String colonType;

/// Create a copy of ColonTypeImagePojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColonTypeImagePojoCopyWith<_ColonTypeImagePojo> get copyWith => __$ColonTypeImagePojoCopyWithImpl<_ColonTypeImagePojo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColonTypeImagePojo&&(identical(other.path, path) || other.path == path)&&(identical(other.colonType, colonType) || other.colonType == colonType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,colonType);

@override
String toString() {
  return 'ColonTypeImagePojo(path: $path, colonType: $colonType)';
}


}

/// @nodoc
abstract mixin class _$ColonTypeImagePojoCopyWith<$Res> implements $ColonTypeImagePojoCopyWith<$Res> {
  factory _$ColonTypeImagePojoCopyWith(_ColonTypeImagePojo value, $Res Function(_ColonTypeImagePojo) _then) = __$ColonTypeImagePojoCopyWithImpl;
@override @useResult
$Res call({
 String path, String colonType
});




}
/// @nodoc
class __$ColonTypeImagePojoCopyWithImpl<$Res>
    implements _$ColonTypeImagePojoCopyWith<$Res> {
  __$ColonTypeImagePojoCopyWithImpl(this._self, this._then);

  final _ColonTypeImagePojo _self;
  final $Res Function(_ColonTypeImagePojo) _then;

/// Create a copy of ColonTypeImagePojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? colonType = null,}) {
  return _then(_ColonTypeImagePojo(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,colonType: null == colonType ? _self.colonType : colonType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
