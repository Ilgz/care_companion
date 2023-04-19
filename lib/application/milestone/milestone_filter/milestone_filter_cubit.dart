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
    filterMilestonesByAgeRange(milestones);
  }
  changeDropdownStatus(bool status) {
    emit(state.copyWith(isDropdownActive: status));
  }
  filterMilestonesByAgeRange(List<Milestone> milestones) {
    if (state.ageRange == "All ages") {
      emit(state.copyWith(milestones: milestones));
    } else {
      final filteredMilestones = milestones
          .toList()
          .where((milestone) {
        return Milestone.ageRangeDivisions[milestone.ageRangeIndex] ==
              state.ageRange;})
          .toList();
      emit(state.copyWith(milestones: filteredMilestones));
    }
  }
}
