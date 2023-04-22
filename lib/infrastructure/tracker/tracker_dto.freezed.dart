// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracker_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrackerDto {
  @HiveField(0)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(1)
  double get height => throw _privateConstructorUsedError;
  @HiveField(2)
  double get weight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrackerDtoCopyWith<TrackerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackerDtoCopyWith<$Res> {
  factory $TrackerDtoCopyWith(
          TrackerDto value, $Res Function(TrackerDto) then) =
      _$TrackerDtoCopyWithImpl<$Res, TrackerDto>;
  @useResult
  $Res call(
      {@HiveField(0) DateTime date,
      @HiveField(1) double height,
      @HiveField(2) double weight});
}

/// @nodoc
class _$TrackerDtoCopyWithImpl<$Res, $Val extends TrackerDto>
    implements $TrackerDtoCopyWith<$Res> {
  _$TrackerDtoCopyWithImpl(this._value, this._then);

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
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrackerDtoCopyWith<$Res>
    implements $TrackerDtoCopyWith<$Res> {
  factory _$$_TrackerDtoCopyWith(
          _$_TrackerDto value, $Res Function(_$_TrackerDto) then) =
      __$$_TrackerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) DateTime date,
      @HiveField(1) double height,
      @HiveField(2) double weight});
}

/// @nodoc
class __$$_TrackerDtoCopyWithImpl<$Res>
    extends _$TrackerDtoCopyWithImpl<$Res, _$_TrackerDto>
    implements _$$_TrackerDtoCopyWith<$Res> {
  __$$_TrackerDtoCopyWithImpl(
      _$_TrackerDto _value, $Res Function(_$_TrackerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_$_TrackerDto(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1)
class _$_TrackerDto extends _TrackerDto {
  _$_TrackerDto(
      {@HiveField(0) required this.date,
      @HiveField(1) required this.height,
      @HiveField(2) required this.weight})
      : super._();

  @override
  @HiveField(0)
  final DateTime date;
  @override
  @HiveField(1)
  final double height;
  @override
  @HiveField(2)
  final double weight;

  @override
  String toString() {
    return 'TrackerDto(date: $date, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrackerDto &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, height, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrackerDtoCopyWith<_$_TrackerDto> get copyWith =>
      __$$_TrackerDtoCopyWithImpl<_$_TrackerDto>(this, _$identity);
}

abstract class _TrackerDto extends TrackerDto {
  factory _TrackerDto(
      {@HiveField(0) required final DateTime date,
      @HiveField(1) required final double height,
      @HiveField(2) required final double weight}) = _$_TrackerDto;
  _TrackerDto._() : super._();

  @override
  @HiveField(0)
  DateTime get date;
  @override
  @HiveField(1)
  double get height;
  @override
  @HiveField(2)
  double get weight;
  @override
  @JsonKey(ignore: true)
  _$$_TrackerDtoCopyWith<_$_TrackerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
