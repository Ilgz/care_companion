import 'package:cash_manager/presentation/core/utils/unit_converter_util.dart';

extension UnitX on double{
  String  get formatDecimalValue => formatDecimalValueForCreationDialog(this);
}