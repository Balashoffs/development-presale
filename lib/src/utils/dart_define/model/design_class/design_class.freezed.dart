// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignClass {

@JsonKey(name: 'job_divisions') String get workDivisions;@JsonKey(name: 'project_divisions') String get projectDivisions; String get resources;@JsonKey(name: 'local_analytic') String get localAnalytic;@JsonKey(name: 'external_analytic') String get externalAnalytic;
/// Create a copy of DesignClass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignClassCopyWith<DesignClass> get copyWith => _$DesignClassCopyWithImpl<DesignClass>(this as DesignClass, _$identity);

  /// Serializes this DesignClass to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignClass&&(identical(other.workDivisions, workDivisions) || other.workDivisions == workDivisions)&&(identical(other.projectDivisions, projectDivisions) || other.projectDivisions == projectDivisions)&&(identical(other.resources, resources) || other.resources == resources)&&(identical(other.localAnalytic, localAnalytic) || other.localAnalytic == localAnalytic)&&(identical(other.externalAnalytic, externalAnalytic) || other.externalAnalytic == externalAnalytic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workDivisions,projectDivisions,resources,localAnalytic,externalAnalytic);

@override
String toString() {
  return 'DesignClass(workDivisions: $workDivisions, projectDivisions: $projectDivisions, resources: $resources, localAnalytic: $localAnalytic, externalAnalytic: $externalAnalytic)';
}


}

/// @nodoc
abstract mixin class $DesignClassCopyWith<$Res>  {
  factory $DesignClassCopyWith(DesignClass value, $Res Function(DesignClass) _then) = _$DesignClassCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'job_divisions') String workDivisions,@JsonKey(name: 'project_divisions') String projectDivisions, String resources,@JsonKey(name: 'local_analytic') String localAnalytic,@JsonKey(name: 'external_analytic') String externalAnalytic
});




}
/// @nodoc
class _$DesignClassCopyWithImpl<$Res>
    implements $DesignClassCopyWith<$Res> {
  _$DesignClassCopyWithImpl(this._self, this._then);

  final DesignClass _self;
  final $Res Function(DesignClass) _then;

/// Create a copy of DesignClass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workDivisions = null,Object? projectDivisions = null,Object? resources = null,Object? localAnalytic = null,Object? externalAnalytic = null,}) {
  return _then(_self.copyWith(
workDivisions: null == workDivisions ? _self.workDivisions : workDivisions // ignore: cast_nullable_to_non_nullable
as String,projectDivisions: null == projectDivisions ? _self.projectDivisions : projectDivisions // ignore: cast_nullable_to_non_nullable
as String,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as String,localAnalytic: null == localAnalytic ? _self.localAnalytic : localAnalytic // ignore: cast_nullable_to_non_nullable
as String,externalAnalytic: null == externalAnalytic ? _self.externalAnalytic : externalAnalytic // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DesignClass].
extension DesignClassPatterns on DesignClass {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignClass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignClass() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignClass value)  $default,){
final _that = this;
switch (_that) {
case _DesignClass():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignClass value)?  $default,){
final _that = this;
switch (_that) {
case _DesignClass() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'job_divisions')  String workDivisions, @JsonKey(name: 'project_divisions')  String projectDivisions,  String resources, @JsonKey(name: 'local_analytic')  String localAnalytic, @JsonKey(name: 'external_analytic')  String externalAnalytic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignClass() when $default != null:
return $default(_that.workDivisions,_that.projectDivisions,_that.resources,_that.localAnalytic,_that.externalAnalytic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'job_divisions')  String workDivisions, @JsonKey(name: 'project_divisions')  String projectDivisions,  String resources, @JsonKey(name: 'local_analytic')  String localAnalytic, @JsonKey(name: 'external_analytic')  String externalAnalytic)  $default,) {final _that = this;
switch (_that) {
case _DesignClass():
return $default(_that.workDivisions,_that.projectDivisions,_that.resources,_that.localAnalytic,_that.externalAnalytic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'job_divisions')  String workDivisions, @JsonKey(name: 'project_divisions')  String projectDivisions,  String resources, @JsonKey(name: 'local_analytic')  String localAnalytic, @JsonKey(name: 'external_analytic')  String externalAnalytic)?  $default,) {final _that = this;
switch (_that) {
case _DesignClass() when $default != null:
return $default(_that.workDivisions,_that.projectDivisions,_that.resources,_that.localAnalytic,_that.externalAnalytic);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DesignClass implements DesignClass {
  const _DesignClass({@JsonKey(name: 'job_divisions') required this.workDivisions, @JsonKey(name: 'project_divisions') required this.projectDivisions, required this.resources, @JsonKey(name: 'local_analytic') required this.localAnalytic, @JsonKey(name: 'external_analytic') required this.externalAnalytic});
  factory _DesignClass.fromJson(Map<String, dynamic> json) => _$DesignClassFromJson(json);

@override@JsonKey(name: 'job_divisions') final  String workDivisions;
@override@JsonKey(name: 'project_divisions') final  String projectDivisions;
@override final  String resources;
@override@JsonKey(name: 'local_analytic') final  String localAnalytic;
@override@JsonKey(name: 'external_analytic') final  String externalAnalytic;

/// Create a copy of DesignClass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignClassCopyWith<_DesignClass> get copyWith => __$DesignClassCopyWithImpl<_DesignClass>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignClassToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignClass&&(identical(other.workDivisions, workDivisions) || other.workDivisions == workDivisions)&&(identical(other.projectDivisions, projectDivisions) || other.projectDivisions == projectDivisions)&&(identical(other.resources, resources) || other.resources == resources)&&(identical(other.localAnalytic, localAnalytic) || other.localAnalytic == localAnalytic)&&(identical(other.externalAnalytic, externalAnalytic) || other.externalAnalytic == externalAnalytic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workDivisions,projectDivisions,resources,localAnalytic,externalAnalytic);

@override
String toString() {
  return 'DesignClass(workDivisions: $workDivisions, projectDivisions: $projectDivisions, resources: $resources, localAnalytic: $localAnalytic, externalAnalytic: $externalAnalytic)';
}


}

/// @nodoc
abstract mixin class _$DesignClassCopyWith<$Res> implements $DesignClassCopyWith<$Res> {
  factory _$DesignClassCopyWith(_DesignClass value, $Res Function(_DesignClass) _then) = __$DesignClassCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'job_divisions') String workDivisions,@JsonKey(name: 'project_divisions') String projectDivisions, String resources,@JsonKey(name: 'local_analytic') String localAnalytic,@JsonKey(name: 'external_analytic') String externalAnalytic
});




}
/// @nodoc
class __$DesignClassCopyWithImpl<$Res>
    implements _$DesignClassCopyWith<$Res> {
  __$DesignClassCopyWithImpl(this._self, this._then);

  final _DesignClass _self;
  final $Res Function(_DesignClass) _then;

/// Create a copy of DesignClass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workDivisions = null,Object? projectDivisions = null,Object? resources = null,Object? localAnalytic = null,Object? externalAnalytic = null,}) {
  return _then(_DesignClass(
workDivisions: null == workDivisions ? _self.workDivisions : workDivisions // ignore: cast_nullable_to_non_nullable
as String,projectDivisions: null == projectDivisions ? _self.projectDivisions : projectDivisions // ignore: cast_nullable_to_non_nullable
as String,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as String,localAnalytic: null == localAnalytic ? _self.localAnalytic : localAnalytic // ignore: cast_nullable_to_non_nullable
as String,externalAnalytic: null == externalAnalytic ? _self.externalAnalytic : externalAnalytic // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
