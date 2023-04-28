import 'package:cash_manager/application/tracker/unit_preference_actor/unit_preference_actor_cubit.dart';
import 'package:cash_manager/domain/tracker/unit_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitSelectionWidget extends StatelessWidget {
  const UnitSelectionWidget(
      {Key? key,
      this.heightUnit,
      this.weightUnit,
      required this.unitPreference})
      : super(key: key);
  final HeightUnit? heightUnit;
  final WeightUnit? weightUnit;
  final UnitPreference unitPreference;

  @override
  Widget build(BuildContext context) {
    late final String text;
    late final bool isSelected;
    if (heightUnit != null) {
      text = heightUnit!.description;
      isSelected = heightUnit == unitPreference.heightUnit;
    } else {
      text = weightUnit!.description;
      isSelected = weightUnit == unitPreference.weightUnit;
    }
    return GestureDetector(
        onTap: () {
          late UnitPreference updatedUnitPreference;
          if (heightUnit != null) {
            if(unitPreference.heightUnit!=heightUnit){
              updatedUnitPreference = UnitPreference(
                  heightUnit: heightUnit!, weightUnit: unitPreference.weightUnit);
              context
                  .read<UnitPreferenceActorCubit>()
                  .saveUnitPreference(updatedUnitPreference);
            }
          } else {
            if(unitPreference.weightUnit!=weightUnit){
              updatedUnitPreference = UnitPreference(
                  heightUnit: unitPreference.heightUnit, weightUnit: weightUnit!);
              context
                  .read<UnitPreferenceActorCubit>()
                  .saveUnitPreference(updatedUnitPreference);
            }

          }

        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected ? Colors.transparent : Color(0xfffd894f)),
              color: isSelected ? Color(0xfffd894f) : Colors.transparent,
              borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.all(4),
          child: Text(
            text,
            style:
                TextStyle(color: isSelected ? Colors.white : Color(0xfffd894f)),
          ),
        ));
  }
}
