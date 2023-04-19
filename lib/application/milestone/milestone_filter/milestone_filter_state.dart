part of 'milestone_filter_cubit.dart';

@freezed
class MilestoneFilterState with _$MilestoneFilterState {
  factory MilestoneFilterState(String ageRange,List<Milestone> milestones,bool isDropdownActive)=_MilestoneFilterState;
  factory MilestoneFilterState.initial() => MilestoneFilterState("All ages",[],false);
}
