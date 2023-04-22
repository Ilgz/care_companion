import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/domain/milestone/milestone_failure.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:dartz/dartz.dart';

abstract class ITrackerRepository {
  Future<Either<TrackerFailure, List<Tracker>>> getTrackers();
  Future<Either<TrackerFailure, Unit>> createTracker(
      Tracker tracker);
  Future<Either<TrackerFailure, UnitPreference>> getUnitPreference();
  Future<Either<TrackerFailure, Unit>> saveUnitPreference(UnitPreference unitPreference);

}
