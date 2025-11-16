// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrinterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrinterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrinterState()';
}


}

/// @nodoc
class $PrinterStateCopyWith<$Res>  {
$PrinterStateCopyWith(PrinterState _, $Res Function(PrinterState) __);
}


/// Adds pattern-matching-related methods to [PrinterState].
extension PrinterStatePatterns on PrinterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Connected value)?  connected,TResult Function( _Disconnected value)?  disconnected,TResult Function( _Connecting value)?  connecting,TResult Function( _Scanning value)?  scanning,TResult Function( _Printing value)?  printing,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Connected() when connected != null:
return connected(_that);case _Disconnected() when disconnected != null:
return disconnected(_that);case _Connecting() when connecting != null:
return connecting(_that);case _Scanning() when scanning != null:
return scanning(_that);case _Printing() when printing != null:
return printing(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Connected value)  connected,required TResult Function( _Disconnected value)  disconnected,required TResult Function( _Connecting value)  connecting,required TResult Function( _Scanning value)  scanning,required TResult Function( _Printing value)  printing,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Connected():
return connected(_that);case _Disconnected():
return disconnected(_that);case _Connecting():
return connecting(_that);case _Scanning():
return scanning(_that);case _Printing():
return printing(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Connected value)?  connected,TResult? Function( _Disconnected value)?  disconnected,TResult? Function( _Connecting value)?  connecting,TResult? Function( _Scanning value)?  scanning,TResult? Function( _Printing value)?  printing,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Connected() when connected != null:
return connected(_that);case _Disconnected() when disconnected != null:
return disconnected(_that);case _Connecting() when connecting != null:
return connecting(_that);case _Scanning() when scanning != null:
return scanning(_that);case _Printing() when printing != null:
return printing(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( BluetoothDevice device)?  connected,TResult Function()?  disconnected,TResult Function( BluetoothDevice device)?  connecting,TResult Function( List<BluetoothDevice> devices)?  scanning,TResult Function( double progress)?  printing,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Connected() when connected != null:
return connected(_that.device);case _Disconnected() when disconnected != null:
return disconnected();case _Connecting() when connecting != null:
return connecting(_that.device);case _Scanning() when scanning != null:
return scanning(_that.devices);case _Printing() when printing != null:
return printing(_that.progress);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( BluetoothDevice device)  connected,required TResult Function()  disconnected,required TResult Function( BluetoothDevice device)  connecting,required TResult Function( List<BluetoothDevice> devices)  scanning,required TResult Function( double progress)  printing,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Connected():
return connected(_that.device);case _Disconnected():
return disconnected();case _Connecting():
return connecting(_that.device);case _Scanning():
return scanning(_that.devices);case _Printing():
return printing(_that.progress);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( BluetoothDevice device)?  connected,TResult? Function()?  disconnected,TResult? Function( BluetoothDevice device)?  connecting,TResult? Function( List<BluetoothDevice> devices)?  scanning,TResult? Function( double progress)?  printing,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Connected() when connected != null:
return connected(_that.device);case _Disconnected() when disconnected != null:
return disconnected();case _Connecting() when connecting != null:
return connecting(_that.device);case _Scanning() when scanning != null:
return scanning(_that.devices);case _Printing() when printing != null:
return printing(_that.progress);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PrinterState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrinterState.initial()';
}


}




/// @nodoc


class _Connected implements PrinterState {
  const _Connected(this.device);
  

 final  BluetoothDevice device;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectedCopyWith<_Connected> get copyWith => __$ConnectedCopyWithImpl<_Connected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connected&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'PrinterState.connected(device: $device)';
}


}

/// @nodoc
abstract mixin class _$ConnectedCopyWith<$Res> implements $PrinterStateCopyWith<$Res> {
  factory _$ConnectedCopyWith(_Connected value, $Res Function(_Connected) _then) = __$ConnectedCopyWithImpl;
@useResult
$Res call({
 BluetoothDevice device
});




}
/// @nodoc
class __$ConnectedCopyWithImpl<$Res>
    implements _$ConnectedCopyWith<$Res> {
  __$ConnectedCopyWithImpl(this._self, this._then);

  final _Connected _self;
  final $Res Function(_Connected) _then;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = null,}) {
  return _then(_Connected(
null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as BluetoothDevice,
  ));
}


}

/// @nodoc


class _Disconnected implements PrinterState {
  const _Disconnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disconnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrinterState.disconnected()';
}


}




/// @nodoc


class _Connecting implements PrinterState {
  const _Connecting(this.device);
  

 final  BluetoothDevice device;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectingCopyWith<_Connecting> get copyWith => __$ConnectingCopyWithImpl<_Connecting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connecting&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'PrinterState.connecting(device: $device)';
}


}

/// @nodoc
abstract mixin class _$ConnectingCopyWith<$Res> implements $PrinterStateCopyWith<$Res> {
  factory _$ConnectingCopyWith(_Connecting value, $Res Function(_Connecting) _then) = __$ConnectingCopyWithImpl;
@useResult
$Res call({
 BluetoothDevice device
});




}
/// @nodoc
class __$ConnectingCopyWithImpl<$Res>
    implements _$ConnectingCopyWith<$Res> {
  __$ConnectingCopyWithImpl(this._self, this._then);

  final _Connecting _self;
  final $Res Function(_Connecting) _then;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = null,}) {
  return _then(_Connecting(
null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as BluetoothDevice,
  ));
}


}

/// @nodoc


class _Scanning implements PrinterState {
  const _Scanning(final  List<BluetoothDevice> devices): _devices = devices;
  

 final  List<BluetoothDevice> _devices;
 List<BluetoothDevice> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}


/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanningCopyWith<_Scanning> get copyWith => __$ScanningCopyWithImpl<_Scanning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scanning&&const DeepCollectionEquality().equals(other._devices, _devices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices));

@override
String toString() {
  return 'PrinterState.scanning(devices: $devices)';
}


}

/// @nodoc
abstract mixin class _$ScanningCopyWith<$Res> implements $PrinterStateCopyWith<$Res> {
  factory _$ScanningCopyWith(_Scanning value, $Res Function(_Scanning) _then) = __$ScanningCopyWithImpl;
@useResult
$Res call({
 List<BluetoothDevice> devices
});




}
/// @nodoc
class __$ScanningCopyWithImpl<$Res>
    implements _$ScanningCopyWith<$Res> {
  __$ScanningCopyWithImpl(this._self, this._then);

  final _Scanning _self;
  final $Res Function(_Scanning) _then;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? devices = null,}) {
  return _then(_Scanning(
null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<BluetoothDevice>,
  ));
}


}

/// @nodoc


class _Printing implements PrinterState {
  const _Printing([this.progress = 0.0]);
  

@JsonKey() final  double progress;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrintingCopyWith<_Printing> get copyWith => __$PrintingCopyWithImpl<_Printing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Printing&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'PrinterState.printing(progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$PrintingCopyWith<$Res> implements $PrinterStateCopyWith<$Res> {
  factory _$PrintingCopyWith(_Printing value, $Res Function(_Printing) _then) = __$PrintingCopyWithImpl;
@useResult
$Res call({
 double progress
});




}
/// @nodoc
class __$PrintingCopyWithImpl<$Res>
    implements _$PrintingCopyWith<$Res> {
  __$PrintingCopyWithImpl(this._self, this._then);

  final _Printing _self;
  final $Res Function(_Printing) _then;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(_Printing(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Error implements PrinterState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PrinterState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $PrinterStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of PrinterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
