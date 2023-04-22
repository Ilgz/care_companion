import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tracker_actor_cubit.freezed.dart';

part 'tracker_actor_state.dart';

@injectable
class TrackerActorCubit extends Cubit<TrackerActorState> {
  final ITrackerRepository _trackerRepository;

  TrackerActorCubit(this._trackerRepository)
      : super(const TrackerActorState.initial());
  createTracker(Tracker tracker) async {
    emit(const TrackerActorState.loadInProgress());
    final failureOrSuccess = await _trackerRepository.createTracker(tracker);
    emit(failureOrSuccess.fold((f) => TrackerActorState.createTrackerFailure(f),
        (_) => const TrackerActorState.createTrackerSuccess()));
  }
}
