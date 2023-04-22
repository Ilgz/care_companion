part of 'tracker_actor_cubit.dart';

@freezed
class TrackerActorState with _$TrackerActorState {
  const factory TrackerActorState.initial() = _Initial;
  const factory TrackerActorState.loadInProgress() = _LoadInProgress;
  const factory TrackerActorState.createTrackerSuccess()=_CreateTrackerSuccess;
  const factory TrackerActorState.createTrackerFailure(TrackerFailure failureException)=_CreateTrackerFailure;
}