import 'package:cash_manager/domain/milestone/i_milestone_repository.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/domain/milestone/milestone_failure.dart';
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:cash_manager/infrastructure/tracker/tracker_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ITrackerRepository)
class TrackerRepository implements ITrackerRepository {
  final Box<TrackerDto> _trackerBox;
  final Box<UnitPreference> _unitPreferenceBox;

  TrackerRepository(
    @Named("trackerBox") this._trackerBox,
    @Named("unitPreferenceBox") this._unitPreferenceBox,
  );

  @override
  Future<Either<TrackerFailure, List<Tracker>>> getTrackers() async {
    final trackers = _trackerBox.values
        .toList()
        .map((tracker) => tracker.toDomain())
        .toList();
    return right(trackers);
  }

  @override
  Future<Either<TrackerFailure, Unit>> createTracker(Tracker tracker) async {
    try {
      final trackersEither = await getTrackers();
      return trackersEither.fold((failure) {
        return left(failure);
      }, (trackers) async {
        if (!trackers.contains(tracker)) {
          await _trackerBox.add(TrackerDto.fromDomain(tracker));
        }
        return right(unit);
      });
    } on HiveError catch (e) {
      return left(const TrackerFailure.unexpected());
    }
  }

  @override
  Future<Either<TrackerFailure, UnitPreference>> getUnitPreference() async {
    try {
      final savedUnitPreference = _unitPreferenceBox.get('preference');
      if (savedUnitPreference != null) {
        return right(savedUnitPreference);
      } else {
        return right(UnitPreference(
            heightUnit: HeightUnit.centimeter,
            weightUnit: WeightUnit.kilogram));
      }
    } catch (e) {
      return left(const TrackerFailure.unexpected());
    }
  }

  @override
  Future<Either<TrackerFailure, Unit>> saveUnitPreference(
      UnitPreference unitPreference) async {
    try {
      _unitPreferenceBox.put('preference', unitPreference);
      return right(unit);
    } catch (e) {
      return left(const TrackerFailure.unexpected());
    }
  }
}
