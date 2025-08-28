// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingAuth value)?  loadingAuth,TResult Function( _SuccessLogin value)?  successLogin,TResult Function( _ErrorAuth value)?  errorAuth,TResult Function( _SuccessRegister value)?  successRegister,TResult Function( _ErrorRegister value)?  errorRegister,TResult Function( _ChangeAuthScreenBody value)?  changeAuthScreenBody,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingAuth() when loadingAuth != null:
return loadingAuth(_that);case _SuccessLogin() when successLogin != null:
return successLogin(_that);case _ErrorAuth() when errorAuth != null:
return errorAuth(_that);case _SuccessRegister() when successRegister != null:
return successRegister(_that);case _ErrorRegister() when errorRegister != null:
return errorRegister(_that);case _ChangeAuthScreenBody() when changeAuthScreenBody != null:
return changeAuthScreenBody(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingAuth value)  loadingAuth,required TResult Function( _SuccessLogin value)  successLogin,required TResult Function( _ErrorAuth value)  errorAuth,required TResult Function( _SuccessRegister value)  successRegister,required TResult Function( _ErrorRegister value)  errorRegister,required TResult Function( _ChangeAuthScreenBody value)  changeAuthScreenBody,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingAuth():
return loadingAuth(_that);case _SuccessLogin():
return successLogin(_that);case _ErrorAuth():
return errorAuth(_that);case _SuccessRegister():
return successRegister(_that);case _ErrorRegister():
return errorRegister(_that);case _ChangeAuthScreenBody():
return changeAuthScreenBody(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingAuth value)?  loadingAuth,TResult? Function( _SuccessLogin value)?  successLogin,TResult? Function( _ErrorAuth value)?  errorAuth,TResult? Function( _SuccessRegister value)?  successRegister,TResult? Function( _ErrorRegister value)?  errorRegister,TResult? Function( _ChangeAuthScreenBody value)?  changeAuthScreenBody,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingAuth() when loadingAuth != null:
return loadingAuth(_that);case _SuccessLogin() when successLogin != null:
return successLogin(_that);case _ErrorAuth() when errorAuth != null:
return errorAuth(_that);case _SuccessRegister() when successRegister != null:
return successRegister(_that);case _ErrorRegister() when errorRegister != null:
return errorRegister(_that);case _ChangeAuthScreenBody() when changeAuthScreenBody != null:
return changeAuthScreenBody(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingAuth,TResult Function( UserModel userModel)?  successLogin,TResult Function( String error)?  errorAuth,TResult Function( UserModel userModel)?  successRegister,TResult Function( String error)?  errorRegister,TResult Function()?  changeAuthScreenBody,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingAuth() when loadingAuth != null:
return loadingAuth();case _SuccessLogin() when successLogin != null:
return successLogin(_that.userModel);case _ErrorAuth() when errorAuth != null:
return errorAuth(_that.error);case _SuccessRegister() when successRegister != null:
return successRegister(_that.userModel);case _ErrorRegister() when errorRegister != null:
return errorRegister(_that.error);case _ChangeAuthScreenBody() when changeAuthScreenBody != null:
return changeAuthScreenBody();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingAuth,required TResult Function( UserModel userModel)  successLogin,required TResult Function( String error)  errorAuth,required TResult Function( UserModel userModel)  successRegister,required TResult Function( String error)  errorRegister,required TResult Function()  changeAuthScreenBody,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoadingAuth():
return loadingAuth();case _SuccessLogin():
return successLogin(_that.userModel);case _ErrorAuth():
return errorAuth(_that.error);case _SuccessRegister():
return successRegister(_that.userModel);case _ErrorRegister():
return errorRegister(_that.error);case _ChangeAuthScreenBody():
return changeAuthScreenBody();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingAuth,TResult? Function( UserModel userModel)?  successLogin,TResult? Function( String error)?  errorAuth,TResult? Function( UserModel userModel)?  successRegister,TResult? Function( String error)?  errorRegister,TResult? Function()?  changeAuthScreenBody,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingAuth() when loadingAuth != null:
return loadingAuth();case _SuccessLogin() when successLogin != null:
return successLogin(_that.userModel);case _ErrorAuth() when errorAuth != null:
return errorAuth(_that.error);case _SuccessRegister() when successRegister != null:
return successRegister(_that.userModel);case _ErrorRegister() when errorRegister != null:
return errorRegister(_that.error);case _ChangeAuthScreenBody() when changeAuthScreenBody != null:
return changeAuthScreenBody();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _LoadingAuth implements AuthState {
  const _LoadingAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loadingAuth()';
}


}




/// @nodoc


class _SuccessLogin implements AuthState {
  const _SuccessLogin(this.userModel);
  

 final  UserModel userModel;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessLoginCopyWith<_SuccessLogin> get copyWith => __$SuccessLoginCopyWithImpl<_SuccessLogin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessLogin&&(identical(other.userModel, userModel) || other.userModel == userModel));
}


@override
int get hashCode => Object.hash(runtimeType,userModel);

@override
String toString() {
  return 'AuthState.successLogin(userModel: $userModel)';
}


}

/// @nodoc
abstract mixin class _$SuccessLoginCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$SuccessLoginCopyWith(_SuccessLogin value, $Res Function(_SuccessLogin) _then) = __$SuccessLoginCopyWithImpl;
@useResult
$Res call({
 UserModel userModel
});




}
/// @nodoc
class __$SuccessLoginCopyWithImpl<$Res>
    implements _$SuccessLoginCopyWith<$Res> {
  __$SuccessLoginCopyWithImpl(this._self, this._then);

  final _SuccessLogin _self;
  final $Res Function(_SuccessLogin) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userModel = null,}) {
  return _then(_SuccessLogin(
null == userModel ? _self.userModel : userModel // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}


}

/// @nodoc


class _ErrorAuth implements AuthState {
  const _ErrorAuth(this.error);
  

 final  String error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorAuthCopyWith<_ErrorAuth> get copyWith => __$ErrorAuthCopyWithImpl<_ErrorAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorAuth&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthState.errorAuth(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorAuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorAuthCopyWith(_ErrorAuth value, $Res Function(_ErrorAuth) _then) = __$ErrorAuthCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$ErrorAuthCopyWithImpl<$Res>
    implements _$ErrorAuthCopyWith<$Res> {
  __$ErrorAuthCopyWithImpl(this._self, this._then);

  final _ErrorAuth _self;
  final $Res Function(_ErrorAuth) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_ErrorAuth(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SuccessRegister implements AuthState {
  const _SuccessRegister(this.userModel);
  

 final  UserModel userModel;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessRegisterCopyWith<_SuccessRegister> get copyWith => __$SuccessRegisterCopyWithImpl<_SuccessRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessRegister&&(identical(other.userModel, userModel) || other.userModel == userModel));
}


@override
int get hashCode => Object.hash(runtimeType,userModel);

@override
String toString() {
  return 'AuthState.successRegister(userModel: $userModel)';
}


}

/// @nodoc
abstract mixin class _$SuccessRegisterCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$SuccessRegisterCopyWith(_SuccessRegister value, $Res Function(_SuccessRegister) _then) = __$SuccessRegisterCopyWithImpl;
@useResult
$Res call({
 UserModel userModel
});




}
/// @nodoc
class __$SuccessRegisterCopyWithImpl<$Res>
    implements _$SuccessRegisterCopyWith<$Res> {
  __$SuccessRegisterCopyWithImpl(this._self, this._then);

  final _SuccessRegister _self;
  final $Res Function(_SuccessRegister) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userModel = null,}) {
  return _then(_SuccessRegister(
null == userModel ? _self.userModel : userModel // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}


}

/// @nodoc


class _ErrorRegister implements AuthState {
  const _ErrorRegister(this.error);
  

 final  String error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorRegisterCopyWith<_ErrorRegister> get copyWith => __$ErrorRegisterCopyWithImpl<_ErrorRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorRegister&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthState.errorRegister(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorRegisterCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorRegisterCopyWith(_ErrorRegister value, $Res Function(_ErrorRegister) _then) = __$ErrorRegisterCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$ErrorRegisterCopyWithImpl<$Res>
    implements _$ErrorRegisterCopyWith<$Res> {
  __$ErrorRegisterCopyWithImpl(this._self, this._then);

  final _ErrorRegister _self;
  final $Res Function(_ErrorRegister) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_ErrorRegister(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangeAuthScreenBody implements AuthState {
  const _ChangeAuthScreenBody();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeAuthScreenBody);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.changeAuthScreenBody()';
}


}




// dart format on
