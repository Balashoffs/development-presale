// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'divisions_margin_row_pojo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DivisionWithAnalyticPojo {

 int get id; String get shifr; String get section; double get humanHours; double get localAnalytic; double get outsideAnalytic; double get result;
/// Create a copy of DivisionWithAnalyticPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DivisionWithAnalyticPojoCopyWith<DivisionWithAnalyticPojo> get copyWith => _$DivisionWithAnalyticPojoCopyWithImpl<DivisionWithAnalyticPojo>(this as DivisionWithAnalyticPojo, _$identity);

  /// Serializes this DivisionWithAnalyticPojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DivisionWithAnalyticPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.shifr, shifr) || other.shifr == shifr)&&(identical(other.section, section) || other.section == section)&&(identical(other.humanHours, humanHours) || other.humanHours == humanHours)&&(identical(other.localAnalytic, localAnalytic) || other.localAnalytic == localAnalytic)&&(identical(other.outsideAnalytic, outsideAnalytic) || other.outsideAnalytic == outsideAnalytic)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,shifr,section,humanHours,localAnalytic,outsideAnalytic,result);

@override
String toString() {
  return 'DivisionWithAnalyticPojo(id: $id, shifr: $shifr, section: $section, humanHours: $humanHours, localAnalytic: $localAnalytic, outsideAnalytic: $outsideAnalytic, result: $result)';
}


}

/// @nodoc
abstract mixin class $DivisionWithAnalyticPojoCopyWith<$Res>  {
  factory $DivisionWithAnalyticPojoCopyWith(DivisionWithAnalyticPojo value, $Res Function(DivisionWithAnalyticPojo) _then) = _$DivisionWithAnalyticPojoCopyWithImpl;
@useResult
$Res call({
 int id, String shifr, String section, double humanHours, double localAnalytic, double outsideAnalytic, double result
});




}
/// @nodoc
class _$DivisionWithAnalyticPojoCopyWithImpl<$Res>
    implements $DivisionWithAnalyticPojoCopyWith<$Res> {
  _$DivisionWithAnalyticPojoCopyWithImpl(this._self, this._then);

  final DivisionWithAnalyticPojo _self;
  final $Res Function(DivisionWithAnalyticPojo) _then;

/// Create a copy of DivisionWithAnalyticPojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? shifr = null,Object? section = null,Object? humanHours = null,Object? localAnalytic = null,Object? outsideAnalytic = null,Object? result = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,shifr: null == shifr ? _self.shifr : shifr // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,humanHours: null == humanHours ? _self.humanHours : humanHours // ignore: cast_nullable_to_non_nullable
as double,localAnalytic: null == localAnalytic ? _self.localAnalytic : localAnalytic // ignore: cast_nullable_to_non_nullable
as double,outsideAnalytic: null == outsideAnalytic ? _self.outsideAnalytic : outsideAnalytic // ignore: cast_nullable_to_non_nullable
as double,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DivisionWithAnalyticPojo].
extension DivisionWithAnalyticPojoPatterns on DivisionWithAnalyticPojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DivisionWithAnalyticPojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DivisionWithAnalyticPojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DivisionWithAnalyticPojo value)  $default,){
final _that = this;
switch (_that) {
case _DivisionWithAnalyticPojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DivisionWithAnalyticPojo value)?  $default,){
final _that = this;
switch (_that) {
case _DivisionWithAnalyticPojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String shifr,  String section,  double humanHours,  double localAnalytic,  double outsideAnalytic,  double result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DivisionWithAnalyticPojo() when $default != null:
return $default(_that.id,_that.shifr,_that.section,_that.humanHours,_that.localAnalytic,_that.outsideAnalytic,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String shifr,  String section,  double humanHours,  double localAnalytic,  double outsideAnalytic,  double result)  $default,) {final _that = this;
switch (_that) {
case _DivisionWithAnalyticPojo():
return $default(_that.id,_that.shifr,_that.section,_that.humanHours,_that.localAnalytic,_that.outsideAnalytic,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String shifr,  String section,  double humanHours,  double localAnalytic,  double outsideAnalytic,  double result)?  $default,) {final _that = this;
switch (_that) {
case _DivisionWithAnalyticPojo() when $default != null:
return $default(_that.id,_that.shifr,_that.section,_that.humanHours,_that.localAnalytic,_that.outsideAnalytic,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DivisionWithAnalyticPojo implements DivisionWithAnalyticPojo {
  const _DivisionWithAnalyticPojo({required this.id, required this.shifr, required this.section, required this.humanHours, required this.localAnalytic, required this.outsideAnalytic, required this.result});
  factory _DivisionWithAnalyticPojo.fromJson(Map<String, dynamic> json) => _$DivisionWithAnalyticPojoFromJson(json);

@override final  int id;
@override final  String shifr;
@override final  String section;
@override final  double humanHours;
@override final  double localAnalytic;
@override final  double outsideAnalytic;
@override final  double result;

/// Create a copy of DivisionWithAnalyticPojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DivisionWithAnalyticPojoCopyWith<_DivisionWithAnalyticPojo> get copyWith => __$DivisionWithAnalyticPojoCopyWithImpl<_DivisionWithAnalyticPojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DivisionWithAnalyticPojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DivisionWithAnalyticPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.shifr, shifr) || other.shifr == shifr)&&(identical(other.section, section) || other.section == section)&&(identical(other.humanHours, humanHours) || other.humanHours == humanHours)&&(identical(other.localAnalytic, localAnalytic) || other.localAnalytic == localAnalytic)&&(identical(other.outsideAnalytic, outsideAnalytic) || other.outsideAnalytic == outsideAnalytic)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,shifr,section,humanHours,localAnalytic,outsideAnalytic,result);

@override
String toString() {
  return 'DivisionWithAnalyticPojo(id: $id, shifr: $shifr, section: $section, humanHours: $humanHours, localAnalytic: $localAnalytic, outsideAnalytic: $outsideAnalytic, result: $result)';
}


}

/// @nodoc
abstract mixin class _$DivisionWithAnalyticPojoCopyWith<$Res> implements $DivisionWithAnalyticPojoCopyWith<$Res> {
  factory _$DivisionWithAnalyticPojoCopyWith(_DivisionWithAnalyticPojo value, $Res Function(_DivisionWithAnalyticPojo) _then) = __$DivisionWithAnalyticPojoCopyWithImpl;
@override @useResult
$Res call({
 int id, String shifr, String section, double humanHours, double localAnalytic, double outsideAnalytic, double result
});




}
/// @nodoc
class __$DivisionWithAnalyticPojoCopyWithImpl<$Res>
    implements _$DivisionWithAnalyticPojoCopyWith<$Res> {
  __$DivisionWithAnalyticPojoCopyWithImpl(this._self, this._then);

  final _DivisionWithAnalyticPojo _self;
  final $Res Function(_DivisionWithAnalyticPojo) _then;

/// Create a copy of DivisionWithAnalyticPojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? shifr = null,Object? section = null,Object? humanHours = null,Object? localAnalytic = null,Object? outsideAnalytic = null,Object? result = null,}) {
  return _then(_DivisionWithAnalyticPojo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,shifr: null == shifr ? _self.shifr : shifr // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,humanHours: null == humanHours ? _self.humanHours : humanHours // ignore: cast_nullable_to_non_nullable
as double,localAnalytic: null == localAnalytic ? _self.localAnalytic : localAnalytic // ignore: cast_nullable_to_non_nullable
as double,outsideAnalytic: null == outsideAnalytic ? _self.outsideAnalytic : outsideAnalytic // ignore: cast_nullable_to_non_nullable
as double,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
