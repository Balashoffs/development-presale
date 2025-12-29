// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyInfoPojo {

 String get companyName; String get CEOSurnameName; String get CEOFistName; String get CEOSecondName; String get colonType;
/// Create a copy of CompanyInfoPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyInfoPojoCopyWith<CompanyInfoPojo> get copyWith => _$CompanyInfoPojoCopyWithImpl<CompanyInfoPojo>(this as CompanyInfoPojo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInfoPojo&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.CEOSurnameName, CEOSurnameName) || other.CEOSurnameName == CEOSurnameName)&&(identical(other.CEOFistName, CEOFistName) || other.CEOFistName == CEOFistName)&&(identical(other.CEOSecondName, CEOSecondName) || other.CEOSecondName == CEOSecondName)&&(identical(other.colonType, colonType) || other.colonType == colonType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,CEOSurnameName,CEOFistName,CEOSecondName,colonType);

@override
String toString() {
  return 'CompanyInfoPojo(companyName: $companyName, CEOSurnameName: $CEOSurnameName, CEOFistName: $CEOFistName, CEOSecondName: $CEOSecondName, colonType: $colonType)';
}


}

/// @nodoc
abstract mixin class $CompanyInfoPojoCopyWith<$Res>  {
  factory $CompanyInfoPojoCopyWith(CompanyInfoPojo value, $Res Function(CompanyInfoPojo) _then) = _$CompanyInfoPojoCopyWithImpl;
@useResult
$Res call({
 String companyName, String CEOSurnameName, String CEOFistName, String CEOSecondName, String colonType
});




}
/// @nodoc
class _$CompanyInfoPojoCopyWithImpl<$Res>
    implements $CompanyInfoPojoCopyWith<$Res> {
  _$CompanyInfoPojoCopyWithImpl(this._self, this._then);

  final CompanyInfoPojo _self;
  final $Res Function(CompanyInfoPojo) _then;

/// Create a copy of CompanyInfoPojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = null,Object? CEOSurnameName = null,Object? CEOFistName = null,Object? CEOSecondName = null,Object? colonType = null,}) {
  return _then(_self.copyWith(
companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,CEOSurnameName: null == CEOSurnameName ? _self.CEOSurnameName : CEOSurnameName // ignore: cast_nullable_to_non_nullable
as String,CEOFistName: null == CEOFistName ? _self.CEOFistName : CEOFistName // ignore: cast_nullable_to_non_nullable
as String,CEOSecondName: null == CEOSecondName ? _self.CEOSecondName : CEOSecondName // ignore: cast_nullable_to_non_nullable
as String,colonType: null == colonType ? _self.colonType : colonType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyInfoPojo].
extension CompanyInfoPojoPatterns on CompanyInfoPojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyInfoPojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyInfoPojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyInfoPojo value)  $default,){
final _that = this;
switch (_that) {
case _CompanyInfoPojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyInfoPojo value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyInfoPojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String companyName,  String CEOSurnameName,  String CEOFistName,  String CEOSecondName,  String colonType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyInfoPojo() when $default != null:
return $default(_that.companyName,_that.CEOSurnameName,_that.CEOFistName,_that.CEOSecondName,_that.colonType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String companyName,  String CEOSurnameName,  String CEOFistName,  String CEOSecondName,  String colonType)  $default,) {final _that = this;
switch (_that) {
case _CompanyInfoPojo():
return $default(_that.companyName,_that.CEOSurnameName,_that.CEOFistName,_that.CEOSecondName,_that.colonType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String companyName,  String CEOSurnameName,  String CEOFistName,  String CEOSecondName,  String colonType)?  $default,) {final _that = this;
switch (_that) {
case _CompanyInfoPojo() when $default != null:
return $default(_that.companyName,_that.CEOSurnameName,_that.CEOFistName,_that.CEOSecondName,_that.colonType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _CompanyInfoPojo implements CompanyInfoPojo {
  const _CompanyInfoPojo({required this.companyName, required this.CEOSurnameName, required this.CEOFistName, required this.CEOSecondName, required this.colonType});
  factory _CompanyInfoPojo.fromJson(Map<String, dynamic> json) => _$CompanyInfoPojoFromJson(json);

@override final  String companyName;
@override final  String CEOSurnameName;
@override final  String CEOFistName;
@override final  String CEOSecondName;
@override final  String colonType;

/// Create a copy of CompanyInfoPojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyInfoPojoCopyWith<_CompanyInfoPojo> get copyWith => __$CompanyInfoPojoCopyWithImpl<_CompanyInfoPojo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyInfoPojo&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.CEOSurnameName, CEOSurnameName) || other.CEOSurnameName == CEOSurnameName)&&(identical(other.CEOFistName, CEOFistName) || other.CEOFistName == CEOFistName)&&(identical(other.CEOSecondName, CEOSecondName) || other.CEOSecondName == CEOSecondName)&&(identical(other.colonType, colonType) || other.colonType == colonType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,CEOSurnameName,CEOFistName,CEOSecondName,colonType);

@override
String toString() {
  return 'CompanyInfoPojo(companyName: $companyName, CEOSurnameName: $CEOSurnameName, CEOFistName: $CEOFistName, CEOSecondName: $CEOSecondName, colonType: $colonType)';
}


}

/// @nodoc
abstract mixin class _$CompanyInfoPojoCopyWith<$Res> implements $CompanyInfoPojoCopyWith<$Res> {
  factory _$CompanyInfoPojoCopyWith(_CompanyInfoPojo value, $Res Function(_CompanyInfoPojo) _then) = __$CompanyInfoPojoCopyWithImpl;
@override @useResult
$Res call({
 String companyName, String CEOSurnameName, String CEOFistName, String CEOSecondName, String colonType
});




}
/// @nodoc
class __$CompanyInfoPojoCopyWithImpl<$Res>
    implements _$CompanyInfoPojoCopyWith<$Res> {
  __$CompanyInfoPojoCopyWithImpl(this._self, this._then);

  final _CompanyInfoPojo _self;
  final $Res Function(_CompanyInfoPojo) _then;

/// Create a copy of CompanyInfoPojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = null,Object? CEOSurnameName = null,Object? CEOFistName = null,Object? CEOSecondName = null,Object? colonType = null,}) {
  return _then(_CompanyInfoPojo(
companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,CEOSurnameName: null == CEOSurnameName ? _self.CEOSurnameName : CEOSurnameName // ignore: cast_nullable_to_non_nullable
as String,CEOFistName: null == CEOFistName ? _self.CEOFistName : CEOFistName // ignore: cast_nullable_to_non_nullable
as String,CEOSecondName: null == CEOSecondName ? _self.CEOSecondName : CEOSecondName // ignore: cast_nullable_to_non_nullable
as String,colonType: null == colonType ? _self.colonType : colonType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
