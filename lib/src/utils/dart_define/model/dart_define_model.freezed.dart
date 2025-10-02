// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dart_define_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DartDefineModel {

 String get type; String get ui; DesignClass get design; String get user; String get tg; String get ya; String get appName; String get createdDate; String get version; String get api;
/// Create a copy of DartDefineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartDefineModelCopyWith<DartDefineModel> get copyWith => _$DartDefineModelCopyWithImpl<DartDefineModel>(this as DartDefineModel, _$identity);

  /// Serializes this DartDefineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartDefineModel&&(identical(other.type, type) || other.type == type)&&(identical(other.ui, ui) || other.ui == ui)&&(identical(other.design, design) || other.design == design)&&(identical(other.user, user) || other.user == user)&&(identical(other.tg, tg) || other.tg == tg)&&(identical(other.ya, ya) || other.ya == ya)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.version, version) || other.version == version)&&(identical(other.api, api) || other.api == api));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ui,design,user,tg,ya,appName,createdDate,version,api);

@override
String toString() {
  return 'DartDefineModel(type: $type, ui: $ui, design: $design, user: $user, tg: $tg, ya: $ya, appName: $appName, createdDate: $createdDate, version: $version, api: $api)';
}


}

/// @nodoc
abstract mixin class $DartDefineModelCopyWith<$Res>  {
  factory $DartDefineModelCopyWith(DartDefineModel value, $Res Function(DartDefineModel) _then) = _$DartDefineModelCopyWithImpl;
@useResult
$Res call({
 String type, String ui, DesignClass design, String user, String tg, String ya, String appName, String createdDate, String version, String api
});


$DesignClassCopyWith<$Res> get design;

}
/// @nodoc
class _$DartDefineModelCopyWithImpl<$Res>
    implements $DartDefineModelCopyWith<$Res> {
  _$DartDefineModelCopyWithImpl(this._self, this._then);

  final DartDefineModel _self;
  final $Res Function(DartDefineModel) _then;

/// Create a copy of DartDefineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? ui = null,Object? design = null,Object? user = null,Object? tg = null,Object? ya = null,Object? appName = null,Object? createdDate = null,Object? version = null,Object? api = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,ui: null == ui ? _self.ui : ui // ignore: cast_nullable_to_non_nullable
as String,design: null == design ? _self.design : design // ignore: cast_nullable_to_non_nullable
as DesignClass,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,tg: null == tg ? _self.tg : tg // ignore: cast_nullable_to_non_nullable
as String,ya: null == ya ? _self.ya : ya // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of DartDefineModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignClassCopyWith<$Res> get design {
  
  return $DesignClassCopyWith<$Res>(_self.design, (value) {
    return _then(_self.copyWith(design: value));
  });
}
}


/// Adds pattern-matching-related methods to [DartDefineModel].
extension DartDefineModelPatterns on DartDefineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DartDefineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DartDefineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DartDefineModel value)  $default,){
final _that = this;
switch (_that) {
case _DartDefineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DartDefineModel value)?  $default,){
final _that = this;
switch (_that) {
case _DartDefineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String ui,  DesignClass design,  String user,  String tg,  String ya,  String appName,  String createdDate,  String version,  String api)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DartDefineModel() when $default != null:
return $default(_that.type,_that.ui,_that.design,_that.user,_that.tg,_that.ya,_that.appName,_that.createdDate,_that.version,_that.api);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String ui,  DesignClass design,  String user,  String tg,  String ya,  String appName,  String createdDate,  String version,  String api)  $default,) {final _that = this;
switch (_that) {
case _DartDefineModel():
return $default(_that.type,_that.ui,_that.design,_that.user,_that.tg,_that.ya,_that.appName,_that.createdDate,_that.version,_that.api);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String ui,  DesignClass design,  String user,  String tg,  String ya,  String appName,  String createdDate,  String version,  String api)?  $default,) {final _that = this;
switch (_that) {
case _DartDefineModel() when $default != null:
return $default(_that.type,_that.ui,_that.design,_that.user,_that.tg,_that.ya,_that.appName,_that.createdDate,_that.version,_that.api);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DartDefineModel implements DartDefineModel {
  const _DartDefineModel({required this.type, required this.ui, required this.design, required this.user, required this.tg, required this.ya, required this.appName, required this.createdDate, required this.version, required this.api});
  factory _DartDefineModel.fromJson(Map<String, dynamic> json) => _$DartDefineModelFromJson(json);

@override final  String type;
@override final  String ui;
@override final  DesignClass design;
@override final  String user;
@override final  String tg;
@override final  String ya;
@override final  String appName;
@override final  String createdDate;
@override final  String version;
@override final  String api;

/// Create a copy of DartDefineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DartDefineModelCopyWith<_DartDefineModel> get copyWith => __$DartDefineModelCopyWithImpl<_DartDefineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DartDefineModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DartDefineModel&&(identical(other.type, type) || other.type == type)&&(identical(other.ui, ui) || other.ui == ui)&&(identical(other.design, design) || other.design == design)&&(identical(other.user, user) || other.user == user)&&(identical(other.tg, tg) || other.tg == tg)&&(identical(other.ya, ya) || other.ya == ya)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.version, version) || other.version == version)&&(identical(other.api, api) || other.api == api));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ui,design,user,tg,ya,appName,createdDate,version,api);

@override
String toString() {
  return 'DartDefineModel(type: $type, ui: $ui, design: $design, user: $user, tg: $tg, ya: $ya, appName: $appName, createdDate: $createdDate, version: $version, api: $api)';
}


}

/// @nodoc
abstract mixin class _$DartDefineModelCopyWith<$Res> implements $DartDefineModelCopyWith<$Res> {
  factory _$DartDefineModelCopyWith(_DartDefineModel value, $Res Function(_DartDefineModel) _then) = __$DartDefineModelCopyWithImpl;
@override @useResult
$Res call({
 String type, String ui, DesignClass design, String user, String tg, String ya, String appName, String createdDate, String version, String api
});


@override $DesignClassCopyWith<$Res> get design;

}
/// @nodoc
class __$DartDefineModelCopyWithImpl<$Res>
    implements _$DartDefineModelCopyWith<$Res> {
  __$DartDefineModelCopyWithImpl(this._self, this._then);

  final _DartDefineModel _self;
  final $Res Function(_DartDefineModel) _then;

/// Create a copy of DartDefineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? ui = null,Object? design = null,Object? user = null,Object? tg = null,Object? ya = null,Object? appName = null,Object? createdDate = null,Object? version = null,Object? api = null,}) {
  return _then(_DartDefineModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,ui: null == ui ? _self.ui : ui // ignore: cast_nullable_to_non_nullable
as String,design: null == design ? _self.design : design // ignore: cast_nullable_to_non_nullable
as DesignClass,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,tg: null == tg ? _self.tg : tg // ignore: cast_nullable_to_non_nullable
as String,ya: null == ya ? _self.ya : ya // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DartDefineModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignClassCopyWith<$Res> get design {
  
  return $DesignClassCopyWith<$Res>(_self.design, (value) {
    return _then(_self.copyWith(design: value));
  });
}
}

// dart format on
