// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker_actor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrackerActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() createTrackerSuccess,
    required TResult Function(TrackerFailure failureException)
        createTrackerFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? createTrackerSuccess,
    TResult? Function(TrackerFailure failureException)? createTrackerFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? createTrackerSuccess,
    TResult Function(TrackerFailure failureException)? createTrackerFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_CreateTrackerSuccess value) createTrackerSuccess,
    required TResult Function(_CreateTrackerFailure value) createTrackerFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult? Function(_CreateTrackerFailure value)? createTrackerFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult Function(_CreateTrackerFailure value)? createTrackerFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackerActorStateCopyWith<$Res> {
  factory $TrackerActorStateCopyWith(
          TrackerActorState value, $Res Function(TrackerActorState) then) =
      _$TrackerActorStateCopyWithImpl<$Res, TrackerActorState>;
}

/// @nodoc
class _$TrackerActorStateCopyWithImpl<$Res, $Val extends TrackerActorState>
    implements $TrackerActorStateCopyWith<$Res> {
  _$TrackerActorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TrackerActorStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'TrackerActorState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() createTrackerSuccess,
    required TResult Function(TrackerFailure failureException)
        createTrackerFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? createTrackerSuccess,
    TResult? Function(TrackerFailure failureException)? createTrackerFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? createTrackerSuccess,
    TResult Function(TrackerFailure failureException)? createTrackerFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_CreateTrackerSuccess value) createTrackerSuccess,
    required TResult Function(_CreateTrackerFailure value) createTrackerFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult? Function(_CreateTrackerFailure value)? createTrackerFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult Function(_CreateTrackerFailure value)? createTrackerFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TrackerActorState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$TrackerActorStateCopyWithImpl<$Res, _$_LoadInProgress>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'TrackerActorState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() createTrackerSuccess,
    required TResult Function(TrackerFailure failureException)
        createTrackerFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? createTrackerSuccess,
    TResult? Function(TrackerFailure failureException)? createTrackerFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? createTrackerSuccess,
    TResult Function(TrackerFailure failureException)? createTrackerFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_CreateTrackerSuccess value) createTrackerSuccess,
    required TResult Function(_CreateTrackerFailure value) createTrackerFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult? Function(_CreateTrackerFailure value)? createTrackerFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult Function(_CreateTrackerFailure value)? createTrackerFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements TrackerActorState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$$_CreateTrackerSuccessCopyWith<$Res> {
  factory _$$_CreateTrackerSuccessCopyWith(_$_CreateTrackerSuccess value,
          $Res Function(_$_CreateTrackerSuccess) then) =
      __$$_CreateTrackerSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreateTrackerSuccessCopyWithImpl<$Res>
    extends _$TrackerActorStateCopyWithImpl<$Res, _$_CreateTrackerSuccess>
    implements _$$_CreateTrackerSuccessCopyWith<$Res> {
  __$$_CreateTrackerSuccessCopyWithImpl(_$_CreateTrackerSuccess _value,
      $Res Function(_$_CreateTrackerSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CreateTrackerSuccess implements _CreateTrackerSuccess {
  const _$_CreateTrackerSuccess();

  @override
  String toString() {
    return 'TrackerActorState.createTrackerSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CreateTrackerSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() createTrackerSuccess,
    required TResult Function(TrackerFailure failureException)
        createTrackerFailure,
  }) {
    return createTrackerSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? createTrackerSuccess,
    TResult? Function(TrackerFailure failureException)? createTrackerFailure,
  }) {
    return createTrackerSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? createTrackerSuccess,
    TResult Function(TrackerFailure failureException)? createTrackerFailure,
    required TResult orElse(),
  }) {
    if (createTrackerSuccess != null) {
      return createTrackerSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_CreateTrackerSuccess value) createTrackerSuccess,
    required TResult Function(_CreateTrackerFailure value) createTrackerFailure,
  }) {
    return createTrackerSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult? Function(_CreateTrackerFailure value)? createTrackerFailure,
  }) {
    return createTrackerSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult Function(_CreateTrackerFailure value)? createTrackerFailure,
    required TResult orElse(),
  }) {
    if (createTrackerSuccess != null) {
      return createTrackerSuccess(this);
    }
    return orElse();
  }
}

abstract class _CreateTrackerSuccess implements TrackerActorState {
  const factory _CreateTrackerSuccess() = _$_CreateTrackerSuccess;
}

/// @nodoc
abstract class _$$_CreateTrackerFailureCopyWith<$Res> {
  factory _$$_CreateTrackerFailureCopyWith(_$_CreateTrackerFailure value,
          $Res Function(_$_CreateTrackerFailure) then) =
      __$$_CreateTrackerFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({TrackerFailure failureException});

  $TrackerFailureCopyWith<$Res> get failureException;
}

/// @nodoc
class __$$_CreateTrackerFailureCopyWithImpl<$Res>
    extends _$TrackerActorStateCopyWithImpl<$Res, _$_CreateTrackerFailure>
    implements _$$_CreateTrackerFailureCopyWith<$Res> {
  __$$_CreateTrackerFailureCopyWithImpl(_$_CreateTrackerFailure _value,
      $Res Function(_$_CreateTrackerFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureException = null,
  }) {
    return _then(_$_CreateTrackerFailure(
      null == failureException
          ? _value.failureException
          : failureException // ignore: cast_nullable_to_non_nullable
              as TrackerFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TrackerFailureCopyWith<$Res> get failureException {
    return $TrackerFailureCopyWith<$Res>(_value.failureException, (value) {
      return _then(_value.copyWith(failureException: value));
    });
  }
}

/// @nodoc

class _$_CreateTrackerFailure implements _CreateTrackerFailure {
  const _$_CreateTrackerFailure(this.failureException);

  @override
  final TrackerFailure failureException;

  @override
  String toString() {
    return 'TrackerActorState.createTrackerFailure(failureException: $failureException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTrackerFailure &&
            (identical(other.failureException, failureException) ||
                other.failureException == failureException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateTrackerFailureCopyWith<_$_CreateTrackerFailure> get copyWith =>
      __$$_CreateTrackerFailureCopyWithImpl<_$_CreateTrackerFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() createTrackerSuccess,
    required TResult Function(TrackerFailure failureException)
        createTrackerFailure,
  }) {
    return createTrackerFailure(failureException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? createTrackerSuccess,
    TResult? Function(TrackerFailure failureException)? createTrackerFailure,
  }) {
    return createTrackerFailure?.call(failureException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? createTrackerSuccess,
    TResult Function(TrackerFailure failureException)? createTrackerFailure,
    required TResult orElse(),
  }) {
    if (createTrackerFailure != null) {
      return createTrackerFailure(failureException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_CreateTrackerSuccess value) createTrackerSuccess,
    required TResult Function(_CreateTrackerFailure value) createTrackerFailure,
  }) {
    return createTrackerFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult? Function(_CreateTrackerFailure value)? createTrackerFailure,
  }) {
    return createTrackerFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_CreateTrackerSuccess value)? createTrackerSuccess,
    TResult Function(_CreateTrackerFailure value)? createTrackerFailure,
    required TResult orElse(),
  }) {
    if (createTrackerFailure != null) {
      return createTrackerFailure(this);
    }
    return orElse();
  }
}

abstract class _CreateTrackerFailure implements TrackerActorState {
  const factory _CreateTrackerFailure(final TrackerFailure failureException) =
      _$_CreateTrackerFailure;

  TrackerFailure get failureException;
  @JsonKey(ignore: true)
  _$$_CreateTrackerFailureCopyWith<_$_CreateTrackerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
