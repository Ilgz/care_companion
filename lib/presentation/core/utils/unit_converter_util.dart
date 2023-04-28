//Weight

double kilogramsToPounds(double kilograms) {
  return kilograms * 2.20462;
}

double poundsToKilograms(double pounds) {
  return pounds / 2.20462;
}

//Height
double centimetersToInches(double centimeters) {
  return centimeters / 2.54;
}

double inchesToCentimeters(double inches) {
  return inches * 2.54;
}

//Both
String formatDecimalValueForCreationDialog(double value){
  List<String> parts = value.toString().split('.');
  if (parts.length == 2 && parts[1] == '0') {
    int intValue = value.toInt();
    return intValue.toString();
  } else {
    return value.toStringAsFixed(1);
  }
}