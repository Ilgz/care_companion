// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Tracker {
  DateTime get date => throw _privateConstructorUsedError;
  Measurement get height => throw _privateConstructorUsedError;
  Measurement get weight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrackerCopyWith<Tracker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackerCopyWith<$Res> {
  factory $TrackerCopyWith(Tracker value, $Res Function(Tracker) then) =
      _$TrackerCopyWithImpl<$Res, Tracker>;
  @useResult
  $Res call({DateTime date, Measurement height, Measurement weight});
}

/// @nodoc
class _$TrackerCopyWithImpl<$Res, $Val extends Tracker>
    implements $TrackerCopyWith<$Res> {
  _$TrackerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as Measurement,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Measurement,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrackerCopyWith<$Res> implements $TrackerCopyWith<$Res> {
  factory _$$_TrackerCopyWith(
          _$_Tracker value, $Res Function(_$_Tracker) then) =
      __$$_TrackerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, Measurement height, Measurement weight});
}

/// @nodoc
class __$$_TrackerCopyWithImpl<$Res>
    extends _$TrackerCopyWithImpl<$Res, _$_Tracker>
    implements _$$_TrackerCopyWith<$Res> {
  __$$_TrackerCopyWithImpl(_$_Tracker _value, $Res Function(_$_Tracker) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_$_Tracker(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as Measurement,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Measurement,
    ));
  }
}

/// @nodoc

class _$_Tracker extends _Tracker {
  _$_Tracker({required this.date, required this.height, required this.weight})
      : super._();

  @override
  final DateTime date;
  @override
  final Measurement height;
  @override
  final Measurement weight;

  @override
  String toString() {
    return 'Tracker(date: $date, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tracker &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, height, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrackerCopyWith<_$_Tracker> get copyWith =>
      __$$_TrackerCopyWithImpl<_$_Tracker>(this, _$identity);
}

abstract class _Tracker extends Tracker {
  factory _Tracker(
      {required final DateTime date,
      required final Measurement height,
      required final Measurement weight}) = _$_Tracker;
  _Tracker._() : super._();

  @override
  DateTime get date;
  @override
  Measurement get height;
  @override
  Measurement get weight;
  @override
  @JsonKey(ignore: true)
  _$$_TrackerCopyWith<_$_Tracker> get copyWith =>
      throw _privateConstructorUsedError;
}
