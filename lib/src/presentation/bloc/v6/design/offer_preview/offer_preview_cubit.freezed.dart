// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_preview_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfferPreviewState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferPreviewState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfferPreviewState()';
}


}

/// @nodoc
class $OfferPreviewStateCopyWith<$Res>  {
$OfferPreviewStateCopyWith(OfferPreviewState _, $Res Function(OfferPreviewState) __);
}


/// Adds pattern-matching-related methods to [OfferPreviewState].
extension OfferPreviewStatePatterns on OfferPreviewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Show value)?  show,TResult Function( _Picked value)?  picked,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Show() when show != null:
return show(_that);case _Picked() when picked != null:
return picked(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Show value)  show,required TResult Function( _Picked value)  picked,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Show():
return show(_that);case _Picked():
return picked(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Show value)?  show,TResult? Function( _Picked value)?  picked,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Show() when show != null:
return show(_that);case _Picked() when picked != null:
return picked(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  show,TResult Function()?  picked,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Show() when show != null:
return show();case _Picked() when picked != null:
return picked();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  show,required TResult Function()  picked,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Show():
return show();case _Picked():
return picked();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  show,TResult? Function()?  picked,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Show() when show != null:
return show();case _Picked() when picked != null:
return picked();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OfferPreviewState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfferPreviewState.initial()';
}


}




/// @nodoc


class _Show implements OfferPreviewState {
  const _Show();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Show);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfferPreviewState.show()';
}


}




/// @nodoc


class _Picked implements OfferPreviewState {
  const _Picked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Picked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfferPreviewState.picked()';
}


}




// dart format on
