// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoices_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvoicesState {

 List<InvoiceModel> get invoices; InvoiceModel? get selectedInvoice; int get currentPage; int get totalPages;
/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoicesStateCopyWith<InvoicesState> get copyWith => _$InvoicesStateCopyWithImpl<InvoicesState>(this as InvoicesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoicesState&&const DeepCollectionEquality().equals(other.invoices, invoices)&&(identical(other.selectedInvoice, selectedInvoice) || other.selectedInvoice == selectedInvoice)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invoices),selectedInvoice,currentPage,totalPages);

@override
String toString() {
  return 'InvoicesState(invoices: $invoices, selectedInvoice: $selectedInvoice, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $InvoicesStateCopyWith<$Res>  {
  factory $InvoicesStateCopyWith(InvoicesState value, $Res Function(InvoicesState) _then) = _$InvoicesStateCopyWithImpl;
@useResult
$Res call({
 List<InvoiceModel> invoices, InvoiceModel? selectedInvoice, int currentPage, int totalPages
});




}
/// @nodoc
class _$InvoicesStateCopyWithImpl<$Res>
    implements $InvoicesStateCopyWith<$Res> {
  _$InvoicesStateCopyWithImpl(this._self, this._then);

  final InvoicesState _self;
  final $Res Function(InvoicesState) _then;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoices = null,Object? selectedInvoice = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,selectedInvoice: freezed == selectedInvoice ? _self.selectedInvoice : selectedInvoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoicesState].
extension InvoicesStatePatterns on InvoicesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingInvoices value)?  loading,TResult Function( _LoadedInvoices value)?  loaded,TResult Function( _CreateSuccessInvoices value)?  createSuccess,TResult Function( _UpdateSuccessInvoices value)?  updateSuccess,TResult Function( _DeleteSuccessInvoices value)?  deleteSuccess,TResult Function( _FailureInvoices value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingInvoices() when loading != null:
return loading(_that);case _LoadedInvoices() when loaded != null:
return loaded(_that);case _CreateSuccessInvoices() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessInvoices() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessInvoices() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureInvoices() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingInvoices value)  loading,required TResult Function( _LoadedInvoices value)  loaded,required TResult Function( _CreateSuccessInvoices value)  createSuccess,required TResult Function( _UpdateSuccessInvoices value)  updateSuccess,required TResult Function( _DeleteSuccessInvoices value)  deleteSuccess,required TResult Function( _FailureInvoices value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingInvoices():
return loading(_that);case _LoadedInvoices():
return loaded(_that);case _CreateSuccessInvoices():
return createSuccess(_that);case _UpdateSuccessInvoices():
return updateSuccess(_that);case _DeleteSuccessInvoices():
return deleteSuccess(_that);case _FailureInvoices():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingInvoices value)?  loading,TResult? Function( _LoadedInvoices value)?  loaded,TResult? Function( _CreateSuccessInvoices value)?  createSuccess,TResult? Function( _UpdateSuccessInvoices value)?  updateSuccess,TResult? Function( _DeleteSuccessInvoices value)?  deleteSuccess,TResult? Function( _FailureInvoices value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingInvoices() when loading != null:
return loading(_that);case _LoadedInvoices() when loaded != null:
return loaded(_that);case _CreateSuccessInvoices() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessInvoices() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessInvoices() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureInvoices() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages,  String? error)?  initial,TResult Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages,  String? message)?  loading,TResult Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)?  loaded,TResult Function( List<InvoiceModel> invoices,  InvoiceModel created,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)?  createSuccess,TResult Function( List<InvoiceModel> invoices,  InvoiceModel updated,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)?  updateSuccess,TResult Function( List<InvoiceModel> invoices,  int deletedId,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)?  deleteSuccess,TResult Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages,  String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages,_that.error);case _LoadingInvoices() when loading != null:
return loading(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages,_that.message);case _LoadedInvoices() when loaded != null:
return loaded(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _CreateSuccessInvoices() when createSuccess != null:
return createSuccess(_that.invoices,_that.created,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _UpdateSuccessInvoices() when updateSuccess != null:
return updateSuccess(_that.invoices,_that.updated,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _DeleteSuccessInvoices() when deleteSuccess != null:
return deleteSuccess(_that.invoices,_that.deletedId,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _FailureInvoices() when failure != null:
return failure(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages,  String? error)  initial,required TResult Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages,  String? message)  loading,required TResult Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)  loaded,required TResult Function( List<InvoiceModel> invoices,  InvoiceModel created,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)  createSuccess,required TResult Function( List<InvoiceModel> invoices,  InvoiceModel updated,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)  updateSuccess,required TResult Function( List<InvoiceModel> invoices,  int deletedId,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)  deleteSuccess,required TResult Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages,  String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages,_that.error);case _LoadingInvoices():
return loading(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages,_that.message);case _LoadedInvoices():
return loaded(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _CreateSuccessInvoices():
return createSuccess(_that.invoices,_that.created,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _UpdateSuccessInvoices():
return updateSuccess(_that.invoices,_that.updated,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _DeleteSuccessInvoices():
return deleteSuccess(_that.invoices,_that.deletedId,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _FailureInvoices():
return failure(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages,  String? error)?  initial,TResult? Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages,  String? message)?  loading,TResult? Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)?  loaded,TResult? Function( List<InvoiceModel> invoices,  InvoiceModel created,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)?  createSuccess,TResult? Function( List<InvoiceModel> invoices,  InvoiceModel updated,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)?  updateSuccess,TResult? Function( List<InvoiceModel> invoices,  int deletedId,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages)?  deleteSuccess,TResult? Function( List<InvoiceModel> invoices,  InvoiceModel? selectedInvoice,  int currentPage,  int totalPages,  String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages,_that.error);case _LoadingInvoices() when loading != null:
return loading(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages,_that.message);case _LoadedInvoices() when loaded != null:
return loaded(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _CreateSuccessInvoices() when createSuccess != null:
return createSuccess(_that.invoices,_that.created,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _UpdateSuccessInvoices() when updateSuccess != null:
return updateSuccess(_that.invoices,_that.updated,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _DeleteSuccessInvoices() when deleteSuccess != null:
return deleteSuccess(_that.invoices,_that.deletedId,_that.selectedInvoice,_that.currentPage,_that.totalPages);case _FailureInvoices() when failure != null:
return failure(_that.invoices,_that.selectedInvoice,_that.currentPage,_that.totalPages,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements InvoicesState {
  const _Initial({final  List<InvoiceModel> invoices = const [], this.selectedInvoice, this.currentPage = 1, this.totalPages = 1, this.error}): _invoices = invoices;
  

 final  List<InvoiceModel> _invoices;
@override@JsonKey() List<InvoiceModel> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

@override final  InvoiceModel? selectedInvoice;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? error;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.selectedInvoice, selectedInvoice) || other.selectedInvoice == selectedInvoice)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),selectedInvoice,currentPage,totalPages,error);

@override
String toString() {
  return 'InvoicesState.initial(invoices: $invoices, selectedInvoice: $selectedInvoice, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $InvoicesStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<InvoiceModel> invoices, InvoiceModel? selectedInvoice, int currentPage, int totalPages, String? error
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? selectedInvoice = freezed,Object? currentPage = null,Object? totalPages = null,Object? error = freezed,}) {
  return _then(_Initial(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,selectedInvoice: freezed == selectedInvoice ? _self.selectedInvoice : selectedInvoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadingInvoices implements InvoicesState {
  const _LoadingInvoices({final  List<InvoiceModel> invoices = const [], this.selectedInvoice, this.currentPage = 1, this.totalPages = 1, this.message}): _invoices = invoices;
  

 final  List<InvoiceModel> _invoices;
@override@JsonKey() List<InvoiceModel> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

@override final  InvoiceModel? selectedInvoice;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? message;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingInvoicesCopyWith<_LoadingInvoices> get copyWith => __$LoadingInvoicesCopyWithImpl<_LoadingInvoices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingInvoices&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.selectedInvoice, selectedInvoice) || other.selectedInvoice == selectedInvoice)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),selectedInvoice,currentPage,totalPages,message);

@override
String toString() {
  return 'InvoicesState.loading(invoices: $invoices, selectedInvoice: $selectedInvoice, currentPage: $currentPage, totalPages: $totalPages, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoadingInvoicesCopyWith<$Res> implements $InvoicesStateCopyWith<$Res> {
  factory _$LoadingInvoicesCopyWith(_LoadingInvoices value, $Res Function(_LoadingInvoices) _then) = __$LoadingInvoicesCopyWithImpl;
@override @useResult
$Res call({
 List<InvoiceModel> invoices, InvoiceModel? selectedInvoice, int currentPage, int totalPages, String? message
});




}
/// @nodoc
class __$LoadingInvoicesCopyWithImpl<$Res>
    implements _$LoadingInvoicesCopyWith<$Res> {
  __$LoadingInvoicesCopyWithImpl(this._self, this._then);

  final _LoadingInvoices _self;
  final $Res Function(_LoadingInvoices) _then;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? selectedInvoice = freezed,Object? currentPage = null,Object? totalPages = null,Object? message = freezed,}) {
  return _then(_LoadingInvoices(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,selectedInvoice: freezed == selectedInvoice ? _self.selectedInvoice : selectedInvoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadedInvoices implements InvoicesState {
  const _LoadedInvoices({required final  List<InvoiceModel> invoices, this.selectedInvoice, required this.currentPage, required this.totalPages}): _invoices = invoices;
  

 final  List<InvoiceModel> _invoices;
@override List<InvoiceModel> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

@override final  InvoiceModel? selectedInvoice;
@override final  int currentPage;
@override final  int totalPages;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedInvoicesCopyWith<_LoadedInvoices> get copyWith => __$LoadedInvoicesCopyWithImpl<_LoadedInvoices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedInvoices&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.selectedInvoice, selectedInvoice) || other.selectedInvoice == selectedInvoice)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),selectedInvoice,currentPage,totalPages);

@override
String toString() {
  return 'InvoicesState.loaded(invoices: $invoices, selectedInvoice: $selectedInvoice, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$LoadedInvoicesCopyWith<$Res> implements $InvoicesStateCopyWith<$Res> {
  factory _$LoadedInvoicesCopyWith(_LoadedInvoices value, $Res Function(_LoadedInvoices) _then) = __$LoadedInvoicesCopyWithImpl;
@override @useResult
$Res call({
 List<InvoiceModel> invoices, InvoiceModel? selectedInvoice, int currentPage, int totalPages
});




}
/// @nodoc
class __$LoadedInvoicesCopyWithImpl<$Res>
    implements _$LoadedInvoicesCopyWith<$Res> {
  __$LoadedInvoicesCopyWithImpl(this._self, this._then);

  final _LoadedInvoices _self;
  final $Res Function(_LoadedInvoices) _then;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? selectedInvoice = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_LoadedInvoices(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,selectedInvoice: freezed == selectedInvoice ? _self.selectedInvoice : selectedInvoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CreateSuccessInvoices implements InvoicesState {
  const _CreateSuccessInvoices({required final  List<InvoiceModel> invoices, required this.created, this.selectedInvoice, this.currentPage = 1, this.totalPages = 1}): _invoices = invoices;
  

 final  List<InvoiceModel> _invoices;
@override List<InvoiceModel> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

 final  InvoiceModel created;
@override final  InvoiceModel? selectedInvoice;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSuccessInvoicesCopyWith<_CreateSuccessInvoices> get copyWith => __$CreateSuccessInvoicesCopyWithImpl<_CreateSuccessInvoices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSuccessInvoices&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.created, created) || other.created == created)&&(identical(other.selectedInvoice, selectedInvoice) || other.selectedInvoice == selectedInvoice)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),created,selectedInvoice,currentPage,totalPages);

@override
String toString() {
  return 'InvoicesState.createSuccess(invoices: $invoices, created: $created, selectedInvoice: $selectedInvoice, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$CreateSuccessInvoicesCopyWith<$Res> implements $InvoicesStateCopyWith<$Res> {
  factory _$CreateSuccessInvoicesCopyWith(_CreateSuccessInvoices value, $Res Function(_CreateSuccessInvoices) _then) = __$CreateSuccessInvoicesCopyWithImpl;
@override @useResult
$Res call({
 List<InvoiceModel> invoices, InvoiceModel created, InvoiceModel? selectedInvoice, int currentPage, int totalPages
});




}
/// @nodoc
class __$CreateSuccessInvoicesCopyWithImpl<$Res>
    implements _$CreateSuccessInvoicesCopyWith<$Res> {
  __$CreateSuccessInvoicesCopyWithImpl(this._self, this._then);

  final _CreateSuccessInvoices _self;
  final $Res Function(_CreateSuccessInvoices) _then;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? created = null,Object? selectedInvoice = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_CreateSuccessInvoices(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as InvoiceModel,selectedInvoice: freezed == selectedInvoice ? _self.selectedInvoice : selectedInvoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateSuccessInvoices implements InvoicesState {
  const _UpdateSuccessInvoices({required final  List<InvoiceModel> invoices, required this.updated, this.selectedInvoice, this.currentPage = 1, this.totalPages = 1}): _invoices = invoices;
  

 final  List<InvoiceModel> _invoices;
@override List<InvoiceModel> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

 final  InvoiceModel updated;
@override final  InvoiceModel? selectedInvoice;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSuccessInvoicesCopyWith<_UpdateSuccessInvoices> get copyWith => __$UpdateSuccessInvoicesCopyWithImpl<_UpdateSuccessInvoices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSuccessInvoices&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.selectedInvoice, selectedInvoice) || other.selectedInvoice == selectedInvoice)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),updated,selectedInvoice,currentPage,totalPages);

@override
String toString() {
  return 'InvoicesState.updateSuccess(invoices: $invoices, updated: $updated, selectedInvoice: $selectedInvoice, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$UpdateSuccessInvoicesCopyWith<$Res> implements $InvoicesStateCopyWith<$Res> {
  factory _$UpdateSuccessInvoicesCopyWith(_UpdateSuccessInvoices value, $Res Function(_UpdateSuccessInvoices) _then) = __$UpdateSuccessInvoicesCopyWithImpl;
@override @useResult
$Res call({
 List<InvoiceModel> invoices, InvoiceModel updated, InvoiceModel? selectedInvoice, int currentPage, int totalPages
});




}
/// @nodoc
class __$UpdateSuccessInvoicesCopyWithImpl<$Res>
    implements _$UpdateSuccessInvoicesCopyWith<$Res> {
  __$UpdateSuccessInvoicesCopyWithImpl(this._self, this._then);

  final _UpdateSuccessInvoices _self;
  final $Res Function(_UpdateSuccessInvoices) _then;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? updated = null,Object? selectedInvoice = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_UpdateSuccessInvoices(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as InvoiceModel,selectedInvoice: freezed == selectedInvoice ? _self.selectedInvoice : selectedInvoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteSuccessInvoices implements InvoicesState {
  const _DeleteSuccessInvoices({required final  List<InvoiceModel> invoices, required this.deletedId, this.selectedInvoice, this.currentPage = 1, this.totalPages = 1}): _invoices = invoices;
  

 final  List<InvoiceModel> _invoices;
@override List<InvoiceModel> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

 final  int deletedId;
@override final  InvoiceModel? selectedInvoice;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteSuccessInvoicesCopyWith<_DeleteSuccessInvoices> get copyWith => __$DeleteSuccessInvoicesCopyWithImpl<_DeleteSuccessInvoices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSuccessInvoices&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.deletedId, deletedId) || other.deletedId == deletedId)&&(identical(other.selectedInvoice, selectedInvoice) || other.selectedInvoice == selectedInvoice)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),deletedId,selectedInvoice,currentPage,totalPages);

@override
String toString() {
  return 'InvoicesState.deleteSuccess(invoices: $invoices, deletedId: $deletedId, selectedInvoice: $selectedInvoice, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$DeleteSuccessInvoicesCopyWith<$Res> implements $InvoicesStateCopyWith<$Res> {
  factory _$DeleteSuccessInvoicesCopyWith(_DeleteSuccessInvoices value, $Res Function(_DeleteSuccessInvoices) _then) = __$DeleteSuccessInvoicesCopyWithImpl;
@override @useResult
$Res call({
 List<InvoiceModel> invoices, int deletedId, InvoiceModel? selectedInvoice, int currentPage, int totalPages
});




}
/// @nodoc
class __$DeleteSuccessInvoicesCopyWithImpl<$Res>
    implements _$DeleteSuccessInvoicesCopyWith<$Res> {
  __$DeleteSuccessInvoicesCopyWithImpl(this._self, this._then);

  final _DeleteSuccessInvoices _self;
  final $Res Function(_DeleteSuccessInvoices) _then;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? deletedId = null,Object? selectedInvoice = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_DeleteSuccessInvoices(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,deletedId: null == deletedId ? _self.deletedId : deletedId // ignore: cast_nullable_to_non_nullable
as int,selectedInvoice: freezed == selectedInvoice ? _self.selectedInvoice : selectedInvoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FailureInvoices implements InvoicesState {
  const _FailureInvoices({final  List<InvoiceModel> invoices = const [], this.selectedInvoice, this.currentPage = 1, this.totalPages = 1, required this.error}): _invoices = invoices;
  

 final  List<InvoiceModel> _invoices;
@override@JsonKey() List<InvoiceModel> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

@override final  InvoiceModel? selectedInvoice;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String error;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureInvoicesCopyWith<_FailureInvoices> get copyWith => __$FailureInvoicesCopyWithImpl<_FailureInvoices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureInvoices&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&(identical(other.selectedInvoice, selectedInvoice) || other.selectedInvoice == selectedInvoice)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),selectedInvoice,currentPage,totalPages,error);

@override
String toString() {
  return 'InvoicesState.failure(invoices: $invoices, selectedInvoice: $selectedInvoice, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureInvoicesCopyWith<$Res> implements $InvoicesStateCopyWith<$Res> {
  factory _$FailureInvoicesCopyWith(_FailureInvoices value, $Res Function(_FailureInvoices) _then) = __$FailureInvoicesCopyWithImpl;
@override @useResult
$Res call({
 List<InvoiceModel> invoices, InvoiceModel? selectedInvoice, int currentPage, int totalPages, String error
});




}
/// @nodoc
class __$FailureInvoicesCopyWithImpl<$Res>
    implements _$FailureInvoicesCopyWith<$Res> {
  __$FailureInvoicesCopyWithImpl(this._self, this._then);

  final _FailureInvoices _self;
  final $Res Function(_FailureInvoices) _then;

/// Create a copy of InvoicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? selectedInvoice = freezed,Object? currentPage = null,Object? totalPages = null,Object? error = null,}) {
  return _then(_FailureInvoices(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,selectedInvoice: freezed == selectedInvoice ? _self.selectedInvoice : selectedInvoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
