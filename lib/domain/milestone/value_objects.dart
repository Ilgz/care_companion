import 'package:cash_manager/domain/core/failures.dart';
import 'package:cash_manager/domain/core/value_objects.dart';
import 'package:cash_manager/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
class Measurement extends ValueObject<double>{
  @override
  final Either<ValueFailure<double>, double>  value;
  factory Measurement(double amount){
    return Measurement._(validateAmountIsGreaterThanZero(amount));
  }
  const Measurement._(this.value);
}
