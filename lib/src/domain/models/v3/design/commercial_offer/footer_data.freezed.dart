// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'footer_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FooterData {

 String get noteText; String get workCompletionTime; String get prepayment; PersonSignPojo get personSign;
/// Create a copy of FooterData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FooterDataCopyWith<FooterData> get copyWith => _$FooterDataCopyWithImpl<FooterData>(this as FooterData, _$identity);

  /// Serializes this FooterData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FooterData&&(identical(other.noteText, noteText) || other.noteText == noteText)&&(identical(other.workCompletionTime, workCompletionTime) || other.workCompletionTime == workCompletionTime)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.personSign, personSign) || other.personSign == personSign));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,noteText,workCompletionTime,prepayment,personSign);

@override
String toString() {
  return 'FooterData(noteText: $noteText, workCompletionTime: $workCompletionTime, prepayment: $prepayment, personSign: $personSign)';
}


}

/// @nodoc
abstract mixin class $FooterDataCopyWith<$Res>  {
  factory $FooterDataCopyWith(FooterData value, $Res Function(FooterData) _then) = _$FooterDataCopyWithImpl;
@useResult
$Res call({
 String noteText, String workCompletionTime, String prepayment, PersonSignPojo personSign
});


$PersonSignPojoCopyWith<$Res> get personSign;

}
/// @nodoc
class _$FooterDataCopyWithImpl<$Res>
    implements $FooterDataCopyWith<$Res> {
  _$FooterDataCopyWithImpl(this._self, this._then);

  final FooterData _self;
  final $Res Function(FooterData) _then;

/// Create a copy of FooterData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? noteText = null,Object? workCompletionTime = null,Object? prepayment = null,Object? personSign = null,}) {
  return _then(_self.copyWith(
noteText: null == noteText ? _self.noteText : noteText // ignore: cast_nullable_to_non_nullable
as String,workCompletionTime: null == workCompletionTime ? _self.workCompletionTime : workCompletionTime // ignore: cast_nullable_to_non_nullable
as String,prepayment: null == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as String,personSign: null == personSign ? _self.personSign : personSign // ignore: cast_nullable_to_non_nullable
as PersonSignPojo,
  ));
}
/// Create a copy of FooterData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonSignPojoCopyWith<$Res> get personSign {
  
  return $PersonSignPojoCopyWith<$Res>(_self.personSign, (value) {
    return _then(_self.copyWith(personSign: value));
  });
}
}


/// Adds pattern-matching-related methods to [FooterData].
extension FooterDataPatterns on FooterData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FooterData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FooterData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FooterData value)  $default,){
final _that = this;
switch (_that) {
case _FooterData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FooterData value)?  $default,){
final _that = this;
switch (_that) {
case _FooterData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String noteText,  String workCompletionTime,  String prepayment,  PersonSignPojo personSign)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FooterData() when $default != null:
return $default(_that.noteText,_that.workCompletionTime,_that.prepayment,_that.personSign);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String noteText,  String workCompletionTime,  String prepayment,  PersonSignPojo personSign)  $default,) {final _that = this;
switch (_that) {
case _FooterData():
return $default(_that.noteText,_that.workCompletionTime,_that.prepayment,_that.personSign);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String noteText,  String workCompletionTime,  String prepayment,  PersonSignPojo personSign)?  $default,) {final _that = this;
switch (_that) {
case _FooterData() when $default != null:
return $default(_that.noteText,_that.workCompletionTime,_that.prepayment,_that.personSign);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FooterData implements FooterData {
  const _FooterData({this.noteText = '', required this.workCompletionTime, required this.prepayment, required this.personSign});
  factory _FooterData.fromJson(Map<String, dynamic> json) => _$FooterDataFromJson(json);

@override@JsonKey() final  String noteText;
@override final  String workCompletionTime;
@override final  String prepayment;
@override final  PersonSignPojo personSign;

/// Create a copy of FooterData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FooterDataCopyWith<_FooterData> get copyWith => __$FooterDataCopyWithImpl<_FooterData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FooterDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FooterData&&(identical(other.noteText, noteText) || other.noteText == noteText)&&(identical(other.workCompletionTime, workCompletionTime) || other.workCompletionTime == workCompletionTime)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.personSign, personSign) || other.personSign == personSign));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,noteText,workCompletionTime,prepayment,personSign);

@override
String toString() {
  return 'FooterData(noteText: $noteText, workCompletionTime: $workCompletionTime, prepayment: $prepayment, personSign: $personSign)';
}


}

/// @nodoc
abstract mixin class _$FooterDataCopyWith<$Res> implements $FooterDataCopyWith<$Res> {
  factory _$FooterDataCopyWith(_FooterData value, $Res Function(_FooterData) _then) = __$FooterDataCopyWithImpl;
@override @useResult
$Res call({
 String noteText, String workCompletionTime, String prepayment, PersonSignPojo personSign
});


@override $PersonSignPojoCopyWith<$Res> get personSign;

}
/// @nodoc
class __$FooterDataCopyWithImpl<$Res>
    implements _$FooterDataCopyWith<$Res> {
  __$FooterDataCopyWithImpl(this._self, this._then);

  final _FooterData _self;
  final $Res Function(_FooterData) _then;

/// Create a copy of FooterData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? noteText = null,Object? workCompletionTime = null,Object? prepayment = null,Object? personSign = null,}) {
  return _then(_FooterData(
noteText: null == noteText ? _self.noteText : noteText // ignore: cast_nullable_to_non_nullable
as String,workCompletionTime: null == workCompletionTime ? _self.workCompletionTime : workCompletionTime // ignore: cast_nullable_to_non_nullable
as String,prepayment: null == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as String,personSign: null == personSign ? _self.personSign : personSign // ignore: cast_nullable_to_non_nullable
as PersonSignPojo,
  ));
}

/// Create a copy of FooterData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonSignPojoCopyWith<$Res> get personSign {
  
  return $PersonSignPojoCopyWith<$Res>(_self.personSign, (value) {
    return _then(_self.copyWith(personSign: value));
  });
}
}

// dart format on
