// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesState {

 List<ProductCategoryApiModel> get categories; int get currentPage; int get totalPages;
/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesStateCopyWith<CategoriesState> get copyWith => _$CategoriesStateCopyWithImpl<CategoriesState>(this as CategoriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesState&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),currentPage,totalPages);

@override
String toString() {
  return 'CategoriesState(categories: $categories, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $CategoriesStateCopyWith<$Res>  {
  factory $CategoriesStateCopyWith(CategoriesState value, $Res Function(CategoriesState) _then) = _$CategoriesStateCopyWithImpl;
@useResult
$Res call({
 List<ProductCategoryApiModel> categories, int currentPage, int totalPages
});




}
/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._self, this._then);

  final CategoriesState _self;
  final $Res Function(CategoriesState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryApiModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialCategories value)?  initial,TResult Function( _LoadingCategories value)?  loading,TResult Function( _LoadedCategories value)?  loaded,TResult Function( _CreateSuccessCategories value)?  createSuccess,TResult Function( _UpdateSuccessCategories value)?  updateSuccess,TResult Function( _DeleteSuccessCategories value)?  deleteSuccess,TResult Function( _FailureCategories value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialCategories() when initial != null:
return initial(_that);case _LoadingCategories() when loading != null:
return loading(_that);case _LoadedCategories() when loaded != null:
return loaded(_that);case _CreateSuccessCategories() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessCategories() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessCategories() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureCategories() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialCategories value)  initial,required TResult Function( _LoadingCategories value)  loading,required TResult Function( _LoadedCategories value)  loaded,required TResult Function( _CreateSuccessCategories value)  createSuccess,required TResult Function( _UpdateSuccessCategories value)  updateSuccess,required TResult Function( _DeleteSuccessCategories value)  deleteSuccess,required TResult Function( _FailureCategories value)  failure,}){
final _that = this;
switch (_that) {
case _InitialCategories():
return initial(_that);case _LoadingCategories():
return loading(_that);case _LoadedCategories():
return loaded(_that);case _CreateSuccessCategories():
return createSuccess(_that);case _UpdateSuccessCategories():
return updateSuccess(_that);case _DeleteSuccessCategories():
return deleteSuccess(_that);case _FailureCategories():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialCategories value)?  initial,TResult? Function( _LoadingCategories value)?  loading,TResult? Function( _LoadedCategories value)?  loaded,TResult? Function( _CreateSuccessCategories value)?  createSuccess,TResult? Function( _UpdateSuccessCategories value)?  updateSuccess,TResult? Function( _DeleteSuccessCategories value)?  deleteSuccess,TResult? Function( _FailureCategories value)?  failure,}){
final _that = this;
switch (_that) {
case _InitialCategories() when initial != null:
return initial(_that);case _LoadingCategories() when loading != null:
return loading(_that);case _LoadedCategories() when loaded != null:
return loaded(_that);case _CreateSuccessCategories() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessCategories() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessCategories() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureCategories() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages,  String? error)?  initial,TResult Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages,  String? message)?  loading,TResult Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages)?  loaded,TResult Function( List<ProductCategoryApiModel> categories,  ProductCategoryApiModel created,  int currentPage,  int totalPages)?  createSuccess,TResult Function( List<ProductCategoryApiModel> categories,  ProductCategoryApiModel updated,  int currentPage,  int totalPages)?  updateSuccess,TResult Function( List<ProductCategoryApiModel> categories,  int deletedId,  int currentPage,  int totalPages)?  deleteSuccess,TResult Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages,  String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialCategories() when initial != null:
return initial(_that.categories,_that.currentPage,_that.totalPages,_that.error);case _LoadingCategories() when loading != null:
return loading(_that.categories,_that.currentPage,_that.totalPages,_that.message);case _LoadedCategories() when loaded != null:
return loaded(_that.categories,_that.currentPage,_that.totalPages);case _CreateSuccessCategories() when createSuccess != null:
return createSuccess(_that.categories,_that.created,_that.currentPage,_that.totalPages);case _UpdateSuccessCategories() when updateSuccess != null:
return updateSuccess(_that.categories,_that.updated,_that.currentPage,_that.totalPages);case _DeleteSuccessCategories() when deleteSuccess != null:
return deleteSuccess(_that.categories,_that.deletedId,_that.currentPage,_that.totalPages);case _FailureCategories() when failure != null:
return failure(_that.categories,_that.currentPage,_that.totalPages,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages,  String? error)  initial,required TResult Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages,  String? message)  loading,required TResult Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages)  loaded,required TResult Function( List<ProductCategoryApiModel> categories,  ProductCategoryApiModel created,  int currentPage,  int totalPages)  createSuccess,required TResult Function( List<ProductCategoryApiModel> categories,  ProductCategoryApiModel updated,  int currentPage,  int totalPages)  updateSuccess,required TResult Function( List<ProductCategoryApiModel> categories,  int deletedId,  int currentPage,  int totalPages)  deleteSuccess,required TResult Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages,  String error)  failure,}) {final _that = this;
switch (_that) {
case _InitialCategories():
return initial(_that.categories,_that.currentPage,_that.totalPages,_that.error);case _LoadingCategories():
return loading(_that.categories,_that.currentPage,_that.totalPages,_that.message);case _LoadedCategories():
return loaded(_that.categories,_that.currentPage,_that.totalPages);case _CreateSuccessCategories():
return createSuccess(_that.categories,_that.created,_that.currentPage,_that.totalPages);case _UpdateSuccessCategories():
return updateSuccess(_that.categories,_that.updated,_that.currentPage,_that.totalPages);case _DeleteSuccessCategories():
return deleteSuccess(_that.categories,_that.deletedId,_that.currentPage,_that.totalPages);case _FailureCategories():
return failure(_that.categories,_that.currentPage,_that.totalPages,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages,  String? error)?  initial,TResult? Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages,  String? message)?  loading,TResult? Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages)?  loaded,TResult? Function( List<ProductCategoryApiModel> categories,  ProductCategoryApiModel created,  int currentPage,  int totalPages)?  createSuccess,TResult? Function( List<ProductCategoryApiModel> categories,  ProductCategoryApiModel updated,  int currentPage,  int totalPages)?  updateSuccess,TResult? Function( List<ProductCategoryApiModel> categories,  int deletedId,  int currentPage,  int totalPages)?  deleteSuccess,TResult? Function( List<ProductCategoryApiModel> categories,  int currentPage,  int totalPages,  String error)?  failure,}) {final _that = this;
switch (_that) {
case _InitialCategories() when initial != null:
return initial(_that.categories,_that.currentPage,_that.totalPages,_that.error);case _LoadingCategories() when loading != null:
return loading(_that.categories,_that.currentPage,_that.totalPages,_that.message);case _LoadedCategories() when loaded != null:
return loaded(_that.categories,_that.currentPage,_that.totalPages);case _CreateSuccessCategories() when createSuccess != null:
return createSuccess(_that.categories,_that.created,_that.currentPage,_that.totalPages);case _UpdateSuccessCategories() when updateSuccess != null:
return updateSuccess(_that.categories,_that.updated,_that.currentPage,_that.totalPages);case _DeleteSuccessCategories() when deleteSuccess != null:
return deleteSuccess(_that.categories,_that.deletedId,_that.currentPage,_that.totalPages);case _FailureCategories() when failure != null:
return failure(_that.categories,_that.currentPage,_that.totalPages,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _InitialCategories implements CategoriesState {
  const _InitialCategories({final  List<ProductCategoryApiModel> categories = const <ProductCategoryApiModel>[], this.currentPage = 1, this.totalPages = 1, this.error}): _categories = categories;
  

 final  List<ProductCategoryApiModel> _categories;
@override@JsonKey() List<ProductCategoryApiModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? error;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCategoriesCopyWith<_InitialCategories> get copyWith => __$InitialCategoriesCopyWithImpl<_InitialCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),currentPage,totalPages,error);

@override
String toString() {
  return 'CategoriesState.initial(categories: $categories, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$InitialCategoriesCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$InitialCategoriesCopyWith(_InitialCategories value, $Res Function(_InitialCategories) _then) = __$InitialCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCategoryApiModel> categories, int currentPage, int totalPages, String? error
});




}
/// @nodoc
class __$InitialCategoriesCopyWithImpl<$Res>
    implements _$InitialCategoriesCopyWith<$Res> {
  __$InitialCategoriesCopyWithImpl(this._self, this._then);

  final _InitialCategories _self;
  final $Res Function(_InitialCategories) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? currentPage = null,Object? totalPages = null,Object? error = freezed,}) {
  return _then(_InitialCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryApiModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadingCategories implements CategoriesState {
  const _LoadingCategories({final  List<ProductCategoryApiModel> categories = const <ProductCategoryApiModel>[], this.currentPage = 1, this.totalPages = 1, this.message}): _categories = categories;
  

 final  List<ProductCategoryApiModel> _categories;
@override@JsonKey() List<ProductCategoryApiModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? message;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCategoriesCopyWith<_LoadingCategories> get copyWith => __$LoadingCategoriesCopyWithImpl<_LoadingCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),currentPage,totalPages,message);

@override
String toString() {
  return 'CategoriesState.loading(categories: $categories, currentPage: $currentPage, totalPages: $totalPages, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoadingCategoriesCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$LoadingCategoriesCopyWith(_LoadingCategories value, $Res Function(_LoadingCategories) _then) = __$LoadingCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCategoryApiModel> categories, int currentPage, int totalPages, String? message
});




}
/// @nodoc
class __$LoadingCategoriesCopyWithImpl<$Res>
    implements _$LoadingCategoriesCopyWith<$Res> {
  __$LoadingCategoriesCopyWithImpl(this._self, this._then);

  final _LoadingCategories _self;
  final $Res Function(_LoadingCategories) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? currentPage = null,Object? totalPages = null,Object? message = freezed,}) {
  return _then(_LoadingCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryApiModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadedCategories implements CategoriesState {
  const _LoadedCategories({required final  List<ProductCategoryApiModel> categories, required this.currentPage, required this.totalPages}): _categories = categories;
  

 final  List<ProductCategoryApiModel> _categories;
@override List<ProductCategoryApiModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  int currentPage;
@override final  int totalPages;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCategoriesCopyWith<_LoadedCategories> get copyWith => __$LoadedCategoriesCopyWithImpl<_LoadedCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),currentPage,totalPages);

@override
String toString() {
  return 'CategoriesState.loaded(categories: $categories, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$LoadedCategoriesCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$LoadedCategoriesCopyWith(_LoadedCategories value, $Res Function(_LoadedCategories) _then) = __$LoadedCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCategoryApiModel> categories, int currentPage, int totalPages
});




}
/// @nodoc
class __$LoadedCategoriesCopyWithImpl<$Res>
    implements _$LoadedCategoriesCopyWith<$Res> {
  __$LoadedCategoriesCopyWithImpl(this._self, this._then);

  final _LoadedCategories _self;
  final $Res Function(_LoadedCategories) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_LoadedCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryApiModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CreateSuccessCategories implements CategoriesState {
  const _CreateSuccessCategories({required final  List<ProductCategoryApiModel> categories, required this.created, this.currentPage = 1, this.totalPages = 1}): _categories = categories;
  

 final  List<ProductCategoryApiModel> _categories;
@override List<ProductCategoryApiModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  ProductCategoryApiModel created;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSuccessCategoriesCopyWith<_CreateSuccessCategories> get copyWith => __$CreateSuccessCategoriesCopyWithImpl<_CreateSuccessCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSuccessCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.created, created) || other.created == created)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),created,currentPage,totalPages);

@override
String toString() {
  return 'CategoriesState.createSuccess(categories: $categories, created: $created, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$CreateSuccessCategoriesCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$CreateSuccessCategoriesCopyWith(_CreateSuccessCategories value, $Res Function(_CreateSuccessCategories) _then) = __$CreateSuccessCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCategoryApiModel> categories, ProductCategoryApiModel created, int currentPage, int totalPages
});




}
/// @nodoc
class __$CreateSuccessCategoriesCopyWithImpl<$Res>
    implements _$CreateSuccessCategoriesCopyWith<$Res> {
  __$CreateSuccessCategoriesCopyWithImpl(this._self, this._then);

  final _CreateSuccessCategories _self;
  final $Res Function(_CreateSuccessCategories) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? created = null,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_CreateSuccessCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryApiModel>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as ProductCategoryApiModel,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateSuccessCategories implements CategoriesState {
  const _UpdateSuccessCategories({required final  List<ProductCategoryApiModel> categories, required this.updated, this.currentPage = 1, this.totalPages = 1}): _categories = categories;
  

 final  List<ProductCategoryApiModel> _categories;
@override List<ProductCategoryApiModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  ProductCategoryApiModel updated;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSuccessCategoriesCopyWith<_UpdateSuccessCategories> get copyWith => __$UpdateSuccessCategoriesCopyWithImpl<_UpdateSuccessCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSuccessCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),updated,currentPage,totalPages);

@override
String toString() {
  return 'CategoriesState.updateSuccess(categories: $categories, updated: $updated, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$UpdateSuccessCategoriesCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$UpdateSuccessCategoriesCopyWith(_UpdateSuccessCategories value, $Res Function(_UpdateSuccessCategories) _then) = __$UpdateSuccessCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCategoryApiModel> categories, ProductCategoryApiModel updated, int currentPage, int totalPages
});




}
/// @nodoc
class __$UpdateSuccessCategoriesCopyWithImpl<$Res>
    implements _$UpdateSuccessCategoriesCopyWith<$Res> {
  __$UpdateSuccessCategoriesCopyWithImpl(this._self, this._then);

  final _UpdateSuccessCategories _self;
  final $Res Function(_UpdateSuccessCategories) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? updated = null,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_UpdateSuccessCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryApiModel>,updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as ProductCategoryApiModel,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteSuccessCategories implements CategoriesState {
  const _DeleteSuccessCategories({required final  List<ProductCategoryApiModel> categories, required this.deletedId, this.currentPage = 1, this.totalPages = 1}): _categories = categories;
  

 final  List<ProductCategoryApiModel> _categories;
@override List<ProductCategoryApiModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  int deletedId;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteSuccessCategoriesCopyWith<_DeleteSuccessCategories> get copyWith => __$DeleteSuccessCategoriesCopyWithImpl<_DeleteSuccessCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSuccessCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.deletedId, deletedId) || other.deletedId == deletedId)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),deletedId,currentPage,totalPages);

@override
String toString() {
  return 'CategoriesState.deleteSuccess(categories: $categories, deletedId: $deletedId, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$DeleteSuccessCategoriesCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$DeleteSuccessCategoriesCopyWith(_DeleteSuccessCategories value, $Res Function(_DeleteSuccessCategories) _then) = __$DeleteSuccessCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCategoryApiModel> categories, int deletedId, int currentPage, int totalPages
});




}
/// @nodoc
class __$DeleteSuccessCategoriesCopyWithImpl<$Res>
    implements _$DeleteSuccessCategoriesCopyWith<$Res> {
  __$DeleteSuccessCategoriesCopyWithImpl(this._self, this._then);

  final _DeleteSuccessCategories _self;
  final $Res Function(_DeleteSuccessCategories) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? deletedId = null,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_DeleteSuccessCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryApiModel>,deletedId: null == deletedId ? _self.deletedId : deletedId // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FailureCategories implements CategoriesState {
  const _FailureCategories({final  List<ProductCategoryApiModel> categories = const <ProductCategoryApiModel>[], this.currentPage = 1, this.totalPages = 1, required this.error}): _categories = categories;
  

 final  List<ProductCategoryApiModel> _categories;
@override@JsonKey() List<ProductCategoryApiModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String error;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCategoriesCopyWith<_FailureCategories> get copyWith => __$FailureCategoriesCopyWithImpl<_FailureCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureCategories&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),currentPage,totalPages,error);

@override
String toString() {
  return 'CategoriesState.failure(categories: $categories, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureCategoriesCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$FailureCategoriesCopyWith(_FailureCategories value, $Res Function(_FailureCategories) _then) = __$FailureCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCategoryApiModel> categories, int currentPage, int totalPages, String error
});




}
/// @nodoc
class __$FailureCategoriesCopyWithImpl<$Res>
    implements _$FailureCategoriesCopyWith<$Res> {
  __$FailureCategoriesCopyWithImpl(this._self, this._then);

  final _FailureCategories _self;
  final $Res Function(_FailureCategories) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? currentPage = null,Object? totalPages = null,Object? error = null,}) {
  return _then(_FailureCategories(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryApiModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
