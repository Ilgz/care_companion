// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MilestoneFilterState {
  String get ageRange => throw _privateConstructorUsedError;
  List<Milestone> get milestones => throw _privateConstructorUsedError;
  bool get isDropdownActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MilestoneFilterStateCopyWith<MilestoneFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MilestoneFilterStateCopyWith<$Res> {
  factory $MilestoneFilterStateCopyWith(MilestoneFilterState value,
          $Res Function(MilestoneFilterState) then) =
      _$MilestoneFilterStateCopyWithImpl<$Res, MilestoneFilterState>;
  @useResult
  $Res call(
      {String ageRange, List<Milestone> milestones, bool isDropdownActive});
}

/// @nodoc
class _$MilestoneFilterStateCopyWithImpl<$Res,
        $Val extends MilestoneFilterState>
    implements $MilestoneFilterStateCopyWith<$Res> {
  _$MilestoneFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ageRange = null,
    Object? milestones = null,
    Object? isDropdownActive = null,
  }) {
    return _then(_value.copyWith(
      ageRange: null == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as String,
      milestones: null == milestones
          ? _value.milestones
          : milestones // ignore: cast_nullable_to_non_nullable
              as List<Milestone>,
      isDropdownActive: null == isDropdownActive
          ? _value.isDropdownActive
          : isDropdownActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MilestoneFilterStateCopyWith<$Res>
    implements $MilestoneFilterStateCopyWith<$Res> {
  factory _$$_MilestoneFilterStateCopyWith(_$_MilestoneFilterState value,
          $Res Function(_$_MilestoneFilterState) then) =
      __$$_MilestoneFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ageRange, List<Milestone> milestones, bool isDropdownActive});
}

/// @nodoc
class __$$_MilestoneFilterStateCopyWithImpl<$Res>
    extends _$MilestoneFilterStateCopyWithImpl<$Res, _$_MilestoneFilterState>
    implements _$$_MilestoneFilterStateCopyWith<$Res> {
  __$$_MilestoneFilterStateCopyWithImpl(_$_MilestoneFilterState _value,
      $Res Function(_$_MilestoneFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ageRange = null,
    Object? milestones = null,
    Object? isDropdownActive = null,
  }) {
    return _then(_$_MilestoneFilterState(
      null == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as String,
      null == milestones
          ? _value._milestones
          : milestones // ignore: cast_nullable_to_non_nullable
              as List<Milestone>,
      null == isDropdownActive
          ? _value.isDropdownActive
          : isDropdownActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MilestoneFilterState implements _MilestoneFilterState {
  _$_MilestoneFilterState(
      this.ageRange, final List<Milestone> milestones, this.isDropdownActive)
      : _milestones = milestones;

  @override
  final String ageRange;
  final List<Milestone> _milestones;
  @override
  List<Milestone> get milestones {
    if (_milestones is EqualUnmodifiableListView) return _milestones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_milestones);
  }

  @override
  final bool isDropdownActive;

  @override
  String toString() {
    return 'MilestoneFilterState(ageRange: $ageRange, milestones: $milestones, isDropdownActive: $isDropdownActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MilestoneFilterState &&
            (identical(other.ageRange, ageRange) ||
                other.ageRange == ageRange) &&
            const DeepCollectionEquality()
                .equals(other._milestones, _milestones) &&
            (identical(other.isDropdownActive, isDropdownActive) ||
                other.isDropdownActive == isDropdownActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ageRange,
      const DeepCollectionEquality().hash(_milestones), isDropdownActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MilestoneFilterStateCopyWith<_$_MilestoneFilterState> get copyWith =>
      __$$_MilestoneFilterStateCopyWithImpl<_$_MilestoneFilterState>(
          this, _$identity);
}

abstract class _MilestoneFilterState implements MilestoneFilterState {
  factory _MilestoneFilterState(
      final String ageRange,
      final List<Milestone> milestones,
      final bool isDropdownActive) = _$_MilestoneFilterState;

  @override
  String get ageRange;
  @override
  List<Milestone> get milestones;
  @override
  bool get isDropdownActive;
  @override
  @JsonKey(ignore: true)
  _$$_MilestoneFilterStateCopyWith<_$_MilestoneFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
