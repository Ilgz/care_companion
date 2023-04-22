import 'package:cash_manager/domain/tracker/i_tracker_repository.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'unit_preference_actor_cubit.freezed.dart';

part 'unit_preference_actor_state.dart';

@injectable
class UnitPreferenceActorCubit extends Cubit<UnitPreferenceActorState> {
  final ITrackerRepository _trackerRepository;

  UnitPreferenceActorCubit(this._trackerRepository)
      : super(const UnitPreferenceActorState.initial());

  Future<void> saveUnitPreference(UnitPreference unitPreference) async {
    final saveResult =
        await _trackerRepository.saveUnitPreference(unitPreference);
    saveResult.fold(
      (failure) =>
          emit(UnitPreferenceActorState.saveUnitPreferenceFail(failure)),
      (_) => emit(const UnitPreferenceActorState.saveUnitPreferenceSuccess()),
    );
  }
}
