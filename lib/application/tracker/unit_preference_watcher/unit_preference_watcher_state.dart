part of 'unit_preference_watcher_cubit.dart';

@freezed
class UnitPreferenceWatcherState with _$UnitPreferenceWatcherState {
  const factory UnitPreferenceWatcherState.initial() = _Initial;
  const factory UnitPreferenceWatcherState.loadInProgress()=_LoadInProgress;
  const factory UnitPreferenceWatcherState.loadSuccess(UnitPreference unitPreference)=_LoadSuccess;
  const factory UnitPreferenceWatcherState.loadFailure(TrackerFailure articleFailure)=_LoadFailure;
}