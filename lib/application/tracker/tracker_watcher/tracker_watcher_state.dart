part of 'tracker_watcher_cubit.dart';

@freezed
class TrackerWatcherState with _$TrackerWatcherState {
  const factory TrackerWatcherState.initial() = _Initial;
  const factory TrackerWatcherState.loadInProgress()=_LoadInProgress;
  const factory TrackerWatcherState.loadSuccess(List<Tracker> trackers )=_LoadSuccess;
  const factory TrackerWatcherState.loadFailure(TrackerFailure articleFailure)=_LoadFailure;
}
