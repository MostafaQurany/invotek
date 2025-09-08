// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customers_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomersState {

 List<CustomerModel> get customers; CustomerModel? get selectedCustomer; int get currentPage; int get totalPages;
/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomersStateCopyWith<CustomersState> get copyWith => _$CustomersStateCopyWithImpl<CustomersState>(this as CustomersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomersState&&const DeepCollectionEquality().equals(other.customers, customers)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(customers),selectedCustomer,currentPage,totalPages);

@override
String toString() {
  return 'CustomersState(customers: $customers, selectedCustomer: $selectedCustomer, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $CustomersStateCopyWith<$Res>  {
  factory $CustomersStateCopyWith(CustomersState value, $Res Function(CustomersState) _then) = _$CustomersStateCopyWithImpl;
@useResult
$Res call({
 List<CustomerModel> customers, CustomerModel? selectedCustomer, int currentPage, int totalPages
});




}
/// @nodoc
class _$CustomersStateCopyWithImpl<$Res>
    implements $CustomersStateCopyWith<$Res> {
  _$CustomersStateCopyWithImpl(this._self, this._then);

  final CustomersState _self;
  final $Res Function(CustomersState) _then;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customers = null,Object? selectedCustomer = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomersState].
extension CustomersStatePatterns on CustomersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingCustomers value)?  loading,TResult Function( _LoadedCustomers value)?  loaded,TResult Function( _CreateSuccessCustomers value)?  createSuccess,TResult Function( _UpdateSuccessCustomers value)?  updateSuccess,TResult Function( _DeleteSuccessCustomers value)?  deleteSuccess,TResult Function( _FailureCustomers value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingCustomers() when loading != null:
return loading(_that);case _LoadedCustomers() when loaded != null:
return loaded(_that);case _CreateSuccessCustomers() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessCustomers() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessCustomers() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureCustomers() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingCustomers value)  loading,required TResult Function( _LoadedCustomers value)  loaded,required TResult Function( _CreateSuccessCustomers value)  createSuccess,required TResult Function( _UpdateSuccessCustomers value)  updateSuccess,required TResult Function( _DeleteSuccessCustomers value)  deleteSuccess,required TResult Function( _FailureCustomers value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingCustomers():
return loading(_that);case _LoadedCustomers():
return loaded(_that);case _CreateSuccessCustomers():
return createSuccess(_that);case _UpdateSuccessCustomers():
return updateSuccess(_that);case _DeleteSuccessCustomers():
return deleteSuccess(_that);case _FailureCustomers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingCustomers value)?  loading,TResult? Function( _LoadedCustomers value)?  loaded,TResult? Function( _CreateSuccessCustomers value)?  createSuccess,TResult? Function( _UpdateSuccessCustomers value)?  updateSuccess,TResult? Function( _DeleteSuccessCustomers value)?  deleteSuccess,TResult? Function( _FailureCustomers value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingCustomers() when loading != null:
return loading(_that);case _LoadedCustomers() when loaded != null:
return loaded(_that);case _CreateSuccessCustomers() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessCustomers() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessCustomers() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureCustomers() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages,  String? error)?  initial,TResult Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages,  String? message)?  loading,TResult Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)?  loaded,TResult Function( List<CustomerModel> customers,  CustomerModel created,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)?  createSuccess,TResult Function( List<CustomerModel> customers,  CustomerModel updated,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)?  updateSuccess,TResult Function( List<CustomerModel> customers,  int deletedId,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)?  deleteSuccess,TResult Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages,  String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages,_that.error);case _LoadingCustomers() when loading != null:
return loading(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages,_that.message);case _LoadedCustomers() when loaded != null:
return loaded(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _CreateSuccessCustomers() when createSuccess != null:
return createSuccess(_that.customers,_that.created,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _UpdateSuccessCustomers() when updateSuccess != null:
return updateSuccess(_that.customers,_that.updated,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _DeleteSuccessCustomers() when deleteSuccess != null:
return deleteSuccess(_that.customers,_that.deletedId,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _FailureCustomers() when failure != null:
return failure(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages,  String? error)  initial,required TResult Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages,  String? message)  loading,required TResult Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)  loaded,required TResult Function( List<CustomerModel> customers,  CustomerModel created,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)  createSuccess,required TResult Function( List<CustomerModel> customers,  CustomerModel updated,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)  updateSuccess,required TResult Function( List<CustomerModel> customers,  int deletedId,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)  deleteSuccess,required TResult Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages,  String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages,_that.error);case _LoadingCustomers():
return loading(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages,_that.message);case _LoadedCustomers():
return loaded(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _CreateSuccessCustomers():
return createSuccess(_that.customers,_that.created,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _UpdateSuccessCustomers():
return updateSuccess(_that.customers,_that.updated,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _DeleteSuccessCustomers():
return deleteSuccess(_that.customers,_that.deletedId,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _FailureCustomers():
return failure(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages,  String? error)?  initial,TResult? Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages,  String? message)?  loading,TResult? Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)?  loaded,TResult? Function( List<CustomerModel> customers,  CustomerModel created,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)?  createSuccess,TResult? Function( List<CustomerModel> customers,  CustomerModel updated,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)?  updateSuccess,TResult? Function( List<CustomerModel> customers,  int deletedId,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages)?  deleteSuccess,TResult? Function( List<CustomerModel> customers,  CustomerModel? selectedCustomer,  int currentPage,  int totalPages,  String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages,_that.error);case _LoadingCustomers() when loading != null:
return loading(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages,_that.message);case _LoadedCustomers() when loaded != null:
return loaded(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _CreateSuccessCustomers() when createSuccess != null:
return createSuccess(_that.customers,_that.created,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _UpdateSuccessCustomers() when updateSuccess != null:
return updateSuccess(_that.customers,_that.updated,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _DeleteSuccessCustomers() when deleteSuccess != null:
return deleteSuccess(_that.customers,_that.deletedId,_that.selectedCustomer,_that.currentPage,_that.totalPages);case _FailureCustomers() when failure != null:
return failure(_that.customers,_that.selectedCustomer,_that.currentPage,_that.totalPages,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CustomersState {
  const _Initial({final  List<CustomerModel> customers = const [], this.selectedCustomer, this.currentPage = 1, this.totalPages = 1, this.error}): _customers = customers;
  

 final  List<CustomerModel> _customers;
@override@JsonKey() List<CustomerModel> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
}

@override final  CustomerModel? selectedCustomer;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? error;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._customers, _customers)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customers),selectedCustomer,currentPage,totalPages,error);

@override
String toString() {
  return 'CustomersState.initial(customers: $customers, selectedCustomer: $selectedCustomer, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $CustomersStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerModel> customers, CustomerModel? selectedCustomer, int currentPage, int totalPages, String? error
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customers = null,Object? selectedCustomer = freezed,Object? currentPage = null,Object? totalPages = null,Object? error = freezed,}) {
  return _then(_Initial(
customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadingCustomers implements CustomersState {
  const _LoadingCustomers({final  List<CustomerModel> customers = const [], this.selectedCustomer, this.currentPage = 1, this.totalPages = 1, this.message}): _customers = customers;
  

 final  List<CustomerModel> _customers;
@override@JsonKey() List<CustomerModel> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
}

@override final  CustomerModel? selectedCustomer;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? message;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCustomersCopyWith<_LoadingCustomers> get copyWith => __$LoadingCustomersCopyWithImpl<_LoadingCustomers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingCustomers&&const DeepCollectionEquality().equals(other._customers, _customers)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customers),selectedCustomer,currentPage,totalPages,message);

@override
String toString() {
  return 'CustomersState.loading(customers: $customers, selectedCustomer: $selectedCustomer, currentPage: $currentPage, totalPages: $totalPages, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoadingCustomersCopyWith<$Res> implements $CustomersStateCopyWith<$Res> {
  factory _$LoadingCustomersCopyWith(_LoadingCustomers value, $Res Function(_LoadingCustomers) _then) = __$LoadingCustomersCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerModel> customers, CustomerModel? selectedCustomer, int currentPage, int totalPages, String? message
});




}
/// @nodoc
class __$LoadingCustomersCopyWithImpl<$Res>
    implements _$LoadingCustomersCopyWith<$Res> {
  __$LoadingCustomersCopyWithImpl(this._self, this._then);

  final _LoadingCustomers _self;
  final $Res Function(_LoadingCustomers) _then;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customers = null,Object? selectedCustomer = freezed,Object? currentPage = null,Object? totalPages = null,Object? message = freezed,}) {
  return _then(_LoadingCustomers(
customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadedCustomers implements CustomersState {
  const _LoadedCustomers({required final  List<CustomerModel> customers, this.selectedCustomer, required this.currentPage, required this.totalPages}): _customers = customers;
  

 final  List<CustomerModel> _customers;
@override List<CustomerModel> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
}

@override final  CustomerModel? selectedCustomer;
@override final  int currentPage;
@override final  int totalPages;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCustomersCopyWith<_LoadedCustomers> get copyWith => __$LoadedCustomersCopyWithImpl<_LoadedCustomers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedCustomers&&const DeepCollectionEquality().equals(other._customers, _customers)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customers),selectedCustomer,currentPage,totalPages);

@override
String toString() {
  return 'CustomersState.loaded(customers: $customers, selectedCustomer: $selectedCustomer, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$LoadedCustomersCopyWith<$Res> implements $CustomersStateCopyWith<$Res> {
  factory _$LoadedCustomersCopyWith(_LoadedCustomers value, $Res Function(_LoadedCustomers) _then) = __$LoadedCustomersCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerModel> customers, CustomerModel? selectedCustomer, int currentPage, int totalPages
});




}
/// @nodoc
class __$LoadedCustomersCopyWithImpl<$Res>
    implements _$LoadedCustomersCopyWith<$Res> {
  __$LoadedCustomersCopyWithImpl(this._self, this._then);

  final _LoadedCustomers _self;
  final $Res Function(_LoadedCustomers) _then;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customers = null,Object? selectedCustomer = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_LoadedCustomers(
customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CreateSuccessCustomers implements CustomersState {
  const _CreateSuccessCustomers({required final  List<CustomerModel> customers, required this.created, this.selectedCustomer, this.currentPage = 1, this.totalPages = 1}): _customers = customers;
  

 final  List<CustomerModel> _customers;
@override List<CustomerModel> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
}

 final  CustomerModel created;
@override final  CustomerModel? selectedCustomer;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSuccessCustomersCopyWith<_CreateSuccessCustomers> get copyWith => __$CreateSuccessCustomersCopyWithImpl<_CreateSuccessCustomers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSuccessCustomers&&const DeepCollectionEquality().equals(other._customers, _customers)&&(identical(other.created, created) || other.created == created)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customers),created,selectedCustomer,currentPage,totalPages);

@override
String toString() {
  return 'CustomersState.createSuccess(customers: $customers, created: $created, selectedCustomer: $selectedCustomer, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$CreateSuccessCustomersCopyWith<$Res> implements $CustomersStateCopyWith<$Res> {
  factory _$CreateSuccessCustomersCopyWith(_CreateSuccessCustomers value, $Res Function(_CreateSuccessCustomers) _then) = __$CreateSuccessCustomersCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerModel> customers, CustomerModel created, CustomerModel? selectedCustomer, int currentPage, int totalPages
});




}
/// @nodoc
class __$CreateSuccessCustomersCopyWithImpl<$Res>
    implements _$CreateSuccessCustomersCopyWith<$Res> {
  __$CreateSuccessCustomersCopyWithImpl(this._self, this._then);

  final _CreateSuccessCustomers _self;
  final $Res Function(_CreateSuccessCustomers) _then;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customers = null,Object? created = null,Object? selectedCustomer = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_CreateSuccessCustomers(
customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as CustomerModel,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateSuccessCustomers implements CustomersState {
  const _UpdateSuccessCustomers({required final  List<CustomerModel> customers, required this.updated, this.selectedCustomer, this.currentPage = 1, this.totalPages = 1}): _customers = customers;
  

 final  List<CustomerModel> _customers;
@override List<CustomerModel> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
}

 final  CustomerModel updated;
@override final  CustomerModel? selectedCustomer;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSuccessCustomersCopyWith<_UpdateSuccessCustomers> get copyWith => __$UpdateSuccessCustomersCopyWithImpl<_UpdateSuccessCustomers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSuccessCustomers&&const DeepCollectionEquality().equals(other._customers, _customers)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customers),updated,selectedCustomer,currentPage,totalPages);

@override
String toString() {
  return 'CustomersState.updateSuccess(customers: $customers, updated: $updated, selectedCustomer: $selectedCustomer, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$UpdateSuccessCustomersCopyWith<$Res> implements $CustomersStateCopyWith<$Res> {
  factory _$UpdateSuccessCustomersCopyWith(_UpdateSuccessCustomers value, $Res Function(_UpdateSuccessCustomers) _then) = __$UpdateSuccessCustomersCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerModel> customers, CustomerModel updated, CustomerModel? selectedCustomer, int currentPage, int totalPages
});




}
/// @nodoc
class __$UpdateSuccessCustomersCopyWithImpl<$Res>
    implements _$UpdateSuccessCustomersCopyWith<$Res> {
  __$UpdateSuccessCustomersCopyWithImpl(this._self, this._then);

  final _UpdateSuccessCustomers _self;
  final $Res Function(_UpdateSuccessCustomers) _then;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customers = null,Object? updated = null,Object? selectedCustomer = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_UpdateSuccessCustomers(
customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as CustomerModel,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteSuccessCustomers implements CustomersState {
  const _DeleteSuccessCustomers({required final  List<CustomerModel> customers, required this.deletedId, this.selectedCustomer, this.currentPage = 1, this.totalPages = 1}): _customers = customers;
  

 final  List<CustomerModel> _customers;
@override List<CustomerModel> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
}

 final  int deletedId;
@override final  CustomerModel? selectedCustomer;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteSuccessCustomersCopyWith<_DeleteSuccessCustomers> get copyWith => __$DeleteSuccessCustomersCopyWithImpl<_DeleteSuccessCustomers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSuccessCustomers&&const DeepCollectionEquality().equals(other._customers, _customers)&&(identical(other.deletedId, deletedId) || other.deletedId == deletedId)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customers),deletedId,selectedCustomer,currentPage,totalPages);

@override
String toString() {
  return 'CustomersState.deleteSuccess(customers: $customers, deletedId: $deletedId, selectedCustomer: $selectedCustomer, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$DeleteSuccessCustomersCopyWith<$Res> implements $CustomersStateCopyWith<$Res> {
  factory _$DeleteSuccessCustomersCopyWith(_DeleteSuccessCustomers value, $Res Function(_DeleteSuccessCustomers) _then) = __$DeleteSuccessCustomersCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerModel> customers, int deletedId, CustomerModel? selectedCustomer, int currentPage, int totalPages
});




}
/// @nodoc
class __$DeleteSuccessCustomersCopyWithImpl<$Res>
    implements _$DeleteSuccessCustomersCopyWith<$Res> {
  __$DeleteSuccessCustomersCopyWithImpl(this._self, this._then);

  final _DeleteSuccessCustomers _self;
  final $Res Function(_DeleteSuccessCustomers) _then;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customers = null,Object? deletedId = null,Object? selectedCustomer = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_DeleteSuccessCustomers(
customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,deletedId: null == deletedId ? _self.deletedId : deletedId // ignore: cast_nullable_to_non_nullable
as int,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FailureCustomers implements CustomersState {
  const _FailureCustomers({final  List<CustomerModel> customers = const [], this.selectedCustomer, this.currentPage = 1, this.totalPages = 1, required this.error}): _customers = customers;
  

 final  List<CustomerModel> _customers;
@override@JsonKey() List<CustomerModel> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
}

@override final  CustomerModel? selectedCustomer;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String error;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCustomersCopyWith<_FailureCustomers> get copyWith => __$FailureCustomersCopyWithImpl<_FailureCustomers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureCustomers&&const DeepCollectionEquality().equals(other._customers, _customers)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customers),selectedCustomer,currentPage,totalPages,error);

@override
String toString() {
  return 'CustomersState.failure(customers: $customers, selectedCustomer: $selectedCustomer, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureCustomersCopyWith<$Res> implements $CustomersStateCopyWith<$Res> {
  factory _$FailureCustomersCopyWith(_FailureCustomers value, $Res Function(_FailureCustomers) _then) = __$FailureCustomersCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerModel> customers, CustomerModel? selectedCustomer, int currentPage, int totalPages, String error
});




}
/// @nodoc
class __$FailureCustomersCopyWithImpl<$Res>
    implements _$FailureCustomersCopyWith<$Res> {
  __$FailureCustomersCopyWithImpl(this._self, this._then);

  final _FailureCustomers _self;
  final $Res Function(_FailureCustomers) _then;

/// Create a copy of CustomersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customers = null,Object? selectedCustomer = freezed,Object? currentPage = null,Object? totalPages = null,Object? error = null,}) {
  return _then(_FailureCustomers(
customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<CustomerModel>,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
