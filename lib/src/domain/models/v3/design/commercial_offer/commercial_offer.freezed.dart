// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commercial_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommercialOfferResult {

 InputDataDesign get inputDataDesign; List<DivisionResult> get divisionResults; double get designOfferSummaryCost; double get designOfferSummaryTax; double get designOfferTax; FooterData get footerData;
/// Create a copy of CommercialOfferResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommercialOfferResultCopyWith<CommercialOfferResult> get copyWith => _$CommercialOfferResultCopyWithImpl<CommercialOfferResult>(this as CommercialOfferResult, _$identity);

  /// Serializes this CommercialOfferResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommercialOfferResult&&(identical(other.inputDataDesign, inputDataDesign) || other.inputDataDesign == inputDataDesign)&&const DeepCollectionEquality().equals(other.divisionResults, divisionResults)&&(identical(other.designOfferSummaryCost, designOfferSummaryCost) || other.designOfferSummaryCost == designOfferSummaryCost)&&(identical(other.designOfferSummaryTax, designOfferSummaryTax) || other.designOfferSummaryTax == designOfferSummaryTax)&&(identical(other.designOfferTax, designOfferTax) || other.designOfferTax == designOfferTax)&&(identical(other.footerData, footerData) || other.footerData == footerData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputDataDesign,const DeepCollectionEquality().hash(divisionResults),designOfferSummaryCost,designOfferSummaryTax,designOfferTax,footerData);

@override
String toString() {
  return 'CommercialOfferResult(inputDataDesign: $inputDataDesign, divisionResults: $divisionResults, designOfferSummaryCost: $designOfferSummaryCost, designOfferSummaryTax: $designOfferSummaryTax, designOfferTax: $designOfferTax, footerData: $footerData)';
}


}

/// @nodoc
abstract mixin class $CommercialOfferResultCopyWith<$Res>  {
  factory $CommercialOfferResultCopyWith(CommercialOfferResult value, $Res Function(CommercialOfferResult) _then) = _$CommercialOfferResultCopyWithImpl;
@useResult
$Res call({
 InputDataDesign inputDataDesign, List<DivisionResult> divisionResults, double designOfferSummaryCost, double designOfferSummaryTax, double designOfferTax, FooterData footerData
});


$InputDataDesignCopyWith<$Res> get inputDataDesign;$FooterDataCopyWith<$Res> get footerData;

}
/// @nodoc
class _$CommercialOfferResultCopyWithImpl<$Res>
    implements $CommercialOfferResultCopyWith<$Res> {
  _$CommercialOfferResultCopyWithImpl(this._self, this._then);

  final CommercialOfferResult _self;
  final $Res Function(CommercialOfferResult) _then;

/// Create a copy of CommercialOfferResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputDataDesign = null,Object? divisionResults = null,Object? designOfferSummaryCost = null,Object? designOfferSummaryTax = null,Object? designOfferTax = null,Object? footerData = null,}) {
  return _then(_self.copyWith(
inputDataDesign: null == inputDataDesign ? _self.inputDataDesign : inputDataDesign // ignore: cast_nullable_to_non_nullable
as InputDataDesign,divisionResults: null == divisionResults ? _self.divisionResults : divisionResults // ignore: cast_nullable_to_non_nullable
as List<DivisionResult>,designOfferSummaryCost: null == designOfferSummaryCost ? _self.designOfferSummaryCost : designOfferSummaryCost // ignore: cast_nullable_to_non_nullable
as double,designOfferSummaryTax: null == designOfferSummaryTax ? _self.designOfferSummaryTax : designOfferSummaryTax // ignore: cast_nullable_to_non_nullable
as double,designOfferTax: null == designOfferTax ? _self.designOfferTax : designOfferTax // ignore: cast_nullable_to_non_nullable
as double,footerData: null == footerData ? _self.footerData : footerData // ignore: cast_nullable_to_non_nullable
as FooterData,
  ));
}
/// Create a copy of CommercialOfferResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputDataDesignCopyWith<$Res> get inputDataDesign {
  
  return $InputDataDesignCopyWith<$Res>(_self.inputDataDesign, (value) {
    return _then(_self.copyWith(inputDataDesign: value));
  });
}/// Create a copy of CommercialOfferResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FooterDataCopyWith<$Res> get footerData {
  
  return $FooterDataCopyWith<$Res>(_self.footerData, (value) {
    return _then(_self.copyWith(footerData: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommercialOfferResult].
extension CommercialOfferResultPatterns on CommercialOfferResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommercialOfferResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommercialOfferResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommercialOfferResult value)  $default,){
final _that = this;
switch (_that) {
case _CommercialOfferResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommercialOfferResult value)?  $default,){
final _that = this;
switch (_that) {
case _CommercialOfferResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InputDataDesign inputDataDesign,  List<DivisionResult> divisionResults,  double designOfferSummaryCost,  double designOfferSummaryTax,  double designOfferTax,  FooterData footerData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommercialOfferResult() when $default != null:
return $default(_that.inputDataDesign,_that.divisionResults,_that.designOfferSummaryCost,_that.designOfferSummaryTax,_that.designOfferTax,_that.footerData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InputDataDesign inputDataDesign,  List<DivisionResult> divisionResults,  double designOfferSummaryCost,  double designOfferSummaryTax,  double designOfferTax,  FooterData footerData)  $default,) {final _that = this;
switch (_that) {
case _CommercialOfferResult():
return $default(_that.inputDataDesign,_that.divisionResults,_that.designOfferSummaryCost,_that.designOfferSummaryTax,_that.designOfferTax,_that.footerData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InputDataDesign inputDataDesign,  List<DivisionResult> divisionResults,  double designOfferSummaryCost,  double designOfferSummaryTax,  double designOfferTax,  FooterData footerData)?  $default,) {final _that = this;
switch (_that) {
case _CommercialOfferResult() when $default != null:
return $default(_that.inputDataDesign,_that.divisionResults,_that.designOfferSummaryCost,_that.designOfferSummaryTax,_that.designOfferTax,_that.footerData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommercialOfferResult implements CommercialOfferResult {
  const _CommercialOfferResult({required this.inputDataDesign, required final  List<DivisionResult> divisionResults, required this.designOfferSummaryCost, required this.designOfferSummaryTax, required this.designOfferTax, required this.footerData}): _divisionResults = divisionResults;
  factory _CommercialOfferResult.fromJson(Map<String, dynamic> json) => _$CommercialOfferResultFromJson(json);

@override final  InputDataDesign inputDataDesign;
 final  List<DivisionResult> _divisionResults;
@override List<DivisionResult> get divisionResults {
  if (_divisionResults is EqualUnmodifiableListView) return _divisionResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_divisionResults);
}

@override final  double designOfferSummaryCost;
@override final  double designOfferSummaryTax;
@override final  double designOfferTax;
@override final  FooterData footerData;

/// Create a copy of CommercialOfferResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommercialOfferResultCopyWith<_CommercialOfferResult> get copyWith => __$CommercialOfferResultCopyWithImpl<_CommercialOfferResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommercialOfferResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommercialOfferResult&&(identical(other.inputDataDesign, inputDataDesign) || other.inputDataDesign == inputDataDesign)&&const DeepCollectionEquality().equals(other._divisionResults, _divisionResults)&&(identical(other.designOfferSummaryCost, designOfferSummaryCost) || other.designOfferSummaryCost == designOfferSummaryCost)&&(identical(other.designOfferSummaryTax, designOfferSummaryTax) || other.designOfferSummaryTax == designOfferSummaryTax)&&(identical(other.designOfferTax, designOfferTax) || other.designOfferTax == designOfferTax)&&(identical(other.footerData, footerData) || other.footerData == footerData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputDataDesign,const DeepCollectionEquality().hash(_divisionResults),designOfferSummaryCost,designOfferSummaryTax,designOfferTax,footerData);

@override
String toString() {
  return 'CommercialOfferResult(inputDataDesign: $inputDataDesign, divisionResults: $divisionResults, designOfferSummaryCost: $designOfferSummaryCost, designOfferSummaryTax: $designOfferSummaryTax, designOfferTax: $designOfferTax, footerData: $footerData)';
}


}

/// @nodoc
abstract mixin class _$CommercialOfferResultCopyWith<$Res> implements $CommercialOfferResultCopyWith<$Res> {
  factory _$CommercialOfferResultCopyWith(_CommercialOfferResult value, $Res Function(_CommercialOfferResult) _then) = __$CommercialOfferResultCopyWithImpl;
@override @useResult
$Res call({
 InputDataDesign inputDataDesign, List<DivisionResult> divisionResults, double designOfferSummaryCost, double designOfferSummaryTax, double designOfferTax, FooterData footerData
});


@override $InputDataDesignCopyWith<$Res> get inputDataDesign;@override $FooterDataCopyWith<$Res> get footerData;

}
/// @nodoc
class __$CommercialOfferResultCopyWithImpl<$Res>
    implements _$CommercialOfferResultCopyWith<$Res> {
  __$CommercialOfferResultCopyWithImpl(this._self, this._then);

  final _CommercialOfferResult _self;
  final $Res Function(_CommercialOfferResult) _then;

/// Create a copy of CommercialOfferResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputDataDesign = null,Object? divisionResults = null,Object? designOfferSummaryCost = null,Object? designOfferSummaryTax = null,Object? designOfferTax = null,Object? footerData = null,}) {
  return _then(_CommercialOfferResult(
inputDataDesign: null == inputDataDesign ? _self.inputDataDesign : inputDataDesign // ignore: cast_nullable_to_non_nullable
as InputDataDesign,divisionResults: null == divisionResults ? _self._divisionResults : divisionResults // ignore: cast_nullable_to_non_nullable
as List<DivisionResult>,designOfferSummaryCost: null == designOfferSummaryCost ? _self.designOfferSummaryCost : designOfferSummaryCost // ignore: cast_nullable_to_non_nullable
as double,designOfferSummaryTax: null == designOfferSummaryTax ? _self.designOfferSummaryTax : designOfferSummaryTax // ignore: cast_nullable_to_non_nullable
as double,designOfferTax: null == designOfferTax ? _self.designOfferTax : designOfferTax // ignore: cast_nullable_to_non_nullable
as double,footerData: null == footerData ? _self.footerData : footerData // ignore: cast_nullable_to_non_nullable
as FooterData,
  ));
}

/// Create a copy of CommercialOfferResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputDataDesignCopyWith<$Res> get inputDataDesign {
  
  return $InputDataDesignCopyWith<$Res>(_self.inputDataDesign, (value) {
    return _then(_self.copyWith(inputDataDesign: value));
  });
}/// Create a copy of CommercialOfferResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FooterDataCopyWith<$Res> get footerData {
  
  return $FooterDataCopyWith<$Res>(_self.footerData, (value) {
    return _then(_self.copyWith(footerData: value));
  });
}
}

// dart format on
