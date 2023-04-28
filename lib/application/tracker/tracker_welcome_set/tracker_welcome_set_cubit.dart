import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tracker_welcome_set_cubit.freezed.dart';

part 'tracker_welcome_set_state.dart';

@injectable
class TrackerWelcomeSetCubit extends Cubit<TrackerWelcomeSetState> {
  TrackerWelcomeSetCubit() : super(TrackerWelcomeSetState.initial());

  heightUnitChanged(HeightUnit heightUnit) {
    emit(state.copyWith(heightUnit: heightUnit, heightValue: 1));
  }

  weightUnitChanged(WeightUnit weightUnit) {
    emit(state.copyWith(weightUnit: weightUnit, weightValue: 1));
  }

  heightValueChanged(int value) {
    emit(state.copyWith(heightValue: value));
  }

  weightValueChanged(int value) {
    emit(state.copyWith(weightValue: value));
  }

  showWeightForm() {
    emit(state.copyWith(showWeightForm: true));
  }
}
