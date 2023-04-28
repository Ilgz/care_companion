// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IntroState {
  bool get isFirstTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntroStateCopyWith<IntroState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroStateCopyWith<$Res> {
  factory $IntroStateCopyWith(
          IntroState value, $Res Function(IntroState) then) =
      _$IntroStateCopyWithImpl<$Res, IntroState>;
  @useResult
  $Res call({bool isFirstTime});
}

/// @nodoc
class _$IntroStateCopyWithImpl<$Res, $Val extends IntroState>
    implements $IntroStateCopyWith<$Res> {
  _$IntroStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstTime = null,
  }) {
    return _then(_value.copyWith(
      isFirstTime: null == isFirstTime
          ? _value.isFirstTime
          : isFirstTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IntroStateCopyWith<$Res>
    implements $IntroStateCopyWith<$Res> {
  factory _$$_IntroStateCopyWith(
          _$_IntroState value, $Res Function(_$_IntroState) then) =
      __$$_IntroStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFirstTime});
}

/// @nodoc
class __$$_IntroStateCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res, _$_IntroState>
    implements _$$_IntroStateCopyWith<$Res> {
  __$$_IntroStateCopyWithImpl(
      _$_IntroState _value, $Res Function(_$_IntroState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstTime = null,
  }) {
    return _then(_$_IntroState(
      isFirstTime: null == isFirstTime
          ? _value.isFirstTime
          : isFirstTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IntroState extends _IntroState {
  const _$_IntroState({required this.isFirstTime}) : super._();

  @override
  final bool isFirstTime;

  @override
  String toString() {
    return 'IntroState(isFirstTime: $isFirstTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IntroState &&
            (identical(other.isFirstTime, isFirstTime) ||
                other.isFirstTime == isFirstTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFirstTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IntroStateCopyWith<_$_IntroState> get copyWith =>
      __$$_IntroStateCopyWithImpl<_$_IntroState>(this, _$identity);
}

abstract class _IntroState extends IntroState {
  const factory _IntroState({required final bool isFirstTime}) = _$_IntroState;
  const _IntroState._() : super._();

  @override
  bool get isFirstTime;
  @override
  @JsonKey(ignore: true)
  _$$_IntroStateCopyWith<_$_IntroState> get copyWith =>
      throw _privateConstructorUsedError;
}
