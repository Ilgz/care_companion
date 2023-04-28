import 'package:hive_flutter/hive_flutter.dart';

part 'unit_preference.g.dart';

@HiveType(typeId: 4)
enum HeightUnit {
  @HiveField(0)
  centimeter,
  @HiveField(1)
  inch
}
extension WeightUnitExtension on WeightUnit {
  String get description {
    switch (this) {
      case WeightUnit.kilogram:
        return 'kg';
      case WeightUnit.pound:
        return 'lb';
    }
  }
}
extension HeightUnitExtension on HeightUnit {
  String get description {
    switch (this) {
      case HeightUnit.centimeter:
        return 'cm';
      case HeightUnit.inch:
        return 'in';
    }
  }
}

@HiveType(typeId: 5)
enum WeightUnit {
  @HiveField(0)
  kilogram,
  @HiveField(1)
  pound
}

@HiveType(typeId: 2)
class UnitPreference {
  @HiveField(0)
  final HeightUnit heightUnit;
  @HiveField(1)
  final WeightUnit weightUnit;

  UnitPreference({required this.heightUnit, required this.weightUnit});
}
