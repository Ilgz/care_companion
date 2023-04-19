part of 'milestone_filter_cubit.dart';

@freezed
class MilestoneFilterState with _$MilestoneFilterState {
  factory MilestoneFilterState(String ageRange,String category,List<Milestone> milestones,bool isCategoryDropdownActive,bool isAgeRangeDropdownActive)=_MilestoneFilterState;
  factory MilestoneFilterState.initial() => MilestoneFilterState("All ages","Showing all topics",[],false,false);
}
