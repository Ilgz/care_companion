import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/article/article_failure.dart';
import 'package:cash_manager/domain/article/i_article_repository.dart';
import 'package:cash_manager/domain/milestone/i_milestone_repository.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/domain/milestone/milestone_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'milestone_watcher_state.dart';
part 'milestone_watcher_cubit.freezed.dart';

@injectable
class MilestoneWatcherCubit extends Cubit<MilestoneWatcherState> {
  final IMilestoneRepository _iMilestoneRepository;
  MilestoneWatcherCubit(this._iMilestoneRepository)
      : super(const MilestoneWatcherState.initial());
  Future<void> getMilestones() async {
    emit(const MilestoneWatcherState.loadInProgress());
    final milestones = await _iMilestoneRepository.getMilestones();
    emit(milestones.fold((f) => MilestoneWatcherState.loadFailure(f),
            (milestones) => MilestoneWatcherState.loadSuccess(milestones)));
  }

}
