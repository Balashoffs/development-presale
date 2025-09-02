// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'division_resource_calculate_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DivisionResourceCalculateState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DivisionResourceCalculateState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DivisionResourceCalculateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DivisionResourceCalculateState()';
}


}

/// @nodoc
class $DivisionResourceCalculateStateCopyWith<$Res>  {
$DivisionResourceCalculateStateCopyWith(DivisionResourceCalculateState _, $Res Function(DivisionResourceCalculateState) __);
}


/// Adds pattern-matching-related methods to [DivisionResourceCalculateState].
extension DivisionResourceCalculateStatePatterns on DivisionResourceCalculateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _NextPage value)?  nextPage,TResult Function( _ShowPage value)?  showPage,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NextPage() when nextPage != null:
return nextPage(_that);case _ShowPage() when showPage != null:
return showPage(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _NextPage value)  nextPage,required TResult Function( _ShowPage value)  showPage,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _NextPage():
return nextPage(_that);case _ShowPage():
return showPage(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _NextPage value)?  nextPage,TResult? Function( _ShowPage value)?  showPage,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NextPage() when nextPage != null:
return nextPage(_that);case _ShowPage() when showPage != null:
return showPage(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  nextPage,TResult Function()?  showPage,TResult Function( String errorText)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NextPage() when nextPage != null:
return nextPage();case _ShowPage() when showPage != null:
return showPage();case _Error() when error != null:
return error(_that.errorText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  nextPage,required TResult Function()  showPage,required TResult Function( String errorText)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _NextPage():
return nextPage();case _ShowPage():
return showPage();case _Error():
return error(_that.errorText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  nextPage,TResult? Function()?  showPage,TResult? Function( String errorText)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NextPage() when nextPage != null:
return nextPage();case _ShowPage() when showPage != null:
return showPage();case _Error() when error != null:
return error(_that.errorText);case _:
  return null;

}
}

}

/// @nodoc


class _Initial with DiagnosticableTreeMixin implements DivisionResourceCalculateState {
  const _Initial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DivisionResourceCalculateState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DivisionResourceCalculateState.initial()';
}


}




/// @nodoc


class _NextPage with DiagnosticableTreeMixin implements DivisionResourceCalculateState {
  const _NextPage();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DivisionResourceCalculateState.nextPage'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DivisionResourceCalculateState.nextPage()';
}


}




/// @nodoc


class _ShowPage with DiagnosticableTreeMixin implements DivisionResourceCalculateState {
  const _ShowPage();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DivisionResourceCalculateState.showPage'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DivisionResourceCalculateState.showPage()';
}


}




/// @nodoc


class _Error with DiagnosticableTreeMixin implements DivisionResourceCalculateState {
  const _Error(this.errorText);
  

 final  String errorText;

/// Create a copy of DivisionResourceCalculateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DivisionResourceCalculateState.error'))
    ..add(DiagnosticsProperty('errorText', errorText));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.errorText, errorText) || other.errorText == errorText));
}


@override
int get hashCode => Object.hash(runtimeType,errorText);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DivisionResourceCalculateState.error(errorText: $errorText)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DivisionResourceCalculateStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String errorText
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of DivisionResourceCalculateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorText = null,}) {
  return _then(_Error(
null == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
