part of 'tracker_welcome_set_cubit.dart';


@freezed
abstract class TrackerWelcomeSetState with _$TrackerWelcomeSetState{
  factory TrackerWelcomeSetState({required HeightUnit heightUnit,required WeightUnit weightUnit,required int heightValue ,required int weightValue,required bool showWeightForm})= _TrackerWelcomeSetState;
  factory TrackerWelcomeSetState.initial()=>TrackerWelcomeSetState(weightUnit: WeightUnit.kilogram,heightUnit: HeightUnit.centimeter,heightValue: 1,weightValue: 1,showWeightForm: false);
}