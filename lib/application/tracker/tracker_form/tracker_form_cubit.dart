import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/milestone/value_objects.dart';
import 'package:cash_manager/domain/tracker/i_tracker_repository.dart';
import 'package:cash_manager/domain/tracker/tracker.dart';
import 'package:cash_manager/domain/tracker/tracker_failure.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:cash_manager/presentation/core/utils/unit_converter_util.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tracker_form_cubit.freezed.dart';

part 'tracker_form_state.dart';

@injectable
class TrackerFormCubit extends Cubit<TrackerFormState> {
  final ITrackerRepository _trackerRepository;

  TrackerFormCubit(this._trackerRepository) : super(TrackerFormState.initial());

  initializeTracker(Tracker tracker) {
    emit(state.copyWith(tracker: tracker));
  }

  trackerHeightChanged(String heightStr) {
    emit(state.copyWith(
        tracker: state.tracker.copyWith(height: Measurement(double.tryParse(heightStr)??0))));
  }

  trackerWeightChanged(String weightStr) {
    emit(state.copyWith(
        tracker: state.tracker.copyWith(weight: Measurement(double.tryParse(weightStr)??0))));
  }

  createTracker(HeightUnit heightUnit,WeightUnit weightUnit) async {
    Tracker tracker=state.tracker;
    if(heightUnit==HeightUnit.inch){
      tracker=tracker.copyWith(height: Measurement(inchesToCentimeters(tracker.height.getOrCrash())));
    }
    if (weightUnit==WeightUnit.pound){
      tracker=tracker.copyWith(weight: Measurement(poundsToKilograms(tracker.weight.getOrCrash())));
    }
    Either<TrackerFailure, Unit>? failureOrSuccess;
    state.tracker.failureOption.fold(() async {
      emit(
          state.copyWith(isSubmitting: true, authFailureSuccessOption: none()));
      failureOrSuccess = await _trackerRepository.createTracker(tracker);
      emit(
          state.copyWith(authFailureSuccessOption: optionOf(failureOrSuccess)));
    }, (_) {});
    emit(state.copyWith(
      showErrorMessages: true,
      isSubmitting: false,
    ));
  }



}
