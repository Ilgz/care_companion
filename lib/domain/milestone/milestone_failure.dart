import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'milestone_failure.freezed.dart';
@freezed
abstract class MilestoneFailure with _$MilestoneFailure{
  const factory MilestoneFailure.unexpected()=_Unexpected;
}