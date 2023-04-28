import 'package:bloc/bloc.dart';
import 'package:cash_manager/application/tracker/unit_preference_watcher/unit_preference_watcher_cubit.dart';
import 'package:cash_manager/domain/milestone/value_objects.dart';
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:cash_manager/presentation/core/utils/unit_converter_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tracker_watcher_cubit.freezed.dart';

part 'tracker_watcher_state.dart';

@injectable
class TrackerWatcherCubit extends Cubit<TrackerWatcherState> {
  final ITrackerRepository _trackerRepository;
  final UnitPreferenceWatcherCubit unitPreferenceWatcherCubit;
  TrackerWatcherCubit(this._trackerRepository,this.unitPreferenceWatcherCubit)
      : super(const TrackerWatcherState.initial());
  void init() {
    unitPreferenceWatcherCubit.stream.listen((favArticleCubitState) {
      favArticleCubitState.maybeMap(loadSuccess: (successState) {
        getTrackers();
      }, orElse: () {});
    });
  }
  Future<void> getTrackers() async {
    emit(const TrackerWatcherState.loadInProgress());
    final trackers = await _trackerRepository.getTrackers();
    final convertedTrackers =
        await convertTrackersUnits(trackers.getOrElse(() => []));
    emit(trackers.fold(
      (f) => TrackerWatcherState.loadFailure(f),
      (_) => TrackerWatcherState.loadSuccess(convertedTrackers),
    ));
  }

  Future<List<Tracker>> convertTrackersUnits(List<Tracker> trackers) async {
    final unitPreferenceResult = await _trackerRepository.getUnitPreference();
    unitPreferenceResult.fold(
      (failure) => TrackerWatcherState.loadFailure(failure),
      (unitPreference) {
        if (unitPreference.weightUnit == WeightUnit.pound) {
          trackers = trackers
              .map((tracker) => tracker.copyWith(
                    weight: Measurement(
                        kilogramsToPounds(tracker.weight.getOrCrash())),
                  ))
              .toList();
        }

        if (unitPreference.heightUnit == HeightUnit.inch) {
          trackers = trackers
              .map((tracker) => tracker.copyWith(
                    height: Measurement(
                        centimetersToInches(tracker.height.getOrCrash())),
                  ))
              .toList();
        }
      },
    );
    return trackers;
  }


}
