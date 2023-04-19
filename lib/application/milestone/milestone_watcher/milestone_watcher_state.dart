part of 'milestone_watcher_cubit.dart';

@freezed
class MilestoneWatcherState with _$MilestoneWatcherState {
  const factory MilestoneWatcherState.initial() = _Initial;
  const factory MilestoneWatcherState.loadInProgress()=_LoadInProgress;
  const factory MilestoneWatcherState.loadSuccess(List<Milestone> milestones )=_LoadSuccess;
  const factory MilestoneWatcherState.loadFailure(MilestoneFailure milestoneFailure)=_LoadFailure;
}