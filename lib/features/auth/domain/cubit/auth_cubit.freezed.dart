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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingAuth value)?  loadingAuth,TResult Function( _SuccessLogin value)?  successLogin,TResult Function( _ErrorAuth value)?  errorAuth,TResult Function( _SuccessRegister value)?  successRegister,TResult Function( _ErrorRegister value)?  errorRegister,TResult Function( _ChangeAuthScreenBody value)?  changeAuthScreenBody,TResult Function( _SuccessLogout value)?  successLogout,TResult Function( _SuccessForgetPassword value)?  successForgetPassword,TResult Function( _SuccessVerifyCode value)?  successVerifyCode,TResult Function( _SuccessResetPassword value)?  successResetPassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingAuth() when loadingAuth != null:
return loadingAuth(_that);case _SuccessLogin() when successLogin != null:
return successLogin(_that);case _ErrorAuth() when errorAuth != null:
return errorAuth(_that);case _SuccessRegister() when successRegister != null:
return successRegister(_that);case _ErrorRegister() when errorRegister != null:
return errorRegister(_that);case _ChangeAuthScreenBody() when changeAuthScreenBody != null:
return changeAuthScreenBody(_that);case _SuccessLogout() when successLogout != null:
return successLogout(_that);case _SuccessForgetPassword() when successForgetPassword != null:
return successForgetPassword(_that);case _SuccessVerifyCode() when successVerifyCode != null:
return successVerifyCode(_that);case _SuccessResetPassword() when successResetPassword != null:
return successResetPassword(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingAuth value)  loadingAuth,required TResult Function( _SuccessLogin value)  successLogin,required TResult Function( _ErrorAuth value)  errorAuth,required TResult Function( _SuccessRegister value)  successRegister,required TResult Function( _ErrorRegister value)  errorRegister,required TResult Function( _ChangeAuthScreenBody value)  changeAuthScreenBody,required TResult Function( _SuccessLogout value)  successLogout,required TResult Function( _SuccessForgetPassword value)  successForgetPassword,required TResult Function( _SuccessVerifyCode value)  successVerifyCode,required TResult Function( _SuccessResetPassword value)  successResetPassword,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingAuth():
return loadingAuth(_that);case _SuccessLogin():
return successLogin(_that);case _ErrorAuth():
return errorAuth(_that);case _SuccessRegister():
return successRegister(_that);case _ErrorRegister():
return errorRegister(_that);case _ChangeAuthScreenBody():
return changeAuthScreenBody(_that);case _SuccessLogout():
return successLogout(_that);case _SuccessForgetPassword():
return successForgetPassword(_that);case _SuccessVerifyCode():
return successVerifyCode(_that);case _SuccessResetPassword():
return successResetPassword(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingAuth value)?  loadingAuth,TResult? Function( _SuccessLogin value)?  successLogin,TResult? Function( _ErrorAuth value)?  errorAuth,TResult? Function( _SuccessRegister value)?  successRegister,TResult? Function( _ErrorRegister value)?  errorRegister,TResult? Function( _ChangeAuthScreenBody value)?  changeAuthScreenBody,TResult? Function( _SuccessLogout value)?  successLogout,TResult? Function( _SuccessForgetPassword value)?  successForgetPassword,TResult? Function( _SuccessVerifyCode value)?  successVerifyCode,TResult? Function( _SuccessResetPassword value)?  successResetPassword,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingAuth() when loadingAuth != null:
return loadingAuth(_that);case _SuccessLogin() when successLogin != null:
return successLogin(_that);case _ErrorAuth() when errorAuth != null:
return errorAuth(_that);case _SuccessRegister() when successRegister != null:
return successRegister(_that);case _ErrorRegister() when errorRegister != null:
return errorRegister(_that);case _ChangeAuthScreenBody() when changeAuthScreenBody != null:
return changeAuthScreenBody(_that);case _SuccessLogout() when successLogout != null:
return successLogout(_that);case _SuccessForgetPassword() when successForgetPassword != null:
return successForgetPassword(_that);case _SuccessVerifyCode() when successVerifyCode != null:
return successVerifyCode(_that);case _SuccessResetPassword() when successResetPassword != null:
return successResetPassword(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingAuth,TResult Function( UserModel userModel)?  successLogin,TResult Function( Failure failure)?  errorAuth,TResult Function( UserModel userModel)?  successRegister,TResult Function( Failure failure)?  errorRegister,TResult Function( DateTime timestamp)?  changeAuthScreenBody,TResult Function()?  successLogout,TResult Function( String message,  String email)?  successForgetPassword,TResult Function( String verifyToken)?  successVerifyCode,TResult Function( String message)?  successResetPassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingAuth() when loadingAuth != null:
return loadingAuth();case _SuccessLogin() when successLogin != null:
return successLogin(_that.userModel);case _ErrorAuth() when errorAuth != null:
return errorAuth(_that.failure);case _SuccessRegister() when successRegister != null:
return successRegister(_that.userModel);case _ErrorRegister() when errorRegister != null:
return errorRegister(_that.failure);case _ChangeAuthScreenBody() when changeAuthScreenBody != null:
return changeAuthScreenBody(_that.timestamp);case _SuccessLogout() when successLogout != null:
return successLogout();case _SuccessForgetPassword() when successForgetPassword != null:
return successForgetPassword(_that.message,_that.email);case _SuccessVerifyCode() when successVerifyCode != null:
return successVerifyCode(_that.verifyToken);case _SuccessResetPassword() when successResetPassword != null:
return successResetPassword(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingAuth,required TResult Function( UserModel userModel)  successLogin,required TResult Function( Failure failure)  errorAuth,required TResult Function( UserModel userModel)  successRegister,required TResult Function( Failure failure)  errorRegister,required TResult Function( DateTime timestamp)  changeAuthScreenBody,required TResult Function()  successLogout,required TResult Function( String message,  String email)  successForgetPassword,required TResult Function( String verifyToken)  successVerifyCode,required TResult Function( String message)  successResetPassword,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoadingAuth():
return loadingAuth();case _SuccessLogin():
return successLogin(_that.userModel);case _ErrorAuth():
return errorAuth(_that.failure);case _SuccessRegister():
return successRegister(_that.userModel);case _ErrorRegister():
return errorRegister(_that.failure);case _ChangeAuthScreenBody():
return changeAuthScreenBody(_that.timestamp);case _SuccessLogout():
return successLogout();case _SuccessForgetPassword():
return successForgetPassword(_that.message,_that.email);case _SuccessVerifyCode():
return successVerifyCode(_that.verifyToken);case _SuccessResetPassword():
return successResetPassword(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingAuth,TResult? Function( UserModel userModel)?  successLogin,TResult? Function( Failure failure)?  errorAuth,TResult? Function( UserModel userModel)?  successRegister,TResult? Function( Failure failure)?  errorRegister,TResult? Function( DateTime timestamp)?  changeAuthScreenBody,TResult? Function()?  successLogout,TResult? Function( String message,  String email)?  successForgetPassword,TResult? Function( String verifyToken)?  successVerifyCode,TResult? Function( String message)?  successResetPassword,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingAuth() when loadingAuth != null:
return loadingAuth();case _SuccessLogin() when successLogin != null:
return successLogin(_that.userModel);case _ErrorAuth() when errorAuth != null:
return errorAuth(_that.failure);case _SuccessRegister() when successRegister != null:
return successRegister(_that.userModel);case _ErrorRegister() when errorRegister != null:
return errorRegister(_that.failure);case _ChangeAuthScreenBody() when changeAuthScreenBody != null:
return changeAuthScreenBody(_that.timestamp);case _SuccessLogout() when successLogout != null:
return successLogout();case _SuccessForgetPassword() when successForgetPassword != null:
return successForgetPassword(_that.message,_that.email);case _SuccessVerifyCode() when successVerifyCode != null:
return successVerifyCode(_that.verifyToken);case _SuccessResetPassword() when successResetPassword != null:
return successResetPassword(_that.message);case _:
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
  const _ErrorAuth(this.failure);
  

 final  Failure failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorAuthCopyWith<_ErrorAuth> get copyWith => __$ErrorAuthCopyWithImpl<_ErrorAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorAuth&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthState.errorAuth(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorAuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorAuthCopyWith(_ErrorAuth value, $Res Function(_ErrorAuth) _then) = __$ErrorAuthCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$ErrorAuthCopyWithImpl<$Res>
    implements _$ErrorAuthCopyWith<$Res> {
  __$ErrorAuthCopyWithImpl(this._self, this._then);

  final _ErrorAuth _self;
  final $Res Function(_ErrorAuth) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_ErrorAuth(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
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
  const _ErrorRegister(this.failure);
  

 final  Failure failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorRegisterCopyWith<_ErrorRegister> get copyWith => __$ErrorRegisterCopyWithImpl<_ErrorRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorRegister&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthState.errorRegister(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorRegisterCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorRegisterCopyWith(_ErrorRegister value, $Res Function(_ErrorRegister) _then) = __$ErrorRegisterCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$ErrorRegisterCopyWithImpl<$Res>
    implements _$ErrorRegisterCopyWith<$Res> {
  __$ErrorRegisterCopyWithImpl(this._self, this._then);

  final _ErrorRegister _self;
  final $Res Function(_ErrorRegister) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_ErrorRegister(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc


class _ChangeAuthScreenBody implements AuthState {
  const _ChangeAuthScreenBody(this.timestamp);
  

 final  DateTime timestamp;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeAuthScreenBodyCopyWith<_ChangeAuthScreenBody> get copyWith => __$ChangeAuthScreenBodyCopyWithImpl<_ChangeAuthScreenBody>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeAuthScreenBody&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp);

@override
String toString() {
  return 'AuthState.changeAuthScreenBody(timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$ChangeAuthScreenBodyCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ChangeAuthScreenBodyCopyWith(_ChangeAuthScreenBody value, $Res Function(_ChangeAuthScreenBody) _then) = __$ChangeAuthScreenBodyCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp
});




}
/// @nodoc
class __$ChangeAuthScreenBodyCopyWithImpl<$Res>
    implements _$ChangeAuthScreenBodyCopyWith<$Res> {
  __$ChangeAuthScreenBodyCopyWithImpl(this._self, this._then);

  final _ChangeAuthScreenBody _self;
  final $Res Function(_ChangeAuthScreenBody) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timestamp = null,}) {
  return _then(_ChangeAuthScreenBody(
null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _SuccessLogout implements AuthState {
  const _SuccessLogout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessLogout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.successLogout()';
}


}




/// @nodoc


class _SuccessForgetPassword implements AuthState {
  const _SuccessForgetPassword(this.message, this.email);
  

 final  String message;
 final  String email;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessForgetPasswordCopyWith<_SuccessForgetPassword> get copyWith => __$SuccessForgetPasswordCopyWithImpl<_SuccessForgetPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessForgetPassword&&(identical(other.message, message) || other.message == message)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,message,email);

@override
String toString() {
  return 'AuthState.successForgetPassword(message: $message, email: $email)';
}


}

/// @nodoc
abstract mixin class _$SuccessForgetPasswordCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$SuccessForgetPasswordCopyWith(_SuccessForgetPassword value, $Res Function(_SuccessForgetPassword) _then) = __$SuccessForgetPasswordCopyWithImpl;
@useResult
$Res call({
 String message, String email
});




}
/// @nodoc
class __$SuccessForgetPasswordCopyWithImpl<$Res>
    implements _$SuccessForgetPasswordCopyWith<$Res> {
  __$SuccessForgetPasswordCopyWithImpl(this._self, this._then);

  final _SuccessForgetPassword _self;
  final $Res Function(_SuccessForgetPassword) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? email = null,}) {
  return _then(_SuccessForgetPassword(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SuccessVerifyCode implements AuthState {
  const _SuccessVerifyCode(this.verifyToken);
  

 final  String verifyToken;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessVerifyCodeCopyWith<_SuccessVerifyCode> get copyWith => __$SuccessVerifyCodeCopyWithImpl<_SuccessVerifyCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessVerifyCode&&(identical(other.verifyToken, verifyToken) || other.verifyToken == verifyToken));
}


@override
int get hashCode => Object.hash(runtimeType,verifyToken);

@override
String toString() {
  return 'AuthState.successVerifyCode(verifyToken: $verifyToken)';
}


}

/// @nodoc
abstract mixin class _$SuccessVerifyCodeCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$SuccessVerifyCodeCopyWith(_SuccessVerifyCode value, $Res Function(_SuccessVerifyCode) _then) = __$SuccessVerifyCodeCopyWithImpl;
@useResult
$Res call({
 String verifyToken
});




}
/// @nodoc
class __$SuccessVerifyCodeCopyWithImpl<$Res>
    implements _$SuccessVerifyCodeCopyWith<$Res> {
  __$SuccessVerifyCodeCopyWithImpl(this._self, this._then);

  final _SuccessVerifyCode _self;
  final $Res Function(_SuccessVerifyCode) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verifyToken = null,}) {
  return _then(_SuccessVerifyCode(
null == verifyToken ? _self.verifyToken : verifyToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SuccessResetPassword implements AuthState {
  const _SuccessResetPassword(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessResetPasswordCopyWith<_SuccessResetPassword> get copyWith => __$SuccessResetPasswordCopyWithImpl<_SuccessResetPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessResetPassword&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.successResetPassword(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuccessResetPasswordCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$SuccessResetPasswordCopyWith(_SuccessResetPassword value, $Res Function(_SuccessResetPassword) _then) = __$SuccessResetPasswordCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SuccessResetPasswordCopyWithImpl<$Res>
    implements _$SuccessResetPasswordCopyWith<$Res> {
  __$SuccessResetPasswordCopyWithImpl(this._self, this._then);

  final _SuccessResetPassword _self;
  final $Res Function(_SuccessResetPassword) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SuccessResetPassword(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
