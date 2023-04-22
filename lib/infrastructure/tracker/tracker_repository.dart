import 'package:cash_manager/domain/milestone/i_milestone_repository.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/domain/milestone/milestone_failure.dart';
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:cash_manager/infrastructure/tracker/tracker_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ITrackerRepository)
class TrackerRepository implements ITrackerRepository {
  final Box<TrackerDto> _trackerBox;
  TrackerRepository(@Named("trackerBox") this._trackerBox);
  @override
  Future<Either<TrackerFailure, List<Tracker>>> getTrackers() async{
    final trackers=_trackerBox.values.toList().map((tracker) => tracker.toDomain()).toList();
    return right(trackers);
  }

  @override
  Future<Either<TrackerFailure, Unit>> createTracker(Tracker tracker)async {
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
      return left( const TrackerFailure.unexpected());
    }
  }


}
