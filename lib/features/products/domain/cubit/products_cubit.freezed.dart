// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsState {

 List<ProductModel> get products; ProductModel? get selectedProduct; int get currentPage; int get totalPages;
/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsStateCopyWith<ProductsState> get copyWith => _$ProductsStateCopyWithImpl<ProductsState>(this as ProductsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),selectedProduct,currentPage,totalPages);

@override
String toString() {
  return 'ProductsState(products: $products, selectedProduct: $selectedProduct, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ProductsStateCopyWith<$Res>  {
  factory $ProductsStateCopyWith(ProductsState value, $Res Function(ProductsState) _then) = _$ProductsStateCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> products, ProductModel? selectedProduct, int currentPage, int totalPages
});




}
/// @nodoc
class _$ProductsStateCopyWithImpl<$Res>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._self, this._then);

  final ProductsState _self;
  final $Res Function(ProductsState) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? selectedProduct = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as ProductModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductsState].
extension ProductsStatePatterns on ProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingProducts value)?  loading,TResult Function( _LoadedProducts value)?  loaded,TResult Function( _CreateSuccessProducts value)?  createSuccess,TResult Function( _UpdateSuccessProducts value)?  updateSuccess,TResult Function( _DeleteSuccessProducts value)?  deleteSuccess,TResult Function( _FailureProducts value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingProducts() when loading != null:
return loading(_that);case _LoadedProducts() when loaded != null:
return loaded(_that);case _CreateSuccessProducts() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessProducts() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessProducts() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureProducts() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingProducts value)  loading,required TResult Function( _LoadedProducts value)  loaded,required TResult Function( _CreateSuccessProducts value)  createSuccess,required TResult Function( _UpdateSuccessProducts value)  updateSuccess,required TResult Function( _DeleteSuccessProducts value)  deleteSuccess,required TResult Function( _FailureProducts value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingProducts():
return loading(_that);case _LoadedProducts():
return loaded(_that);case _CreateSuccessProducts():
return createSuccess(_that);case _UpdateSuccessProducts():
return updateSuccess(_that);case _DeleteSuccessProducts():
return deleteSuccess(_that);case _FailureProducts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingProducts value)?  loading,TResult? Function( _LoadedProducts value)?  loaded,TResult? Function( _CreateSuccessProducts value)?  createSuccess,TResult? Function( _UpdateSuccessProducts value)?  updateSuccess,TResult? Function( _DeleteSuccessProducts value)?  deleteSuccess,TResult? Function( _FailureProducts value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingProducts() when loading != null:
return loading(_that);case _LoadedProducts() when loaded != null:
return loaded(_that);case _CreateSuccessProducts() when createSuccess != null:
return createSuccess(_that);case _UpdateSuccessProducts() when updateSuccess != null:
return updateSuccess(_that);case _DeleteSuccessProducts() when deleteSuccess != null:
return deleteSuccess(_that);case _FailureProducts() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages,  Failure? error)?  initial,TResult Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages,  String? message)?  loading,TResult Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages)?  loaded,TResult Function( List<ProductModel> products,  ProductModel created,  ProductModel? selectedProduct,  int currentPage,  int totalPages)?  createSuccess,TResult Function( List<ProductModel> products,  ProductModel updated,  ProductModel? selectedProduct,  int currentPage,  int totalPages)?  updateSuccess,TResult Function( List<ProductModel> products,  int deletedId,  ProductModel? selectedProduct,  int currentPage,  int totalPages)?  deleteSuccess,TResult Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages,  Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages,_that.error);case _LoadingProducts() when loading != null:
return loading(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages,_that.message);case _LoadedProducts() when loaded != null:
return loaded(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages);case _CreateSuccessProducts() when createSuccess != null:
return createSuccess(_that.products,_that.created,_that.selectedProduct,_that.currentPage,_that.totalPages);case _UpdateSuccessProducts() when updateSuccess != null:
return updateSuccess(_that.products,_that.updated,_that.selectedProduct,_that.currentPage,_that.totalPages);case _DeleteSuccessProducts() when deleteSuccess != null:
return deleteSuccess(_that.products,_that.deletedId,_that.selectedProduct,_that.currentPage,_that.totalPages);case _FailureProducts() when failure != null:
return failure(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages,  Failure? error)  initial,required TResult Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages,  String? message)  loading,required TResult Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages)  loaded,required TResult Function( List<ProductModel> products,  ProductModel created,  ProductModel? selectedProduct,  int currentPage,  int totalPages)  createSuccess,required TResult Function( List<ProductModel> products,  ProductModel updated,  ProductModel? selectedProduct,  int currentPage,  int totalPages)  updateSuccess,required TResult Function( List<ProductModel> products,  int deletedId,  ProductModel? selectedProduct,  int currentPage,  int totalPages)  deleteSuccess,required TResult Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages,  Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages,_that.error);case _LoadingProducts():
return loading(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages,_that.message);case _LoadedProducts():
return loaded(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages);case _CreateSuccessProducts():
return createSuccess(_that.products,_that.created,_that.selectedProduct,_that.currentPage,_that.totalPages);case _UpdateSuccessProducts():
return updateSuccess(_that.products,_that.updated,_that.selectedProduct,_that.currentPage,_that.totalPages);case _DeleteSuccessProducts():
return deleteSuccess(_that.products,_that.deletedId,_that.selectedProduct,_that.currentPage,_that.totalPages);case _FailureProducts():
return failure(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages,  Failure? error)?  initial,TResult? Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages,  String? message)?  loading,TResult? Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages)?  loaded,TResult? Function( List<ProductModel> products,  ProductModel created,  ProductModel? selectedProduct,  int currentPage,  int totalPages)?  createSuccess,TResult? Function( List<ProductModel> products,  ProductModel updated,  ProductModel? selectedProduct,  int currentPage,  int totalPages)?  updateSuccess,TResult? Function( List<ProductModel> products,  int deletedId,  ProductModel? selectedProduct,  int currentPage,  int totalPages)?  deleteSuccess,TResult? Function( List<ProductModel> products,  ProductModel? selectedProduct,  int currentPage,  int totalPages,  Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages,_that.error);case _LoadingProducts() when loading != null:
return loading(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages,_that.message);case _LoadedProducts() when loaded != null:
return loaded(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages);case _CreateSuccessProducts() when createSuccess != null:
return createSuccess(_that.products,_that.created,_that.selectedProduct,_that.currentPage,_that.totalPages);case _UpdateSuccessProducts() when updateSuccess != null:
return updateSuccess(_that.products,_that.updated,_that.selectedProduct,_that.currentPage,_that.totalPages);case _DeleteSuccessProducts() when deleteSuccess != null:
return deleteSuccess(_that.products,_that.deletedId,_that.selectedProduct,_that.currentPage,_that.totalPages);case _FailureProducts() when failure != null:
return failure(_that.products,_that.selectedProduct,_that.currentPage,_that.totalPages,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductsState {
  const _Initial({final  List<ProductModel> products = const [], this.selectedProduct, this.currentPage = 1, this.totalPages = 1, this.error}): _products = products;
  

 final  List<ProductModel> _products;
@override@JsonKey() List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  ProductModel? selectedProduct;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  Failure? error;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),selectedProduct,currentPage,totalPages,error);

@override
String toString() {
  return 'ProductsState.initial(products: $products, selectedProduct: $selectedProduct, currentPage: $currentPage, totalPages: $totalPages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> products, ProductModel? selectedProduct, int currentPage, int totalPages, Failure? error
});


$FailureCopyWith<$Res>? get error;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? selectedProduct = freezed,Object? currentPage = null,Object? totalPages = null,Object? error = freezed,}) {
  return _then(_Initial(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as ProductModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc


class _LoadingProducts implements ProductsState {
  const _LoadingProducts({final  List<ProductModel> products = const [], this.selectedProduct, this.currentPage = 1, this.totalPages = 1, this.message}): _products = products;
  

 final  List<ProductModel> _products;
@override@JsonKey() List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  ProductModel? selectedProduct;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  String? message;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingProductsCopyWith<_LoadingProducts> get copyWith => __$LoadingProductsCopyWithImpl<_LoadingProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingProducts&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),selectedProduct,currentPage,totalPages,message);

@override
String toString() {
  return 'ProductsState.loading(products: $products, selectedProduct: $selectedProduct, currentPage: $currentPage, totalPages: $totalPages, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoadingProductsCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$LoadingProductsCopyWith(_LoadingProducts value, $Res Function(_LoadingProducts) _then) = __$LoadingProductsCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> products, ProductModel? selectedProduct, int currentPage, int totalPages, String? message
});




}
/// @nodoc
class __$LoadingProductsCopyWithImpl<$Res>
    implements _$LoadingProductsCopyWith<$Res> {
  __$LoadingProductsCopyWithImpl(this._self, this._then);

  final _LoadingProducts _self;
  final $Res Function(_LoadingProducts) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? selectedProduct = freezed,Object? currentPage = null,Object? totalPages = null,Object? message = freezed,}) {
  return _then(_LoadingProducts(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as ProductModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadedProducts implements ProductsState {
  const _LoadedProducts({required final  List<ProductModel> products, this.selectedProduct, required this.currentPage, required this.totalPages}): _products = products;
  

 final  List<ProductModel> _products;
@override List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  ProductModel? selectedProduct;
@override final  int currentPage;
@override final  int totalPages;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedProductsCopyWith<_LoadedProducts> get copyWith => __$LoadedProductsCopyWithImpl<_LoadedProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedProducts&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),selectedProduct,currentPage,totalPages);

@override
String toString() {
  return 'ProductsState.loaded(products: $products, selectedProduct: $selectedProduct, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$LoadedProductsCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$LoadedProductsCopyWith(_LoadedProducts value, $Res Function(_LoadedProducts) _then) = __$LoadedProductsCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> products, ProductModel? selectedProduct, int currentPage, int totalPages
});




}
/// @nodoc
class __$LoadedProductsCopyWithImpl<$Res>
    implements _$LoadedProductsCopyWith<$Res> {
  __$LoadedProductsCopyWithImpl(this._self, this._then);

  final _LoadedProducts _self;
  final $Res Function(_LoadedProducts) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? selectedProduct = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_LoadedProducts(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as ProductModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CreateSuccessProducts implements ProductsState {
  const _CreateSuccessProducts({required final  List<ProductModel> products, required this.created, this.selectedProduct, this.currentPage = 1, this.totalPages = 1}): _products = products;
  

 final  List<ProductModel> _products;
@override List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  ProductModel created;
@override final  ProductModel? selectedProduct;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSuccessProductsCopyWith<_CreateSuccessProducts> get copyWith => __$CreateSuccessProductsCopyWithImpl<_CreateSuccessProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSuccessProducts&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.created, created) || other.created == created)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),created,selectedProduct,currentPage,totalPages);

@override
String toString() {
  return 'ProductsState.createSuccess(products: $products, created: $created, selectedProduct: $selectedProduct, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$CreateSuccessProductsCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$CreateSuccessProductsCopyWith(_CreateSuccessProducts value, $Res Function(_CreateSuccessProducts) _then) = __$CreateSuccessProductsCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> products, ProductModel created, ProductModel? selectedProduct, int currentPage, int totalPages
});




}
/// @nodoc
class __$CreateSuccessProductsCopyWithImpl<$Res>
    implements _$CreateSuccessProductsCopyWith<$Res> {
  __$CreateSuccessProductsCopyWithImpl(this._self, this._then);

  final _CreateSuccessProducts _self;
  final $Res Function(_CreateSuccessProducts) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? created = null,Object? selectedProduct = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_CreateSuccessProducts(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as ProductModel,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as ProductModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateSuccessProducts implements ProductsState {
  const _UpdateSuccessProducts({required final  List<ProductModel> products, required this.updated, this.selectedProduct, this.currentPage = 1, this.totalPages = 1}): _products = products;
  

 final  List<ProductModel> _products;
@override List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  ProductModel updated;
@override final  ProductModel? selectedProduct;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSuccessProductsCopyWith<_UpdateSuccessProducts> get copyWith => __$UpdateSuccessProductsCopyWithImpl<_UpdateSuccessProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSuccessProducts&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),updated,selectedProduct,currentPage,totalPages);

@override
String toString() {
  return 'ProductsState.updateSuccess(products: $products, updated: $updated, selectedProduct: $selectedProduct, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$UpdateSuccessProductsCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$UpdateSuccessProductsCopyWith(_UpdateSuccessProducts value, $Res Function(_UpdateSuccessProducts) _then) = __$UpdateSuccessProductsCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> products, ProductModel updated, ProductModel? selectedProduct, int currentPage, int totalPages
});




}
/// @nodoc
class __$UpdateSuccessProductsCopyWithImpl<$Res>
    implements _$UpdateSuccessProductsCopyWith<$Res> {
  __$UpdateSuccessProductsCopyWithImpl(this._self, this._then);

  final _UpdateSuccessProducts _self;
  final $Res Function(_UpdateSuccessProducts) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? updated = null,Object? selectedProduct = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_UpdateSuccessProducts(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as ProductModel,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as ProductModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteSuccessProducts implements ProductsState {
  const _DeleteSuccessProducts({required final  List<ProductModel> products, required this.deletedId, this.selectedProduct, this.currentPage = 1, this.totalPages = 1}): _products = products;
  

 final  List<ProductModel> _products;
@override List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  int deletedId;
@override final  ProductModel? selectedProduct;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteSuccessProductsCopyWith<_DeleteSuccessProducts> get copyWith => __$DeleteSuccessProductsCopyWithImpl<_DeleteSuccessProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSuccessProducts&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.deletedId, deletedId) || other.deletedId == deletedId)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),deletedId,selectedProduct,currentPage,totalPages);

@override
String toString() {
  return 'ProductsState.deleteSuccess(products: $products, deletedId: $deletedId, selectedProduct: $selectedProduct, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$DeleteSuccessProductsCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$DeleteSuccessProductsCopyWith(_DeleteSuccessProducts value, $Res Function(_DeleteSuccessProducts) _then) = __$DeleteSuccessProductsCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> products, int deletedId, ProductModel? selectedProduct, int currentPage, int totalPages
});




}
/// @nodoc
class __$DeleteSuccessProductsCopyWithImpl<$Res>
    implements _$DeleteSuccessProductsCopyWith<$Res> {
  __$DeleteSuccessProductsCopyWithImpl(this._self, this._then);

  final _DeleteSuccessProducts _self;
  final $Res Function(_DeleteSuccessProducts) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? deletedId = null,Object? selectedProduct = freezed,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_DeleteSuccessProducts(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,deletedId: null == deletedId ? _self.deletedId : deletedId // ignore: cast_nullable_to_non_nullable
as int,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as ProductModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FailureProducts implements ProductsState {
  const _FailureProducts({final  List<ProductModel> products = const [], this.selectedProduct, this.currentPage = 1, this.totalPages = 1, required this.failure}): _products = products;
  

 final  List<ProductModel> _products;
@override@JsonKey() List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  ProductModel? selectedProduct;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
 final  Failure failure;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureProductsCopyWith<_FailureProducts> get copyWith => __$FailureProductsCopyWithImpl<_FailureProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureProducts&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.selectedProduct, selectedProduct) || other.selectedProduct == selectedProduct)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),selectedProduct,currentPage,totalPages,failure);

@override
String toString() {
  return 'ProductsState.failure(products: $products, selectedProduct: $selectedProduct, currentPage: $currentPage, totalPages: $totalPages, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureProductsCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$FailureProductsCopyWith(_FailureProducts value, $Res Function(_FailureProducts) _then) = __$FailureProductsCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> products, ProductModel? selectedProduct, int currentPage, int totalPages, Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$FailureProductsCopyWithImpl<$Res>
    implements _$FailureProductsCopyWith<$Res> {
  __$FailureProductsCopyWithImpl(this._self, this._then);

  final _FailureProducts _self;
  final $Res Function(_FailureProducts) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? selectedProduct = freezed,Object? currentPage = null,Object? totalPages = null,Object? failure = null,}) {
  return _then(_FailureProducts(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,selectedProduct: freezed == selectedProduct ? _self.selectedProduct : selectedProduct // ignore: cast_nullable_to_non_nullable
as ProductModel?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
