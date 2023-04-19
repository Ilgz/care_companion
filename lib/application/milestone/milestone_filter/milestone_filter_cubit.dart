import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'milestone_filter_cubit.freezed.dart';

part 'milestone_filter_state.dart';
@injectable
class MilestoneFilterCubit extends Cubit<MilestoneFilterState> {
  MilestoneFilterCubit() : super(MilestoneFilterState.initial());
  changeAgeRange(String ageRange,List<Milestone> milestones) {
    emit(state.copyWith(ageRange: ageRange));
    updateMilestones(milestones);
  }
  changeCategory(String category,List<Milestone> milestones) {
    emit(state.copyWith(category: category));
    updateMilestones(milestones);
  }
  changeAgeRangeDropdownStatus(bool status) {
    emit(state.copyWith(isAgeRangeDropdownActive: status));
  }
  changeCategoryDropdownStatus(bool status) {
    emit(state.copyWith(isCategoryDropdownActive: status));
  }
  updateMilestones(List<Milestone> milestones){
   final filteredByAgeRangeMilestones= _filterMilestonesByAgeRange(milestones);
   final updatedMilestones=_filterMilestonesByCategory(filteredByAgeRangeMilestones);
   emit(state.copyWith(milestones: updatedMilestones));
  }
  List<Milestone> _filterMilestonesByAgeRange(List<Milestone> milestones) {
    if (state.ageRange == "All ages") {
      return milestones;
    } else {
      final filteredMilestones = milestones
          .toList()
          .where((milestone) {
        return Milestone.ageRangeDivisions[milestone.ageRangeIndex] ==
            state.ageRange;})
          .toList();
      return filteredMilestones;
    }
  }
  List<Milestone> _filterMilestonesByCategory(List<Milestone> milestones) {
    if (state.category == "Showing all topics") {
      return milestones;
    } else {
      final filteredMilestones = milestones
          .toList()
          .where((milestone) {
        return Milestone.milestoneCategories[milestone.category].name ==
              state.category;})
          .toList();
      return filteredMilestones;
    }
  }
}
