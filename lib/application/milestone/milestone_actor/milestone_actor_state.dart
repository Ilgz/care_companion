part of 'milestone_actor_cubit.dart';

@freezed
class MilestoneActorState with _$MilestoneActorState {
  const factory MilestoneActorState.initial() = _Initial;
  const factory MilestoneActorState.loadInProgress() = _LoadInProgress;
  const factory MilestoneActorState.changeMilestoneCompletionPhaseSuccess()=_ChangeMilestoneCompletionPhaseSuccess;
  const factory MilestoneActorState.changeMilestoneCompletionPhaseFailure(MilestoneFailure failureException)=_ChangeMilestoneCompletionPhaseFailure;
}
