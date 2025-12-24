// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyInfoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInfoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyInfoState()';
}


}

/// @nodoc
class $CompanyInfoStateCopyWith<$Res>  {
$CompanyInfoStateCopyWith(CompanyInfoState _, $Res Function(CompanyInfoState) __);
}


/// Adds pattern-matching-related methods to [CompanyInfoState].
extension CompanyInfoStatePatterns on CompanyInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Selecting value)?  selecting,TResult Function( _Selected value)?  selected,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Selecting() when selecting != null:
return selecting(_that);case _Selected() when selected != null:
return selected(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Selecting value)  selecting,required TResult Function( _Selected value)  selected,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Selecting():
return selecting(_that);case _Selected():
return selected(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Selecting value)?  selecting,TResult? Function( _Selected value)?  selected,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Selecting() when selecting != null:
return selecting(_that);case _Selected() when selected != null:
return selected(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<String> companies)?  selecting,TResult Function( CompanyInfoDTO info)?  selected,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Selecting() when selecting != null:
return selecting(_that.companies);case _Selected() when selected != null:
return selected(_that.info);case _Error() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<String> companies)  selecting,required TResult Function( CompanyInfoDTO info)  selected,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Selecting():
return selecting(_that.companies);case _Selected():
return selected(_that.info);case _Error():
return error();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<String> companies)?  selecting,TResult? Function( CompanyInfoDTO info)?  selected,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Selecting() when selecting != null:
return selecting(_that.companies);case _Selected() when selected != null:
return selected(_that.info);case _Error() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CompanyInfoState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyInfoState.initial()';
}


}




/// @nodoc


class _Selecting implements CompanyInfoState {
  const _Selecting(final  List<String> companies): _companies = companies;
  

 final  List<String> _companies;
 List<String> get companies {
  if (_companies is EqualUnmodifiableListView) return _companies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companies);
}


/// Create a copy of CompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectingCopyWith<_Selecting> get copyWith => __$SelectingCopyWithImpl<_Selecting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Selecting&&const DeepCollectionEquality().equals(other._companies, _companies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_companies));

@override
String toString() {
  return 'CompanyInfoState.selecting(companies: $companies)';
}


}

/// @nodoc
abstract mixin class _$SelectingCopyWith<$Res> implements $CompanyInfoStateCopyWith<$Res> {
  factory _$SelectingCopyWith(_Selecting value, $Res Function(_Selecting) _then) = __$SelectingCopyWithImpl;
@useResult
$Res call({
 List<String> companies
});




}
/// @nodoc
class __$SelectingCopyWithImpl<$Res>
    implements _$SelectingCopyWith<$Res> {
  __$SelectingCopyWithImpl(this._self, this._then);

  final _Selecting _self;
  final $Res Function(_Selecting) _then;

/// Create a copy of CompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companies = null,}) {
  return _then(_Selecting(
null == companies ? _self._companies : companies // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class _Selected implements CompanyInfoState {
  const _Selected(this.info);
  

 final  CompanyInfoDTO info;

/// Create a copy of CompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedCopyWith<_Selected> get copyWith => __$SelectedCopyWithImpl<_Selected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Selected&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'CompanyInfoState.selected(info: $info)';
}


}

/// @nodoc
abstract mixin class _$SelectedCopyWith<$Res> implements $CompanyInfoStateCopyWith<$Res> {
  factory _$SelectedCopyWith(_Selected value, $Res Function(_Selected) _then) = __$SelectedCopyWithImpl;
@useResult
$Res call({
 CompanyInfoDTO info
});




}
/// @nodoc
class __$SelectedCopyWithImpl<$Res>
    implements _$SelectedCopyWith<$Res> {
  __$SelectedCopyWithImpl(this._self, this._then);

  final _Selected _self;
  final $Res Function(_Selected) _then;

/// Create a copy of CompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(_Selected(
null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as CompanyInfoDTO,
  ));
}


}

/// @nodoc


class _Error implements CompanyInfoState {
  const _Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyInfoState.error()';
}


}




// dart format on
