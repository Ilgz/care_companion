import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/milestone/i_milestone_repository.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/domain/milestone/milestone_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'milestone_actor_cubit.freezed.dart';

part 'milestone_actor_state.dart';

@injectable
class MilestoneActorCubit extends Cubit<MilestoneActorState> {
  final IMilestoneRepository _milestoneRepository;

  MilestoneActorCubit(this._milestoneRepository)
      : super(const MilestoneActorState.initial());

  changeCompletionPhase(Milestone milestone) async {
    emit(const MilestoneActorState.loadInProgress());
    final failureOrSuccess =
        await _milestoneRepository.changeMilestoneCompletionPhase(milestone);
    emit(failureOrSuccess.fold(
        (f) => MilestoneActorState.changeMilestoneCompletionPhaseFailure(f),
        (_) =>
            const MilestoneActorState.changeMilestoneCompletionPhaseSuccess()));
  }
}
