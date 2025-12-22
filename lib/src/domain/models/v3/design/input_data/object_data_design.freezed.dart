// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'object_data_design.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ObjectDataDesign {

//Заказчик
 String get customer;//Имя объекта
 String get name;// Адрес объекта
 String get address;// Площадь объекта
 int get square;// Сроки работ
 int get deadlineValue;
/// Create a copy of ObjectDataDesign
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObjectDataDesignCopyWith<ObjectDataDesign> get copyWith => _$ObjectDataDesignCopyWithImpl<ObjectDataDesign>(this as ObjectDataDesign, _$identity);

  /// Serializes this ObjectDataDesign to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObjectDataDesign&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.square, square) || other.square == square)&&(identical(other.deadlineValue, deadlineValue) || other.deadlineValue == deadlineValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer,name,address,square,deadlineValue);

@override
String toString() {
  return 'ObjectDataDesign(customer: $customer, name: $name, address: $address, square: $square, deadlineValue: $deadlineValue)';
}


}

/// @nodoc
abstract mixin class $ObjectDataDesignCopyWith<$Res>  {
  factory $ObjectDataDesignCopyWith(ObjectDataDesign value, $Res Function(ObjectDataDesign) _then) = _$ObjectDataDesignCopyWithImpl;
@useResult
$Res call({
 String customer, String name, String address, int square, int deadlineValue
});




}
/// @nodoc
class _$ObjectDataDesignCopyWithImpl<$Res>
    implements $ObjectDataDesignCopyWith<$Res> {
  _$ObjectDataDesignCopyWithImpl(this._self, this._then);

  final ObjectDataDesign _self;
  final $Res Function(ObjectDataDesign) _then;

/// Create a copy of ObjectDataDesign
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customer = null,Object? name = null,Object? address = null,Object? square = null,Object? deadlineValue = null,}) {
  return _then(_self.copyWith(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,square: null == square ? _self.square : square // ignore: cast_nullable_to_non_nullable
as int,deadlineValue: null == deadlineValue ? _self.deadlineValue : deadlineValue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ObjectDataDesign].
extension ObjectDataDesignPatterns on ObjectDataDesign {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ObjectDataDesign value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ObjectDataDesign() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ObjectDataDesign value)  $default,){
final _that = this;
switch (_that) {
case _ObjectDataDesign():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ObjectDataDesign value)?  $default,){
final _that = this;
switch (_that) {
case _ObjectDataDesign() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String customer,  String name,  String address,  int square,  int deadlineValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ObjectDataDesign() when $default != null:
return $default(_that.customer,_that.name,_that.address,_that.square,_that.deadlineValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String customer,  String name,  String address,  int square,  int deadlineValue)  $default,) {final _that = this;
switch (_that) {
case _ObjectDataDesign():
return $default(_that.customer,_that.name,_that.address,_that.square,_that.deadlineValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String customer,  String name,  String address,  int square,  int deadlineValue)?  $default,) {final _that = this;
switch (_that) {
case _ObjectDataDesign() when $default != null:
return $default(_that.customer,_that.name,_that.address,_that.square,_that.deadlineValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ObjectDataDesign implements ObjectDataDesign {
  const _ObjectDataDesign({required this.customer, required this.name, required this.address, required this.square, required this.deadlineValue});
  factory _ObjectDataDesign.fromJson(Map<String, dynamic> json) => _$ObjectDataDesignFromJson(json);

//Заказчик
@override final  String customer;
//Имя объекта
@override final  String name;
// Адрес объекта
@override final  String address;
// Площадь объекта
@override final  int square;
// Сроки работ
@override final  int deadlineValue;

/// Create a copy of ObjectDataDesign
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObjectDataDesignCopyWith<_ObjectDataDesign> get copyWith => __$ObjectDataDesignCopyWithImpl<_ObjectDataDesign>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ObjectDataDesignToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ObjectDataDesign&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.square, square) || other.square == square)&&(identical(other.deadlineValue, deadlineValue) || other.deadlineValue == deadlineValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer,name,address,square,deadlineValue);

@override
String toString() {
  return 'ObjectDataDesign(customer: $customer, name: $name, address: $address, square: $square, deadlineValue: $deadlineValue)';
}


}

/// @nodoc
abstract mixin class _$ObjectDataDesignCopyWith<$Res> implements $ObjectDataDesignCopyWith<$Res> {
  factory _$ObjectDataDesignCopyWith(_ObjectDataDesign value, $Res Function(_ObjectDataDesign) _then) = __$ObjectDataDesignCopyWithImpl;
@override @useResult
$Res call({
 String customer, String name, String address, int square, int deadlineValue
});




}
/// @nodoc
class __$ObjectDataDesignCopyWithImpl<$Res>
    implements _$ObjectDataDesignCopyWith<$Res> {
  __$ObjectDataDesignCopyWithImpl(this._self, this._then);

  final _ObjectDataDesign _self;
  final $Res Function(_ObjectDataDesign) _then;

/// Create a copy of ObjectDataDesign
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customer = null,Object? name = null,Object? address = null,Object? square = null,Object? deadlineValue = null,}) {
  return _then(_ObjectDataDesign(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,square: null == square ? _self.square : square // ignore: cast_nullable_to_non_nullable
as int,deadlineValue: null == deadlineValue ? _self.deadlineValue : deadlineValue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
