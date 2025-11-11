// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {

 List<NotificationEntity> get notifications; NotificationEntity? get selectedNotification; int get currentPage; int get totalPages; GetNotificationStatsResponse? get stats;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notifications),selectedNotification,currentPage,totalPages,stats);

@override
String toString() {
  return 'NotificationsState(notifications: $notifications, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 List<NotificationEntity> notifications, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse stats
});




}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = null,}) {
  return _then(_self.copyWith(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: null == stats ? _self.stats! : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingNotifications value)?  loading,TResult Function( _LoadedNotifications value)?  loaded,TResult Function( _StatsLoadedNotifications value)?  statsLoaded,TResult Function( _MarkAsReadSuccessNotifications value)?  markAsReadSuccess,TResult Function( _MarkAllAsReadSuccessNotifications value)?  markAllAsReadSuccess,TResult Function( _DeleteSuccessNotifications value)?  deleteSuccess,TResult Function( _ClearReadSuccessNotifications value)?  clearReadSuccess,TResult Function( _FailureNotifications value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingNotifications() when loading != null:
return loading(_that);case _LoadedNotifications() when loaded != null:
return loaded(_that);case _StatsLoadedNotifications() when statsLoaded != null:
return statsLoaded(_that);case _MarkAsReadSuccessNotifications() when markAsReadSuccess != null:
return markAsReadSuccess(_that);case _MarkAllAsReadSuccessNotifications() when markAllAsReadSuccess != null:
return markAllAsReadSuccess(_that);case _DeleteSuccessNotifications() when deleteSuccess != null:
return deleteSuccess(_that);case _ClearReadSuccessNotifications() when clearReadSuccess != null:
return clearReadSuccess(_that);case _FailureNotifications() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingNotifications value)  loading,required TResult Function( _LoadedNotifications value)  loaded,required TResult Function( _StatsLoadedNotifications value)  statsLoaded,required TResult Function( _MarkAsReadSuccessNotifications value)  markAsReadSuccess,required TResult Function( _MarkAllAsReadSuccessNotifications value)  markAllAsReadSuccess,required TResult Function( _DeleteSuccessNotifications value)  deleteSuccess,required TResult Function( _ClearReadSuccessNotifications value)  clearReadSuccess,required TResult Function( _FailureNotifications value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingNotifications():
return loading(_that);case _LoadedNotifications():
return loaded(_that);case _StatsLoadedNotifications():
return statsLoaded(_that);case _MarkAsReadSuccessNotifications():
return markAsReadSuccess(_that);case _MarkAllAsReadSuccessNotifications():
return markAllAsReadSuccess(_that);case _DeleteSuccessNotifications():
return deleteSuccess(_that);case _ClearReadSuccessNotifications():
return clearReadSuccess(_that);case _FailureNotifications():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingNotifications value)?  loading,TResult? Function( _LoadedNotifications value)?  loaded,TResult? Function( _StatsLoadedNotifications value)?  statsLoaded,TResult? Function( _MarkAsReadSuccessNotifications value)?  markAsReadSuccess,TResult? Function( _MarkAllAsReadSuccessNotifications value)?  markAllAsReadSuccess,TResult? Function( _DeleteSuccessNotifications value)?  deleteSuccess,TResult? Function( _ClearReadSuccessNotifications value)?  clearReadSuccess,TResult? Function( _FailureNotifications value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingNotifications() when loading != null:
return loading(_that);case _LoadedNotifications() when loaded != null:
return loaded(_that);case _StatsLoadedNotifications() when statsLoaded != null:
return statsLoaded(_that);case _MarkAsReadSuccessNotifications() when markAsReadSuccess != null:
return markAsReadSuccess(_that);case _MarkAllAsReadSuccessNotifications() when markAllAsReadSuccess != null:
return markAllAsReadSuccess(_that);case _DeleteSuccessNotifications() when deleteSuccess != null:
return deleteSuccess(_that);case _ClearReadSuccessNotifications() when clearReadSuccess != null:
return clearReadSuccess(_that);case _FailureNotifications() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats,  Failure? error)?  initial,TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats,  String? message)?  loading,TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  loaded,TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse stats)?  statsLoaded,TResult Function( List<NotificationEntity> notifications,  int notificationId,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  markAsReadSuccess,TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  markAllAsReadSuccess,TResult Function( List<NotificationEntity> notifications,  int deletedId,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  deleteSuccess,TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  clearReadSuccess,TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats,  Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats,_that.error);case _LoadingNotifications() when loading != null:
return loading(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats,_that.message);case _LoadedNotifications() when loaded != null:
return loaded(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _StatsLoadedNotifications() when statsLoaded != null:
return statsLoaded(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _MarkAsReadSuccessNotifications() when markAsReadSuccess != null:
return markAsReadSuccess(_that.notifications,_that.notificationId,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _MarkAllAsReadSuccessNotifications() when markAllAsReadSuccess != null:
return markAllAsReadSuccess(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _DeleteSuccessNotifications() when deleteSuccess != null:
return deleteSuccess(_that.notifications,_that.deletedId,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _ClearReadSuccessNotifications() when clearReadSuccess != null:
return clearReadSuccess(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _FailureNotifications() when failure != null:
return failure(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats,  Failure? error)  initial,required TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats,  String? message)  loading,required TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)  loaded,required TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse stats)  statsLoaded,required TResult Function( List<NotificationEntity> notifications,  int notificationId,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)  markAsReadSuccess,required TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)  markAllAsReadSuccess,required TResult Function( List<NotificationEntity> notifications,  int deletedId,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)  deleteSuccess,required TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)  clearReadSuccess,required TResult Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats,  Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats,_that.error);case _LoadingNotifications():
return loading(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats,_that.message);case _LoadedNotifications():
return loaded(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _StatsLoadedNotifications():
return statsLoaded(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _MarkAsReadSuccessNotifications():
return markAsReadSuccess(_that.notifications,_that.notificationId,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _MarkAllAsReadSuccessNotifications():
return markAllAsReadSuccess(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _DeleteSuccessNotifications():
return deleteSuccess(_that.notifications,_that.deletedId,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _ClearReadSuccessNotifications():
return clearReadSuccess(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _FailureNotifications():
return failure(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats,  Failure? error)?  initial,TResult? Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats,  String? message)?  loading,TResult? Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  loaded,TResult? Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse stats)?  statsLoaded,TResult? Function( List<NotificationEntity> notifications,  int notificationId,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  markAsReadSuccess,TResult? Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  markAllAsReadSuccess,TResult? Function( List<NotificationEntity> notifications,  int deletedId,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  deleteSuccess,TResult? Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats)?  clearReadSuccess,TResult? Function( List<NotificationEntity> notifications,  NotificationEntity? selectedNotification,  int currentPage,  int totalPages,  GetNotificationStatsResponse? stats,  Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats,_that.error);case _LoadingNotifications() when loading != null:
return loading(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats,_that.message);case _LoadedNotifications() when loaded != null:
return loaded(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _StatsLoadedNotifications() when statsLoaded != null:
return statsLoaded(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _MarkAsReadSuccessNotifications() when markAsReadSuccess != null:
return markAsReadSuccess(_that.notifications,_that.notificationId,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _MarkAllAsReadSuccessNotifications() when markAllAsReadSuccess != null:
return markAllAsReadSuccess(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _DeleteSuccessNotifications() when deleteSuccess != null:
return deleteSuccess(_that.notifications,_that.deletedId,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _ClearReadSuccessNotifications() when clearReadSuccess != null:
return clearReadSuccess(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats);case _FailureNotifications() when failure != null:
return failure(_that.notifications,_that.selectedNotification,_that.currentPage,_that.totalPages,_that.stats,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements NotificationsState {
  const _Initial({final  List<NotificationEntity> notifications = const [], this.selectedNotification, this.currentPage = 1, this.totalPages = 1, this.stats, this.error}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override@JsonKey() List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override final  NotificationEntity? selectedNotification;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override final  GetNotificationStatsResponse? stats;
 final  Failure? error;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),selectedNotification,currentPage,totalPages,stats,error);

@override
String toString() {
  return 'NotificationsState.initial(notifications: $notifications, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats, error: $error)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse? stats, Failure? error
});


$FailureCopyWith<$Res>? get error;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = freezed,Object? error = freezed,}) {
  return _then(_Initial(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of NotificationsState
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


class _LoadingNotifications implements NotificationsState {
  const _LoadingNotifications({final  List<NotificationEntity> notifications = const [], this.selectedNotification, this.currentPage = 1, this.totalPages = 1, this.stats, this.message}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override@JsonKey() List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override final  NotificationEntity? selectedNotification;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override final  GetNotificationStatsResponse? stats;
 final  String? message;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingNotificationsCopyWith<_LoadingNotifications> get copyWith => __$LoadingNotificationsCopyWithImpl<_LoadingNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingNotifications&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),selectedNotification,currentPage,totalPages,stats,message);

@override
String toString() {
  return 'NotificationsState.loading(notifications: $notifications, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoadingNotificationsCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$LoadingNotificationsCopyWith(_LoadingNotifications value, $Res Function(_LoadingNotifications) _then) = __$LoadingNotificationsCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse? stats, String? message
});




}
/// @nodoc
class __$LoadingNotificationsCopyWithImpl<$Res>
    implements _$LoadingNotificationsCopyWith<$Res> {
  __$LoadingNotificationsCopyWithImpl(this._self, this._then);

  final _LoadingNotifications _self;
  final $Res Function(_LoadingNotifications) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = freezed,Object? message = freezed,}) {
  return _then(_LoadingNotifications(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadedNotifications implements NotificationsState {
  const _LoadedNotifications({required final  List<NotificationEntity> notifications, this.selectedNotification, required this.currentPage, required this.totalPages, this.stats}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override final  NotificationEntity? selectedNotification;
@override final  int currentPage;
@override final  int totalPages;
@override final  GetNotificationStatsResponse? stats;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedNotificationsCopyWith<_LoadedNotifications> get copyWith => __$LoadedNotificationsCopyWithImpl<_LoadedNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedNotifications&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),selectedNotification,currentPage,totalPages,stats);

@override
String toString() {
  return 'NotificationsState.loaded(notifications: $notifications, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$LoadedNotificationsCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$LoadedNotificationsCopyWith(_LoadedNotifications value, $Res Function(_LoadedNotifications) _then) = __$LoadedNotificationsCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse? stats
});




}
/// @nodoc
class __$LoadedNotificationsCopyWithImpl<$Res>
    implements _$LoadedNotificationsCopyWith<$Res> {
  __$LoadedNotificationsCopyWithImpl(this._self, this._then);

  final _LoadedNotifications _self;
  final $Res Function(_LoadedNotifications) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = freezed,}) {
  return _then(_LoadedNotifications(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse?,
  ));
}


}

/// @nodoc


class _StatsLoadedNotifications implements NotificationsState {
  const _StatsLoadedNotifications({required final  List<NotificationEntity> notifications, this.selectedNotification, this.currentPage = 1, this.totalPages = 1, required this.stats}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override final  NotificationEntity? selectedNotification;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override final  GetNotificationStatsResponse stats;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsLoadedNotificationsCopyWith<_StatsLoadedNotifications> get copyWith => __$StatsLoadedNotificationsCopyWithImpl<_StatsLoadedNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsLoadedNotifications&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),selectedNotification,currentPage,totalPages,stats);

@override
String toString() {
  return 'NotificationsState.statsLoaded(notifications: $notifications, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$StatsLoadedNotificationsCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$StatsLoadedNotificationsCopyWith(_StatsLoadedNotifications value, $Res Function(_StatsLoadedNotifications) _then) = __$StatsLoadedNotificationsCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse stats
});




}
/// @nodoc
class __$StatsLoadedNotificationsCopyWithImpl<$Res>
    implements _$StatsLoadedNotificationsCopyWith<$Res> {
  __$StatsLoadedNotificationsCopyWithImpl(this._self, this._then);

  final _StatsLoadedNotifications _self;
  final $Res Function(_StatsLoadedNotifications) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = null,}) {
  return _then(_StatsLoadedNotifications(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse,
  ));
}


}

/// @nodoc


class _MarkAsReadSuccessNotifications implements NotificationsState {
  const _MarkAsReadSuccessNotifications({required final  List<NotificationEntity> notifications, required this.notificationId, this.selectedNotification, this.currentPage = 1, this.totalPages = 1, this.stats}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

 final  int notificationId;
@override final  NotificationEntity? selectedNotification;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override final  GetNotificationStatsResponse? stats;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAsReadSuccessNotificationsCopyWith<_MarkAsReadSuccessNotifications> get copyWith => __$MarkAsReadSuccessNotificationsCopyWithImpl<_MarkAsReadSuccessNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAsReadSuccessNotifications&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),notificationId,selectedNotification,currentPage,totalPages,stats);

@override
String toString() {
  return 'NotificationsState.markAsReadSuccess(notifications: $notifications, notificationId: $notificationId, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$MarkAsReadSuccessNotificationsCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$MarkAsReadSuccessNotificationsCopyWith(_MarkAsReadSuccessNotifications value, $Res Function(_MarkAsReadSuccessNotifications) _then) = __$MarkAsReadSuccessNotificationsCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, int notificationId, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse? stats
});




}
/// @nodoc
class __$MarkAsReadSuccessNotificationsCopyWithImpl<$Res>
    implements _$MarkAsReadSuccessNotificationsCopyWith<$Res> {
  __$MarkAsReadSuccessNotificationsCopyWithImpl(this._self, this._then);

  final _MarkAsReadSuccessNotifications _self;
  final $Res Function(_MarkAsReadSuccessNotifications) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? notificationId = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = freezed,}) {
  return _then(_MarkAsReadSuccessNotifications(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as int,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse?,
  ));
}


}

/// @nodoc


class _MarkAllAsReadSuccessNotifications implements NotificationsState {
  const _MarkAllAsReadSuccessNotifications({required final  List<NotificationEntity> notifications, this.selectedNotification, this.currentPage = 1, this.totalPages = 1, this.stats}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override final  NotificationEntity? selectedNotification;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override final  GetNotificationStatsResponse? stats;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAllAsReadSuccessNotificationsCopyWith<_MarkAllAsReadSuccessNotifications> get copyWith => __$MarkAllAsReadSuccessNotificationsCopyWithImpl<_MarkAllAsReadSuccessNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAllAsReadSuccessNotifications&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),selectedNotification,currentPage,totalPages,stats);

@override
String toString() {
  return 'NotificationsState.markAllAsReadSuccess(notifications: $notifications, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$MarkAllAsReadSuccessNotificationsCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$MarkAllAsReadSuccessNotificationsCopyWith(_MarkAllAsReadSuccessNotifications value, $Res Function(_MarkAllAsReadSuccessNotifications) _then) = __$MarkAllAsReadSuccessNotificationsCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse? stats
});




}
/// @nodoc
class __$MarkAllAsReadSuccessNotificationsCopyWithImpl<$Res>
    implements _$MarkAllAsReadSuccessNotificationsCopyWith<$Res> {
  __$MarkAllAsReadSuccessNotificationsCopyWithImpl(this._self, this._then);

  final _MarkAllAsReadSuccessNotifications _self;
  final $Res Function(_MarkAllAsReadSuccessNotifications) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = freezed,}) {
  return _then(_MarkAllAsReadSuccessNotifications(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse?,
  ));
}


}

/// @nodoc


class _DeleteSuccessNotifications implements NotificationsState {
  const _DeleteSuccessNotifications({required final  List<NotificationEntity> notifications, required this.deletedId, this.selectedNotification, this.currentPage = 1, this.totalPages = 1, this.stats}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

 final  int deletedId;
@override final  NotificationEntity? selectedNotification;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override final  GetNotificationStatsResponse? stats;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteSuccessNotificationsCopyWith<_DeleteSuccessNotifications> get copyWith => __$DeleteSuccessNotificationsCopyWithImpl<_DeleteSuccessNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSuccessNotifications&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.deletedId, deletedId) || other.deletedId == deletedId)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),deletedId,selectedNotification,currentPage,totalPages,stats);

@override
String toString() {
  return 'NotificationsState.deleteSuccess(notifications: $notifications, deletedId: $deletedId, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$DeleteSuccessNotificationsCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$DeleteSuccessNotificationsCopyWith(_DeleteSuccessNotifications value, $Res Function(_DeleteSuccessNotifications) _then) = __$DeleteSuccessNotificationsCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, int deletedId, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse? stats
});




}
/// @nodoc
class __$DeleteSuccessNotificationsCopyWithImpl<$Res>
    implements _$DeleteSuccessNotificationsCopyWith<$Res> {
  __$DeleteSuccessNotificationsCopyWithImpl(this._self, this._then);

  final _DeleteSuccessNotifications _self;
  final $Res Function(_DeleteSuccessNotifications) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? deletedId = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = freezed,}) {
  return _then(_DeleteSuccessNotifications(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,deletedId: null == deletedId ? _self.deletedId : deletedId // ignore: cast_nullable_to_non_nullable
as int,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse?,
  ));
}


}

/// @nodoc


class _ClearReadSuccessNotifications implements NotificationsState {
  const _ClearReadSuccessNotifications({required final  List<NotificationEntity> notifications, this.selectedNotification, this.currentPage = 1, this.totalPages = 1, this.stats}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override final  NotificationEntity? selectedNotification;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override final  GetNotificationStatsResponse? stats;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClearReadSuccessNotificationsCopyWith<_ClearReadSuccessNotifications> get copyWith => __$ClearReadSuccessNotificationsCopyWithImpl<_ClearReadSuccessNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearReadSuccessNotifications&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),selectedNotification,currentPage,totalPages,stats);

@override
String toString() {
  return 'NotificationsState.clearReadSuccess(notifications: $notifications, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$ClearReadSuccessNotificationsCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$ClearReadSuccessNotificationsCopyWith(_ClearReadSuccessNotifications value, $Res Function(_ClearReadSuccessNotifications) _then) = __$ClearReadSuccessNotificationsCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse? stats
});




}
/// @nodoc
class __$ClearReadSuccessNotificationsCopyWithImpl<$Res>
    implements _$ClearReadSuccessNotificationsCopyWith<$Res> {
  __$ClearReadSuccessNotificationsCopyWithImpl(this._self, this._then);

  final _ClearReadSuccessNotifications _self;
  final $Res Function(_ClearReadSuccessNotifications) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = freezed,}) {
  return _then(_ClearReadSuccessNotifications(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse?,
  ));
}


}

/// @nodoc


class _FailureNotifications implements NotificationsState {
  const _FailureNotifications({final  List<NotificationEntity> notifications = const [], this.selectedNotification, this.currentPage = 1, this.totalPages = 1, this.stats, required this.failure}): _notifications = notifications;
  

 final  List<NotificationEntity> _notifications;
@override@JsonKey() List<NotificationEntity> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override final  NotificationEntity? selectedNotification;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override final  GetNotificationStatsResponse? stats;
 final  Failure failure;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureNotificationsCopyWith<_FailureNotifications> get copyWith => __$FailureNotificationsCopyWithImpl<_FailureNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureNotifications&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.selectedNotification, selectedNotification) || other.selectedNotification == selectedNotification)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),selectedNotification,currentPage,totalPages,stats,failure);

@override
String toString() {
  return 'NotificationsState.failure(notifications: $notifications, selectedNotification: $selectedNotification, currentPage: $currentPage, totalPages: $totalPages, stats: $stats, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureNotificationsCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$FailureNotificationsCopyWith(_FailureNotifications value, $Res Function(_FailureNotifications) _then) = __$FailureNotificationsCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationEntity> notifications, NotificationEntity? selectedNotification, int currentPage, int totalPages, GetNotificationStatsResponse? stats, Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$FailureNotificationsCopyWithImpl<$Res>
    implements _$FailureNotificationsCopyWith<$Res> {
  __$FailureNotificationsCopyWithImpl(this._self, this._then);

  final _FailureNotifications _self;
  final $Res Function(_FailureNotifications) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? selectedNotification = freezed,Object? currentPage = null,Object? totalPages = null,Object? stats = freezed,Object? failure = null,}) {
  return _then(_FailureNotifications(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,selectedNotification: freezed == selectedNotification ? _self.selectedNotification : selectedNotification // ignore: cast_nullable_to_non_nullable
as NotificationEntity?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as GetNotificationStatsResponse?,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of NotificationsState
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
