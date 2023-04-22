part of 'unit_preference_actor_cubit.dart';

@freezed
class UnitPreferenceActorState with _$UnitPreferenceActorState {
  const factory UnitPreferenceActorState.initial() = _Initial;
  const factory UnitPreferenceActorState.saveUnitPreferenceSuccess() = _SaveUnitPreferenceSuccess;
  const factory UnitPreferenceActorState.saveUnitPreferenceFail(TrackerFailure failure) = _SaveUnitPreferenceFail;
}