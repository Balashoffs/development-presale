// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_sign_pojo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonSignPojo {

 int get id; String get fistName; String get secondName; String get lastName; String get jobTitle; String get companyTitle; String get phoneNumber; String get jobEmail;
/// Create a copy of PersonSignPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonSignPojoCopyWith<PersonSignPojo> get copyWith => _$PersonSignPojoCopyWithImpl<PersonSignPojo>(this as PersonSignPojo, _$identity);

  /// Serializes this PersonSignPojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonSignPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.fistName, fistName) || other.fistName == fistName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyTitle, companyTitle) || other.companyTitle == companyTitle)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.jobEmail, jobEmail) || other.jobEmail == jobEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fistName,secondName,lastName,jobTitle,companyTitle,phoneNumber,jobEmail);

@override
String toString() {
  return 'PersonSignPojo(id: $id, fistName: $fistName, secondName: $secondName, lastName: $lastName, jobTitle: $jobTitle, companyTitle: $companyTitle, phoneNumber: $phoneNumber, jobEmail: $jobEmail)';
}


}

/// @nodoc
abstract mixin class $PersonSignPojoCopyWith<$Res>  {
  factory $PersonSignPojoCopyWith(PersonSignPojo value, $Res Function(PersonSignPojo) _then) = _$PersonSignPojoCopyWithImpl;
@useResult
$Res call({
 int id, String fistName, String secondName, String lastName, String jobTitle, String companyTitle, String phoneNumber, String jobEmail
});




}
/// @nodoc
class _$PersonSignPojoCopyWithImpl<$Res>
    implements $PersonSignPojoCopyWith<$Res> {
  _$PersonSignPojoCopyWithImpl(this._self, this._then);

  final PersonSignPojo _self;
  final $Res Function(PersonSignPojo) _then;

/// Create a copy of PersonSignPojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fistName = null,Object? secondName = null,Object? lastName = null,Object? jobTitle = null,Object? companyTitle = null,Object? phoneNumber = null,Object? jobEmail = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fistName: null == fistName ? _self.fistName : fistName // ignore: cast_nullable_to_non_nullable
as String,secondName: null == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,companyTitle: null == companyTitle ? _self.companyTitle : companyTitle // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,jobEmail: null == jobEmail ? _self.jobEmail : jobEmail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonSignPojo].
extension PersonSignPojoPatterns on PersonSignPojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonSignPojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonSignPojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonSignPojo value)  $default,){
final _that = this;
switch (_that) {
case _PersonSignPojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonSignPojo value)?  $default,){
final _that = this;
switch (_that) {
case _PersonSignPojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String fistName,  String secondName,  String lastName,  String jobTitle,  String companyTitle,  String phoneNumber,  String jobEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonSignPojo() when $default != null:
return $default(_that.id,_that.fistName,_that.secondName,_that.lastName,_that.jobTitle,_that.companyTitle,_that.phoneNumber,_that.jobEmail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String fistName,  String secondName,  String lastName,  String jobTitle,  String companyTitle,  String phoneNumber,  String jobEmail)  $default,) {final _that = this;
switch (_that) {
case _PersonSignPojo():
return $default(_that.id,_that.fistName,_that.secondName,_that.lastName,_that.jobTitle,_that.companyTitle,_that.phoneNumber,_that.jobEmail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String fistName,  String secondName,  String lastName,  String jobTitle,  String companyTitle,  String phoneNumber,  String jobEmail)?  $default,) {final _that = this;
switch (_that) {
case _PersonSignPojo() when $default != null:
return $default(_that.id,_that.fistName,_that.secondName,_that.lastName,_that.jobTitle,_that.companyTitle,_that.phoneNumber,_that.jobEmail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonSignPojo implements PersonSignPojo {
  const _PersonSignPojo({required this.id, required this.fistName, required this.secondName, required this.lastName, required this.jobTitle, required this.companyTitle, required this.phoneNumber, required this.jobEmail});
  factory _PersonSignPojo.fromJson(Map<String, dynamic> json) => _$PersonSignPojoFromJson(json);

@override final  int id;
@override final  String fistName;
@override final  String secondName;
@override final  String lastName;
@override final  String jobTitle;
@override final  String companyTitle;
@override final  String phoneNumber;
@override final  String jobEmail;

/// Create a copy of PersonSignPojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonSignPojoCopyWith<_PersonSignPojo> get copyWith => __$PersonSignPojoCopyWithImpl<_PersonSignPojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonSignPojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonSignPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.fistName, fistName) || other.fistName == fistName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyTitle, companyTitle) || other.companyTitle == companyTitle)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.jobEmail, jobEmail) || other.jobEmail == jobEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fistName,secondName,lastName,jobTitle,companyTitle,phoneNumber,jobEmail);

@override
String toString() {
  return 'PersonSignPojo(id: $id, fistName: $fistName, secondName: $secondName, lastName: $lastName, jobTitle: $jobTitle, companyTitle: $companyTitle, phoneNumber: $phoneNumber, jobEmail: $jobEmail)';
}


}

/// @nodoc
abstract mixin class _$PersonSignPojoCopyWith<$Res> implements $PersonSignPojoCopyWith<$Res> {
  factory _$PersonSignPojoCopyWith(_PersonSignPojo value, $Res Function(_PersonSignPojo) _then) = __$PersonSignPojoCopyWithImpl;
@override @useResult
$Res call({
 int id, String fistName, String secondName, String lastName, String jobTitle, String companyTitle, String phoneNumber, String jobEmail
});




}
/// @nodoc
class __$PersonSignPojoCopyWithImpl<$Res>
    implements _$PersonSignPojoCopyWith<$Res> {
  __$PersonSignPojoCopyWithImpl(this._self, this._then);

  final _PersonSignPojo _self;
  final $Res Function(_PersonSignPojo) _then;

/// Create a copy of PersonSignPojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fistName = null,Object? secondName = null,Object? lastName = null,Object? jobTitle = null,Object? companyTitle = null,Object? phoneNumber = null,Object? jobEmail = null,}) {
  return _then(_PersonSignPojo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fistName: null == fistName ? _self.fistName : fistName // ignore: cast_nullable_to_non_nullable
as String,secondName: null == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,companyTitle: null == companyTitle ? _self.companyTitle : companyTitle // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,jobEmail: null == jobEmail ? _self.jobEmail : jobEmail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
