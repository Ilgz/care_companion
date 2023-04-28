// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrackerFormState {
  Tracker get tracker => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  Option<Either<TrackerFailure, Unit>> get authFailureSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrackerFormStateCopyWith<TrackerFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackerFormStateCopyWith<$Res> {
  factory $TrackerFormStateCopyWith(
          TrackerFormState value, $Res Function(TrackerFormState) then) =
      _$TrackerFormStateCopyWithImpl<$Res, TrackerFormState>;
  @useResult
  $Res call(
      {Tracker tracker,
      bool showErrorMessages,
      bool isSubmitting,
      bool showPassword,
      Option<Either<TrackerFailure, Unit>> authFailureSuccessOption});

  $TrackerCopyWith<$Res> get tracker;
}

/// @nodoc
class _$TrackerFormStateCopyWithImpl<$Res, $Val extends TrackerFormState>
    implements $TrackerFormStateCopyWith<$Res> {
  _$TrackerFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracker = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? showPassword = null,
    Object? authFailureSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      tracker: null == tracker
          ? _value.tracker
          : tracker // ignore: cast_nullable_to_non_nullable
              as Tracker,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureSuccessOption: null == authFailureSuccessOption
          ? _value.authFailureSuccessOption
          : authFailureSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<TrackerFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TrackerCopyWith<$Res> get tracker {
    return $TrackerCopyWith<$Res>(_value.tracker, (value) {
      return _then(_value.copyWith(tracker: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TrackerFormStateCopyWith<$Res>
    implements $TrackerFormStateCopyWith<$Res> {
  factory _$$_TrackerFormStateCopyWith(
          _$_TrackerFormState value, $Res Function(_$_TrackerFormState) then) =
      __$$_TrackerFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Tracker tracker,
      bool showErrorMessages,
      bool isSubmitting,
      bool showPassword,
      Option<Either<TrackerFailure, Unit>> authFailureSuccessOption});

  @override
  $TrackerCopyWith<$Res> get tracker;
}

/// @nodoc
class __$$_TrackerFormStateCopyWithImpl<$Res>
    extends _$TrackerFormStateCopyWithImpl<$Res, _$_TrackerFormState>
    implements _$$_TrackerFormStateCopyWith<$Res> {
  __$$_TrackerFormStateCopyWithImpl(
      _$_TrackerFormState _value, $Res Function(_$_TrackerFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracker = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? showPassword = null,
    Object? authFailureSuccessOption = null,
  }) {
    return _then(_$_TrackerFormState(
      tracker: null == tracker
          ? _value.tracker
          : tracker // ignore: cast_nullable_to_non_nullable
              as Tracker,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureSuccessOption: null == authFailureSuccessOption
          ? _value.authFailureSuccessOption
          : authFailureSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<TrackerFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_TrackerFormState implements _TrackerFormState {
  _$_TrackerFormState(
      {required this.tracker,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.showPassword,
      required this.authFailureSuccessOption});

  @override
  final Tracker tracker;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final bool showPassword;
  @override
  final Option<Either<TrackerFailure, Unit>> authFailureSuccessOption;

  @override
  String toString() {
    return 'TrackerFormState(tracker: $tracker, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, showPassword: $showPassword, authFailureSuccessOption: $authFailureSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrackerFormState &&
            (identical(other.tracker, tracker) || other.tracker == tracker) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(
                    other.authFailureSuccessOption, authFailureSuccessOption) ||
                other.authFailureSuccessOption == authFailureSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tracker, showErrorMessages,
      isSubmitting, showPassword, authFailureSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrackerFormStateCopyWith<_$_TrackerFormState> get copyWith =>
      __$$_TrackerFormStateCopyWithImpl<_$_TrackerFormState>(this, _$identity);
}

abstract class _TrackerFormState implements TrackerFormState {
  factory _TrackerFormState(
      {required final Tracker tracker,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final bool showPassword,
      required final Option<Either<TrackerFailure, Unit>>
          authFailureSuccessOption}) = _$_TrackerFormState;

  @override
  Tracker get tracker;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  bool get showPassword;
  @override
  Option<Either<TrackerFailure, Unit>> get authFailureSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_TrackerFormStateCopyWith<_$_TrackerFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
