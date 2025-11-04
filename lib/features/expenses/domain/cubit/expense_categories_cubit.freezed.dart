// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_categories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpenseCategoriesState {

 List<ExpenseCategoryModel> get categories; ExpenseCategoryModel? get selectedCategory; int get currentPage; int get totalPages;
/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCategoriesStateCopyWith<ExpenseCategoriesState> get copyWith => _$ExpenseCategoriesStateCopyWithImpl<ExpenseCategoriesState>(this as ExpenseCategoriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseCategoriesState&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),selectedCategory,currentPage,totalPages);

@override
String toString() {
  return 'ExpenseCategoriesState(categories: $categories, selectedCategory: $selectedCategory, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ExpenseCategoriesStateCopyWith<$Res>  {
  factory $ExpenseCategoriesStateCopyWith(ExpenseCategoriesState value, $Res Function(ExpenseCategoriesState) _then) = _$ExpenseCategoriesStateCopyWithImpl;
@useResult
$Res call({
 List<ExpenseCategoryModel> categories, ExpenseCategoryModel? selectedCategory, int currentPage, int totalPages
});




}
/// @nodoc
class _$ExpenseCategoriesStateCopyWithImpl<$Res>
    implements $ExpenseCategoriesStateCopyWith<$Res> {
  _$ExpenseCategoriesStateCopyWithImpl(this._self, this._then);

  final ExpenseCategoriesState _self;
  final $Res Function(ExpenseCategoriesState) _then;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? selectedCategory = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryModel>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseCategoriesState].
extension ExpenseCategoriesStatePatterns on ExpenseCategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingExpenseCategories value)?  loading,TResult Function( _LoadedExpenseCategories value)?  loaded,TResult Function( _CreateSuccessExpenseCategories value)?  createSuccess,TResult Function( _UpdateSuccessExpenseCategories value)?  updateSuccess,TResult Function( _DeleteSuccessExpenseCategories value)?  deleteSuccess,TResult Function( _FailureExpenseCategories value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingExpenseCategories() when loading != null:
return loading(_that);case _LoadedExpenseCategories() when loaded != null:
return loaded(_that);case _CreateSuccessExpenseCategories() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessExpenseCategories() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessExpenseCategories() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureExpenseCategories() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingExpenseCategories value)  loading,required TResult Function( _LoadedExpenseCategories value)  loaded,required TResult Function( _CreateSuccessExpenseCategories value)  createSuccess,required TResult Function( _UpdateSuccessExpenseCategories value)  updateSuccess,required TResult Function( _DeleteSuccessExpenseCategories value)  deleteSuccess,required TResult Function( _FailureExpenseCategories value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingExpenseCategories():
return loading(_that);case _LoadedExpenseCategories():
return loaded(_that);case _CreateSuccessExpenseCategories():
return createSuccess(_that);case _UpdateSuccessExpenseCategories():
return updateSuccess(_that);case _DeleteSuccessExpenseCategories():
return deleteSuccess(_that);case _FailureExpenseCategories():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingExpenseCategories value)?  loading,TResult? Function( _LoadedExpenseCategories value)?  loaded,TResult? Function( _CreateSuccessExpenseCategories value)?  createSuccess,TResult? Function( _UpdateSuccessExpenseCategories value)?  updateSuccess,TResult? Function( _DeleteSuccessExpenseCategories value)?  deleteSuccess,TResult? Function( _FailureExpenseCategories value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingExpenseCategories() when loading != null:
return loading(_that);case _LoadedExpenseCategories() when loaded != null:
return loaded(_that);case _CreateSuccessExpenseCategories() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessExpenseCategories() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessExpenseCategories() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureExpenseCategories() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages,  String? error)?  initial,TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages,  String? message)?  loading,TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)?  loaded,TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel created,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)?  createSuccess,TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel updated,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)?  updateSuccess,TResult Function( List<ExpenseCategoryModel> categories,  int deletedId,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)?  deleteSuccess,TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages,  String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages,_that.error);case _LoadingExpenseCategories() when loading != null:
return loading(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages,_that.message);case _LoadedExpenseCategories() when loaded != null:
return loaded(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages);case _CreateSuccessExpenseCategories() when createSuccess != null:
return createSuccess(_that.categories,_that.created,_that.selectedCategory,_that.currentPage,_that.totalPages);case _UpdateSuccessExpenseCategories() when updateSuccess != null:
return updateSuccess(_that.categories,_that.updated,_that.selectedCategory,_that.currentPage,_that.totalPages);case _DeleteSuccessExpenseCategories() when deleteSuccess != null:
return deleteSuccess(_that.categories,_that.deletedId,_that.selectedCategory,_that.currentPage,_that.totalPages);case _FailureExpenseCategories() when failure != null:
return failure(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages,  String? error)  initial,required TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages,  String? message)  loading,required TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)  loaded,required TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel created,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)  createSuccess,required TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel updated,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)  updateSuccess,required TResult Function( List<ExpenseCategoryModel> categories,  int deletedId,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)  deleteSuccess,required TResult Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages,  String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages,_that.error);case _LoadingExpenseCategories():
return loading(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages,_that.message);case _LoadedExpenseCategories():
return loaded(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages);case _CreateSuccessExpenseCategories():
return createSuccess(_that.categories,_that.created,_that.selectedCategory,_that.currentPage,_that.totalPages);case _UpdateSuccessExpenseCategories():
return updateSuccess(_that.categories,_that.updated,_that.selectedCategory,_that.currentPage,_that.totalPages);case _DeleteSuccessExpenseCategories():
return deleteSuccess(_that.categories,_that.deletedId,_that.selectedCategory,_that.currentPage,_that.totalPages);case _FailureExpenseCategories():
return failure(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages,  String? error)?  initial,TResult? Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages,  String? message)?  loading,TResult? Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)?  loaded,TResult? Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel created,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)?  createSuccess,TResult? Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel updated,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)?  updateSuccess,TResult? Function( List<ExpenseCategoryModel> categories,  int deletedId,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages)?  deleteSuccess,TResult? Function( List<ExpenseCategoryModel> categories,  ExpenseCategoryModel? selectedCategory,  int currentPage,  int totalPages,  String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages,_that.error);case _LoadingExpenseCategories() when loading != null:
return loading(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages,_that.message);case _LoadedExpenseCategories() when loaded != null:
return loaded(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages);case _CreateSuccessExpenseCategories() when createSuccess != null:
return createSuccess(_that.categories,_that.created,_that.selectedCategory,_that.currentPage,_that.totalPages);case _UpdateSuccessExpenseCategories() when updateSuccess != null:
return updateSuccess(_that.categories,_that.updated,_that.selectedCategory,_that.currentPage,_that.totalPages);case _DeleteSuccessExpenseCategories() when deleteSuccess != null:
return deleteSuccess(_that.categories,_that.deletedId,_that.selectedCategory,_that.currentPage,_that.totalPages);case _FailureExpenseCategories() when failure != null:
return failure(_that.categories,_that.selectedCategory,_that.currentPage,_that.totalPages,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ExpenseCategoriesState {
  const _Initial({final  List<ExpenseCategoryModel> categories = const [], this.selectedCategory, this.currentPage = 1, this.totalPages = 1, this.error}): _categories = categories;
  

 final  List<ExpenseCategoryModel> _categories;
@override@JsonKey() List<ExpenseCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  ExpenseCategoryModel? selectedCategory;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? error;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),selectedCategory,currentPage,totalPages,error);

@override
String toString() {
  return 'ExpenseCategoriesState.initial(categories: $categories, selectedCategory: $selectedCategory, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ExpenseCategoriesStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseCategoryModel> categories, ExpenseCategoryModel? selectedCategory, int currentPage, int totalPages, String? error
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? selectedCategory = freezed,Object? currentPage = null,Object? totalPages = null,Object? error = freezed,}) {
  return _then(_Initial(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryModel>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadingExpenseCategories implements ExpenseCategoriesState {
  const _LoadingExpenseCategories({final  List<ExpenseCategoryModel> categories = const [], this.selectedCategory, this.currentPage = 1, this.totalPages = 1, this.message}): _categories = categories;
  

 final  List<ExpenseCategoryModel> _categories;
@override@JsonKey() List<ExpenseCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  ExpenseCategoryModel? selectedCategory;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? message;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingExpenseCategoriesCopyWith<_LoadingExpenseCategories> get copyWith => __$LoadingExpenseCategoriesCopyWithImpl<_LoadingExpenseCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingExpenseCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),selectedCategory,currentPage,totalPages,message);

@override
String toString() {
  return 'ExpenseCategoriesState.loading(categories: $categories, selectedCategory: $selectedCategory, currentPage: $currentPage, totalPages: $totalPages, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoadingExpenseCategoriesCopyWith<$Res> implements $ExpenseCategoriesStateCopyWith<$Res> {
  factory _$LoadingExpenseCategoriesCopyWith(_LoadingExpenseCategories value, $Res Function(_LoadingExpenseCategories) _then) = __$LoadingExpenseCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseCategoryModel> categories, ExpenseCategoryModel? selectedCategory, int currentPage, int totalPages, String? message
});




}
/// @nodoc
class __$LoadingExpenseCategoriesCopyWithImpl<$Res>
    implements _$LoadingExpenseCategoriesCopyWith<$Res> {
  __$LoadingExpenseCategoriesCopyWithImpl(this._self, this._then);

  final _LoadingExpenseCategories _self;
  final $Res Function(_LoadingExpenseCategories) _then;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? selectedCategory = freezed,Object? currentPage = null,Object? totalPages = null,Object? message = freezed,}) {
  return _then(_LoadingExpenseCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryModel>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadedExpenseCategories implements ExpenseCategoriesState {
  const _LoadedExpenseCategories({required final  List<ExpenseCategoryModel> categories, this.selectedCategory, required this.currentPage, required this.totalPages}): _categories = categories;
  

 final  List<ExpenseCategoryModel> _categories;
@override List<ExpenseCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  ExpenseCategoryModel? selectedCategory;
@override final  int currentPage;
@override final  int totalPages;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedExpenseCategoriesCopyWith<_LoadedExpenseCategories> get copyWith => __$LoadedExpenseCategoriesCopyWithImpl<_LoadedExpenseCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedExpenseCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),selectedCategory,currentPage,totalPages);

@override
String toString() {
  return 'ExpenseCategoriesState.loaded(categories: $categories, selectedCategory: $selectedCategory, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$LoadedExpenseCategoriesCopyWith<$Res> implements $ExpenseCategoriesStateCopyWith<$Res> {
  factory _$LoadedExpenseCategoriesCopyWith(_LoadedExpenseCategories value, $Res Function(_LoadedExpenseCategories) _then) = __$LoadedExpenseCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseCategoryModel> categories, ExpenseCategoryModel? selectedCategory, int currentPage, int totalPages
});




}
/// @nodoc
class __$LoadedExpenseCategoriesCopyWithImpl<$Res>
    implements _$LoadedExpenseCategoriesCopyWith<$Res> {
  __$LoadedExpenseCategoriesCopyWithImpl(this._self, this._then);

  final _LoadedExpenseCategories _self;
  final $Res Function(_LoadedExpenseCategories) _then;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? selectedCategory = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_LoadedExpenseCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryModel>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CreateSuccessExpenseCategories implements ExpenseCategoriesState {
  const _CreateSuccessExpenseCategories({required final  List<ExpenseCategoryModel> categories, required this.created, this.selectedCategory, this.currentPage = 1, this.totalPages = 1}): _categories = categories;
  

 final  List<ExpenseCategoryModel> _categories;
@override List<ExpenseCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  ExpenseCategoryModel created;
@override final  ExpenseCategoryModel? selectedCategory;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSuccessExpenseCategoriesCopyWith<_CreateSuccessExpenseCategories> get copyWith => __$CreateSuccessExpenseCategoriesCopyWithImpl<_CreateSuccessExpenseCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSuccessExpenseCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.created, created) || other.created == created)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),created,selectedCategory,currentPage,totalPages);

@override
String toString() {
  return 'ExpenseCategoriesState.createSuccess(categories: $categories, created: $created, selectedCategory: $selectedCategory, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$CreateSuccessExpenseCategoriesCopyWith<$Res> implements $ExpenseCategoriesStateCopyWith<$Res> {
  factory _$CreateSuccessExpenseCategoriesCopyWith(_CreateSuccessExpenseCategories value, $Res Function(_CreateSuccessExpenseCategories) _then) = __$CreateSuccessExpenseCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseCategoryModel> categories, ExpenseCategoryModel created, ExpenseCategoryModel? selectedCategory, int currentPage, int totalPages
});




}
/// @nodoc
class __$CreateSuccessExpenseCategoriesCopyWithImpl<$Res>
    implements _$CreateSuccessExpenseCategoriesCopyWith<$Res> {
  __$CreateSuccessExpenseCategoriesCopyWithImpl(this._self, this._then);

  final _CreateSuccessExpenseCategories _self;
  final $Res Function(_CreateSuccessExpenseCategories) _then;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? created = null,Object? selectedCategory = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_CreateSuccessExpenseCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryModel>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateSuccessExpenseCategories implements ExpenseCategoriesState {
  const _UpdateSuccessExpenseCategories({required final  List<ExpenseCategoryModel> categories, required this.updated, this.selectedCategory, this.currentPage = 1, this.totalPages = 1}): _categories = categories;
  

 final  List<ExpenseCategoryModel> _categories;
@override List<ExpenseCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  ExpenseCategoryModel updated;
@override final  ExpenseCategoryModel? selectedCategory;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSuccessExpenseCategoriesCopyWith<_UpdateSuccessExpenseCategories> get copyWith => __$UpdateSuccessExpenseCategoriesCopyWithImpl<_UpdateSuccessExpenseCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSuccessExpenseCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),updated,selectedCategory,currentPage,totalPages);

@override
String toString() {
  return 'ExpenseCategoriesState.updateSuccess(categories: $categories, updated: $updated, selectedCategory: $selectedCategory, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$UpdateSuccessExpenseCategoriesCopyWith<$Res> implements $ExpenseCategoriesStateCopyWith<$Res> {
  factory _$UpdateSuccessExpenseCategoriesCopyWith(_UpdateSuccessExpenseCategories value, $Res Function(_UpdateSuccessExpenseCategories) _then) = __$UpdateSuccessExpenseCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseCategoryModel> categories, ExpenseCategoryModel updated, ExpenseCategoryModel? selectedCategory, int currentPage, int totalPages
});




}
/// @nodoc
class __$UpdateSuccessExpenseCategoriesCopyWithImpl<$Res>
    implements _$UpdateSuccessExpenseCategoriesCopyWith<$Res> {
  __$UpdateSuccessExpenseCategoriesCopyWithImpl(this._self, this._then);

  final _UpdateSuccessExpenseCategories _self;
  final $Res Function(_UpdateSuccessExpenseCategories) _then;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? updated = null,Object? selectedCategory = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_UpdateSuccessExpenseCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryModel>,updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteSuccessExpenseCategories implements ExpenseCategoriesState {
  const _DeleteSuccessExpenseCategories({required final  List<ExpenseCategoryModel> categories, required this.deletedId, this.selectedCategory, this.currentPage = 1, this.totalPages = 1}): _categories = categories;
  

 final  List<ExpenseCategoryModel> _categories;
@override List<ExpenseCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  int deletedId;
@override final  ExpenseCategoryModel? selectedCategory;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteSuccessExpenseCategoriesCopyWith<_DeleteSuccessExpenseCategories> get copyWith => __$DeleteSuccessExpenseCategoriesCopyWithImpl<_DeleteSuccessExpenseCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSuccessExpenseCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.deletedId, deletedId) || other.deletedId == deletedId)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),deletedId,selectedCategory,currentPage,totalPages);

@override
String toString() {
  return 'ExpenseCategoriesState.deleteSuccess(categories: $categories, deletedId: $deletedId, selectedCategory: $selectedCategory, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$DeleteSuccessExpenseCategoriesCopyWith<$Res> implements $ExpenseCategoriesStateCopyWith<$Res> {
  factory _$DeleteSuccessExpenseCategoriesCopyWith(_DeleteSuccessExpenseCategories value, $Res Function(_DeleteSuccessExpenseCategories) _then) = __$DeleteSuccessExpenseCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseCategoryModel> categories, int deletedId, ExpenseCategoryModel? selectedCategory, int currentPage, int totalPages
});




}
/// @nodoc
class __$DeleteSuccessExpenseCategoriesCopyWithImpl<$Res>
    implements _$DeleteSuccessExpenseCategoriesCopyWith<$Res> {
  __$DeleteSuccessExpenseCategoriesCopyWithImpl(this._self, this._then);

  final _DeleteSuccessExpenseCategories _self;
  final $Res Function(_DeleteSuccessExpenseCategories) _then;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? deletedId = null,Object? selectedCategory = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_DeleteSuccessExpenseCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryModel>,deletedId: null == deletedId ? _self.deletedId : deletedId // ignore: cast_nullable_to_non_nullable
as int,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FailureExpenseCategories implements ExpenseCategoriesState {
  const _FailureExpenseCategories({final  List<ExpenseCategoryModel> categories = const [], this.selectedCategory, this.currentPage = 1, this.totalPages = 1, required this.error}): _categories = categories;
  

 final  List<ExpenseCategoryModel> _categories;
@override@JsonKey() List<ExpenseCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  ExpenseCategoryModel? selectedCategory;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String error;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureExpenseCategoriesCopyWith<_FailureExpenseCategories> get copyWith => __$FailureExpenseCategoriesCopyWithImpl<_FailureExpenseCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureExpenseCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),selectedCategory,currentPage,totalPages,error);

@override
String toString() {
  return 'ExpenseCategoriesState.failure(categories: $categories, selectedCategory: $selectedCategory, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureExpenseCategoriesCopyWith<$Res> implements $ExpenseCategoriesStateCopyWith<$Res> {
  factory _$FailureExpenseCategoriesCopyWith(_FailureExpenseCategories value, $Res Function(_FailureExpenseCategories) _then) = __$FailureExpenseCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseCategoryModel> categories, ExpenseCategoryModel? selectedCategory, int currentPage, int totalPages, String error
});




}
/// @nodoc
class __$FailureExpenseCategoriesCopyWithImpl<$Res>
    implements _$FailureExpenseCategoriesCopyWith<$Res> {
  __$FailureExpenseCategoriesCopyWithImpl(this._self, this._then);

  final _FailureExpenseCategories _self;
  final $Res Function(_FailureExpenseCategories) _then;

/// Create a copy of ExpenseCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? selectedCategory = freezed,Object? currentPage = null,Object? totalPages = null,Object? error = null,}) {
  return _then(_FailureExpenseCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryModel>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ExpenseCategoryModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
