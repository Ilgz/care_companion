import 'package:hive_flutter/hive_flutter.dart';
part 'unit_preference.g.dart';
enum HeightUnit { centimeter, inch }
enum WeightUnit { kilogram, pound }
@HiveType(typeId: 2)
class UnitPreference {
  @HiveField(0)
  final HeightUnit heightUnit;
  @HiveField(1)
  final WeightUnit weightUnit;

  UnitPreference({required this.heightUnit, required this.weightUnit});
}
