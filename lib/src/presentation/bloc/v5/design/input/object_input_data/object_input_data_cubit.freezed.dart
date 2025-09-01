// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'object_input_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ObjectInputDataState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ObjectInputDataState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObjectInputDataState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ObjectInputDataState()';
}


}

/// @nodoc
class $ObjectInputDataStateCopyWith<$Res>  {
$ObjectInputDataStateCopyWith(ObjectInputDataState _, $Res Function(ObjectInputDataState) __);
}


/// Adds pattern-matching-related methods to [ObjectInputDataState].
extension ObjectInputDataStatePatterns on ObjectInputDataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _EnterInputData value)?  enterInputData,TResult Function( _NextPage value)?  nextPage,TResult Function( _ErrorMessage value)?  errorMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _EnterInputData() when enterInputData != null:
return enterInputData(_that);case _NextPage() when nextPage != null:
return nextPage(_that);case _ErrorMessage() when errorMessage != null:
return errorMessage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _EnterInputData value)  enterInputData,required TResult Function( _NextPage value)  nextPage,required TResult Function( _ErrorMessage value)  errorMessage,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _EnterInputData():
return enterInputData(_that);case _NextPage():
return nextPage(_that);case _ErrorMessage():
return errorMessage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _EnterInputData value)?  enterInputData,TResult? Function( _NextPage value)?  nextPage,TResult? Function( _ErrorMessage value)?  errorMessage,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _EnterInputData() when enterInputData != null:
return enterInputData(_that);case _NextPage() when nextPage != null:
return nextPage(_that);case _ErrorMessage() when errorMessage != null:
return errorMessage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  enterInputData,TResult Function()?  nextPage,TResult Function( String errorText)?  errorMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _EnterInputData() when enterInputData != null:
return enterInputData();case _NextPage() when nextPage != null:
return nextPage();case _ErrorMessage() when errorMessage != null:
return errorMessage(_that.errorText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  enterInputData,required TResult Function()  nextPage,required TResult Function( String errorText)  errorMessage,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _EnterInputData():
return enterInputData();case _NextPage():
return nextPage();case _ErrorMessage():
return errorMessage(_that.errorText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  enterInputData,TResult? Function()?  nextPage,TResult? Function( String errorText)?  errorMessage,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _EnterInputData() when enterInputData != null:
return enterInputData();case _NextPage() when nextPage != null:
return nextPage();case _ErrorMessage() when errorMessage != null:
return errorMessage(_that.errorText);case _:
  return null;

}
}

}

/// @nodoc


class _Initial with DiagnosticableTreeMixin implements ObjectInputDataState {
  const _Initial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ObjectInputDataState.initial'))
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
  return 'ObjectInputDataState.initial()';
}


}




/// @nodoc


class _EnterInputData with DiagnosticableTreeMixin implements ObjectInputDataState {
  const _EnterInputData();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ObjectInputDataState.enterInputData'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnterInputData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ObjectInputDataState.enterInputData()';
}


}




/// @nodoc


class _NextPage with DiagnosticableTreeMixin implements ObjectInputDataState {
  const _NextPage();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ObjectInputDataState.nextPage'))
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
  return 'ObjectInputDataState.nextPage()';
}


}




/// @nodoc


class _ErrorMessage with DiagnosticableTreeMixin implements ObjectInputDataState {
  const _ErrorMessage(this.errorText);
  

 final  String errorText;

/// Create a copy of ObjectInputDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorMessageCopyWith<_ErrorMessage> get copyWith => __$ErrorMessageCopyWithImpl<_ErrorMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ObjectInputDataState.errorMessage'))
    ..add(DiagnosticsProperty('errorText', errorText));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorMessage&&(identical(other.errorText, errorText) || other.errorText == errorText));
}


@override
int get hashCode => Object.hash(runtimeType,errorText);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ObjectInputDataState.errorMessage(errorText: $errorText)';
}


}

/// @nodoc
abstract mixin class _$ErrorMessageCopyWith<$Res> implements $ObjectInputDataStateCopyWith<$Res> {
  factory _$ErrorMessageCopyWith(_ErrorMessage value, $Res Function(_ErrorMessage) _then) = __$ErrorMessageCopyWithImpl;
@useResult
$Res call({
 String errorText
});




}
/// @nodoc
class __$ErrorMessageCopyWithImpl<$Res>
    implements _$ErrorMessageCopyWith<$Res> {
  __$ErrorMessageCopyWithImpl(this._self, this._then);

  final _ErrorMessage _self;
  final $Res Function(_ErrorMessage) _then;

/// Create a copy of ObjectInputDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorText = null,}) {
  return _then(_ErrorMessage(
null == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
