import 'package:cash_manager/domain/core/failures.dart';
import 'package:cash_manager/domain/milestone/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracker.freezed.dart';

@freezed
abstract class Tracker implements _$Tracker {
  Tracker._();

  factory Tracker({
    required DateTime date,
    required Measurement height,
    required Measurement weight,
  }) = _Tracker;

  factory Tracker.empty() {
    return Tracker(
        height: Measurement(0),
        weight: Measurement(0),
        date: DateTime.now());
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return height.failureOrUnit
        .andThen(weight.failureOrUnit)
        .fold((l) => some(l), (r) => none());
  }
}
