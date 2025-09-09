// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpensesState {

 List<ExpenseModel> get expenses; ExpenseModel? get selectedExpense; int get currentPage; int get totalPages;
/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesStateCopyWith<ExpensesState> get copyWith => _$ExpensesStateCopyWithImpl<ExpensesState>(this as ExpensesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesState&&const DeepCollectionEquality().equals(other.expenses, expenses)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(expenses),selectedExpense,currentPage,totalPages);

@override
String toString() {
  return 'ExpensesState(expenses: $expenses, selectedExpense: $selectedExpense, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ExpensesStateCopyWith<$Res>  {
  factory $ExpensesStateCopyWith(ExpensesState value, $Res Function(ExpensesState) _then) = _$ExpensesStateCopyWithImpl;
@useResult
$Res call({
 List<ExpenseModel> expenses, ExpenseModel? selectedExpense, int currentPage, int totalPages
});




}
/// @nodoc
class _$ExpensesStateCopyWithImpl<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  _$ExpensesStateCopyWithImpl(this._self, this._then);

  final ExpensesState _self;
  final $Res Function(ExpensesState) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? expenses = null,Object? selectedExpense = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseModel>,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as ExpenseModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpensesState].
extension ExpensesStatePatterns on ExpensesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingExpenses value)?  loading,TResult Function( _LoadedExpenses value)?  loaded,TResult Function( _CreateSuccessExpenses value)?  createSuccess,TResult Function( _UpdateSuccessExpenses value)?  updateSuccess,TResult Function( _DeleteSuccessExpenses value)?  deleteSuccess,TResult Function( _FailureExpenses value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingExpenses() when loading != null:
return loading(_that);case _LoadedExpenses() when loaded != null:
return loaded(_that);case _CreateSuccessExpenses() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessExpenses() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessExpenses() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureExpenses() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingExpenses value)  loading,required TResult Function( _LoadedExpenses value)  loaded,required TResult Function( _CreateSuccessExpenses value)  createSuccess,required TResult Function( _UpdateSuccessExpenses value)  updateSuccess,required TResult Function( _DeleteSuccessExpenses value)  deleteSuccess,required TResult Function( _FailureExpenses value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingExpenses():
return loading(_that);case _LoadedExpenses():
return loaded(_that);case _CreateSuccessExpenses():
return createSuccess(_that);case _UpdateSuccessExpenses():
return updateSuccess(_that);case _DeleteSuccessExpenses():
return deleteSuccess(_that);case _FailureExpenses():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingExpenses value)?  loading,TResult? Function( _LoadedExpenses value)?  loaded,TResult? Function( _CreateSuccessExpenses value)?  createSuccess,TResult? Function( _UpdateSuccessExpenses value)?  updateSuccess,TResult? Function( _DeleteSuccessExpenses value)?  deleteSuccess,TResult? Function( _FailureExpenses value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingExpenses() when loading != null:
return loading(_that);case _LoadedExpenses() when loaded != null:
return loaded(_that);case _CreateSuccessExpenses() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessExpenses() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessExpenses() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureExpenses() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages,  String? error)?  initial,TResult Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages,  String? message)?  loading,TResult Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)?  loaded,TResult Function( List<ExpenseModel> expenses,  ExpenseModel created,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)?  createSuccess,TResult Function( List<ExpenseModel> expenses,  ExpenseModel updated,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)?  updateSuccess,TResult Function( List<ExpenseModel> expenses,  int deletedId,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)?  deleteSuccess,TResult Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages,  String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages,_that.error);case _LoadingExpenses() when loading != null:
return loading(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages,_that.message);case _LoadedExpenses() when loaded != null:
return loaded(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages);case _CreateSuccessExpenses() when createSuccess != null:
return createSuccess(_that.expenses,_that.created,_that.selectedExpense,_that.currentPage,_that.totalPages);case _UpdateSuccessExpenses() when updateSuccess != null:
return updateSuccess(_that.expenses,_that.updated,_that.selectedExpense,_that.currentPage,_that.totalPages);case _DeleteSuccessExpenses() when deleteSuccess != null:
return deleteSuccess(_that.expenses,_that.deletedId,_that.selectedExpense,_that.currentPage,_that.totalPages);case _FailureExpenses() when failure != null:
return failure(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages,  String? error)  initial,required TResult Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages,  String? message)  loading,required TResult Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)  loaded,required TResult Function( List<ExpenseModel> expenses,  ExpenseModel created,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)  createSuccess,required TResult Function( List<ExpenseModel> expenses,  ExpenseModel updated,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)  updateSuccess,required TResult Function( List<ExpenseModel> expenses,  int deletedId,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)  deleteSuccess,required TResult Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages,  String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages,_that.error);case _LoadingExpenses():
return loading(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages,_that.message);case _LoadedExpenses():
return loaded(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages);case _CreateSuccessExpenses():
return createSuccess(_that.expenses,_that.created,_that.selectedExpense,_that.currentPage,_that.totalPages);case _UpdateSuccessExpenses():
return updateSuccess(_that.expenses,_that.updated,_that.selectedExpense,_that.currentPage,_that.totalPages);case _DeleteSuccessExpenses():
return deleteSuccess(_that.expenses,_that.deletedId,_that.selectedExpense,_that.currentPage,_that.totalPages);case _FailureExpenses():
return failure(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages,  String? error)?  initial,TResult? Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages,  String? message)?  loading,TResult? Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)?  loaded,TResult? Function( List<ExpenseModel> expenses,  ExpenseModel created,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)?  createSuccess,TResult? Function( List<ExpenseModel> expenses,  ExpenseModel updated,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)?  updateSuccess,TResult? Function( List<ExpenseModel> expenses,  int deletedId,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages)?  deleteSuccess,TResult? Function( List<ExpenseModel> expenses,  ExpenseModel? selectedExpense,  int currentPage,  int totalPages,  String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages,_that.error);case _LoadingExpenses() when loading != null:
return loading(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages,_that.message);case _LoadedExpenses() when loaded != null:
return loaded(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages);case _CreateSuccessExpenses() when createSuccess != null:
return createSuccess(_that.expenses,_that.created,_that.selectedExpense,_that.currentPage,_that.totalPages);case _UpdateSuccessExpenses() when updateSuccess != null:
return updateSuccess(_that.expenses,_that.updated,_that.selectedExpense,_that.currentPage,_that.totalPages);case _DeleteSuccessExpenses() when deleteSuccess != null:
return deleteSuccess(_that.expenses,_that.deletedId,_that.selectedExpense,_that.currentPage,_that.totalPages);case _FailureExpenses() when failure != null:
return failure(_that.expenses,_that.selectedExpense,_that.currentPage,_that.totalPages,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ExpensesState {
  const _Initial({final  List<ExpenseModel> expenses = const [], this.selectedExpense, this.currentPage = 1, this.totalPages = 1, this.error}): _expenses = expenses;
  

 final  List<ExpenseModel> _expenses;
@override@JsonKey() List<ExpenseModel> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

@override final  ExpenseModel? selectedExpense;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? error;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),selectedExpense,currentPage,totalPages,error);

@override
String toString() {
  return 'ExpensesState.initial(expenses: $expenses, selectedExpense: $selectedExpense, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseModel> expenses, ExpenseModel? selectedExpense, int currentPage, int totalPages, String? error
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? selectedExpense = freezed,Object? currentPage = null,Object? totalPages = null,Object? error = freezed,}) {
  return _then(_Initial(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseModel>,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as ExpenseModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadingExpenses implements ExpensesState {
  const _LoadingExpenses({final  List<ExpenseModel> expenses = const [], this.selectedExpense, this.currentPage = 1, this.totalPages = 1, this.message}): _expenses = expenses;
  

 final  List<ExpenseModel> _expenses;
@override@JsonKey() List<ExpenseModel> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

@override final  ExpenseModel? selectedExpense;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? message;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingExpensesCopyWith<_LoadingExpenses> get copyWith => __$LoadingExpensesCopyWithImpl<_LoadingExpenses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingExpenses&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),selectedExpense,currentPage,totalPages,message);

@override
String toString() {
  return 'ExpensesState.loading(expenses: $expenses, selectedExpense: $selectedExpense, currentPage: $currentPage, totalPages: $totalPages, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoadingExpensesCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
  factory _$LoadingExpensesCopyWith(_LoadingExpenses value, $Res Function(_LoadingExpenses) _then) = __$LoadingExpensesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseModel> expenses, ExpenseModel? selectedExpense, int currentPage, int totalPages, String? message
});




}
/// @nodoc
class __$LoadingExpensesCopyWithImpl<$Res>
    implements _$LoadingExpensesCopyWith<$Res> {
  __$LoadingExpensesCopyWithImpl(this._self, this._then);

  final _LoadingExpenses _self;
  final $Res Function(_LoadingExpenses) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? selectedExpense = freezed,Object? currentPage = null,Object? totalPages = null,Object? message = freezed,}) {
  return _then(_LoadingExpenses(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseModel>,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as ExpenseModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadedExpenses implements ExpensesState {
  const _LoadedExpenses({required final  List<ExpenseModel> expenses, this.selectedExpense, required this.currentPage, required this.totalPages}): _expenses = expenses;
  

 final  List<ExpenseModel> _expenses;
@override List<ExpenseModel> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

@override final  ExpenseModel? selectedExpense;
@override final  int currentPage;
@override final  int totalPages;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedExpensesCopyWith<_LoadedExpenses> get copyWith => __$LoadedExpensesCopyWithImpl<_LoadedExpenses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedExpenses&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),selectedExpense,currentPage,totalPages);

@override
String toString() {
  return 'ExpensesState.loaded(expenses: $expenses, selectedExpense: $selectedExpense, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$LoadedExpensesCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
  factory _$LoadedExpensesCopyWith(_LoadedExpenses value, $Res Function(_LoadedExpenses) _then) = __$LoadedExpensesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseModel> expenses, ExpenseModel? selectedExpense, int currentPage, int totalPages
});




}
/// @nodoc
class __$LoadedExpensesCopyWithImpl<$Res>
    implements _$LoadedExpensesCopyWith<$Res> {
  __$LoadedExpensesCopyWithImpl(this._self, this._then);

  final _LoadedExpenses _self;
  final $Res Function(_LoadedExpenses) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? selectedExpense = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_LoadedExpenses(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseModel>,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as ExpenseModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CreateSuccessExpenses implements ExpensesState {
  const _CreateSuccessExpenses({required final  List<ExpenseModel> expenses, required this.created, this.selectedExpense, this.currentPage = 1, this.totalPages = 1}): _expenses = expenses;
  

 final  List<ExpenseModel> _expenses;
@override List<ExpenseModel> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

 final  ExpenseModel created;
@override final  ExpenseModel? selectedExpense;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSuccessExpensesCopyWith<_CreateSuccessExpenses> get copyWith => __$CreateSuccessExpensesCopyWithImpl<_CreateSuccessExpenses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSuccessExpenses&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&(identical(other.created, created) || other.created == created)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),created,selectedExpense,currentPage,totalPages);

@override
String toString() {
  return 'ExpensesState.createSuccess(expenses: $expenses, created: $created, selectedExpense: $selectedExpense, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$CreateSuccessExpensesCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
  factory _$CreateSuccessExpensesCopyWith(_CreateSuccessExpenses value, $Res Function(_CreateSuccessExpenses) _then) = __$CreateSuccessExpensesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseModel> expenses, ExpenseModel created, ExpenseModel? selectedExpense, int currentPage, int totalPages
});




}
/// @nodoc
class __$CreateSuccessExpensesCopyWithImpl<$Res>
    implements _$CreateSuccessExpensesCopyWith<$Res> {
  __$CreateSuccessExpensesCopyWithImpl(this._self, this._then);

  final _CreateSuccessExpenses _self;
  final $Res Function(_CreateSuccessExpenses) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? created = null,Object? selectedExpense = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_CreateSuccessExpenses(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseModel>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as ExpenseModel,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as ExpenseModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateSuccessExpenses implements ExpensesState {
  const _UpdateSuccessExpenses({required final  List<ExpenseModel> expenses, required this.updated, this.selectedExpense, this.currentPage = 1, this.totalPages = 1}): _expenses = expenses;
  

 final  List<ExpenseModel> _expenses;
@override List<ExpenseModel> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

 final  ExpenseModel updated;
@override final  ExpenseModel? selectedExpense;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSuccessExpensesCopyWith<_UpdateSuccessExpenses> get copyWith => __$UpdateSuccessExpensesCopyWithImpl<_UpdateSuccessExpenses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSuccessExpenses&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),updated,selectedExpense,currentPage,totalPages);

@override
String toString() {
  return 'ExpensesState.updateSuccess(expenses: $expenses, updated: $updated, selectedExpense: $selectedExpense, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$UpdateSuccessExpensesCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
  factory _$UpdateSuccessExpensesCopyWith(_UpdateSuccessExpenses value, $Res Function(_UpdateSuccessExpenses) _then) = __$UpdateSuccessExpensesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseModel> expenses, ExpenseModel updated, ExpenseModel? selectedExpense, int currentPage, int totalPages
});




}
/// @nodoc
class __$UpdateSuccessExpensesCopyWithImpl<$Res>
    implements _$UpdateSuccessExpensesCopyWith<$Res> {
  __$UpdateSuccessExpensesCopyWithImpl(this._self, this._then);

  final _UpdateSuccessExpenses _self;
  final $Res Function(_UpdateSuccessExpenses) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? updated = null,Object? selectedExpense = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_UpdateSuccessExpenses(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseModel>,updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as ExpenseModel,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as ExpenseModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteSuccessExpenses implements ExpensesState {
  const _DeleteSuccessExpenses({required final  List<ExpenseModel> expenses, required this.deletedId, this.selectedExpense, this.currentPage = 1, this.totalPages = 1}): _expenses = expenses;
  

 final  List<ExpenseModel> _expenses;
@override List<ExpenseModel> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

 final  int deletedId;
@override final  ExpenseModel? selectedExpense;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteSuccessExpensesCopyWith<_DeleteSuccessExpenses> get copyWith => __$DeleteSuccessExpensesCopyWithImpl<_DeleteSuccessExpenses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSuccessExpenses&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&(identical(other.deletedId, deletedId) || other.deletedId == deletedId)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),deletedId,selectedExpense,currentPage,totalPages);

@override
String toString() {
  return 'ExpensesState.deleteSuccess(expenses: $expenses, deletedId: $deletedId, selectedExpense: $selectedExpense, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$DeleteSuccessExpensesCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
  factory _$DeleteSuccessExpensesCopyWith(_DeleteSuccessExpenses value, $Res Function(_DeleteSuccessExpenses) _then) = __$DeleteSuccessExpensesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseModel> expenses, int deletedId, ExpenseModel? selectedExpense, int currentPage, int totalPages
});




}
/// @nodoc
class __$DeleteSuccessExpensesCopyWithImpl<$Res>
    implements _$DeleteSuccessExpensesCopyWith<$Res> {
  __$DeleteSuccessExpensesCopyWithImpl(this._self, this._then);

  final _DeleteSuccessExpenses _self;
  final $Res Function(_DeleteSuccessExpenses) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? deletedId = null,Object? selectedExpense = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_DeleteSuccessExpenses(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseModel>,deletedId: null == deletedId ? _self.deletedId : deletedId // ignore: cast_nullable_to_non_nullable
as int,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as ExpenseModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FailureExpenses implements ExpensesState {
  const _FailureExpenses({final  List<ExpenseModel> expenses = const [], this.selectedExpense, this.currentPage = 1, this.totalPages = 1, required this.error}): _expenses = expenses;
  

 final  List<ExpenseModel> _expenses;
@override@JsonKey() List<ExpenseModel> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

@override final  ExpenseModel? selectedExpense;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String error;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureExpensesCopyWith<_FailureExpenses> get copyWith => __$FailureExpensesCopyWithImpl<_FailureExpenses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureExpenses&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),selectedExpense,currentPage,totalPages,error);

@override
String toString() {
  return 'ExpensesState.failure(expenses: $expenses, selectedExpense: $selectedExpense, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureExpensesCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
  factory _$FailureExpensesCopyWith(_FailureExpenses value, $Res Function(_FailureExpenses) _then) = __$FailureExpensesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseModel> expenses, ExpenseModel? selectedExpense, int currentPage, int totalPages, String error
});




}
/// @nodoc
class __$FailureExpensesCopyWithImpl<$Res>
    implements _$FailureExpensesCopyWith<$Res> {
  __$FailureExpensesCopyWithImpl(this._self, this._then);

  final _FailureExpenses _self;
  final $Res Function(_FailureExpenses) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? selectedExpense = freezed,Object? currentPage = null,Object? totalPages = null,Object? error = null,}) {
  return _then(_FailureExpenses(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<ExpenseModel>,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as ExpenseModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
