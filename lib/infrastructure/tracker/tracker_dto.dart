import 'package:cash_manager/domain/milestone/value_objects.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'tracker_dto.freezed.dart';

part 'tracker_dto.g.dart';

@freezed
abstract class TrackerDto implements _$TrackerDto {
  TrackerDto._();

  @HiveType(typeId: 1)
  factory TrackerDto({
    @HiveField(0) required DateTime date,
    @HiveField(1) required double height,
    @HiveField(2) required double weight,
  }) = _TrackerDto;

  factory TrackerDto.fromDomain(Tracker tracker) => TrackerDto(
      height: tracker.height.getOrCrash(),
      weight: tracker.weight.getOrCrash(),
      date: tracker.date);

  Tracker toDomain() {
    return Tracker(
        height: Measurement(height), weight: Measurement(weight), date: date);
  }
}
