import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracker_failure.freezed.dart';
@freezed
abstract class TrackerFailure with _$TrackerFailure{
  const factory TrackerFailure.unexpected()=_TrackerFailure;
}