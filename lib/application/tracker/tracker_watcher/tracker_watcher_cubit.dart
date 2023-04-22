import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tracker_watcher_state.dart';
part 'tracker_watcher_cubit.freezed.dart';

@injectable
class TrackerWatcherCubit extends Cubit<TrackerWatcherState> {
  final ITrackerRepository _trackerRepository;
  TrackerWatcherCubit(this._trackerRepository)
      : super(const TrackerWatcherState.initial());
  Future<void> getTrackers() async {
    emit(const TrackerWatcherState.loadInProgress());
    final trackers = await _trackerRepository.getTrackers();
    emit(trackers.fold((f) => TrackerWatcherState.loadFailure(f),
            (trackers) => TrackerWatcherState.loadSuccess(trackers)));
  }
}