import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'unit_preference_watcher_state.dart';
part 'unit_preference_watcher_cubit.freezed.dart';
@singleton
class UnitPreferenceWatcherCubit extends Cubit<UnitPreferenceWatcherState> {
  final ITrackerRepository _trackerRepository;

  UnitPreferenceWatcherCubit(this._trackerRepository) : super(const UnitPreferenceWatcherState.initial());
  Future<void> getUnitPreference() async {
    emit(const UnitPreferenceWatcherState.loadInProgress());
    final articleIdListEither = await _trackerRepository.getUnitPreference();
    emit(articleIdListEither.fold((f) => UnitPreferenceWatcherState.loadFailure(f),
            (unitPreference) => UnitPreferenceWatcherState.loadSuccess(unitPreference)));
  }
}
