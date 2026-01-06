enum BloodGroudEnum {
  aPositive,
  aNegative,
  bPositive,
  bNegative,
  abPositive,
  abNegative,
  oPositive,
  oNegative,
}

extension BloodGroudEnumExtension on BloodGroudEnum {
  String get title {
    switch (this) {
      case BloodGroudEnum.aPositive:
        return "A+";
      case BloodGroudEnum.aNegative:
        return "A-";
      case BloodGroudEnum.bPositive:
        return "B+";
      case BloodGroudEnum.bNegative:
        return "B-";
      case BloodGroudEnum.abPositive:
        return "AB+";
      case BloodGroudEnum.abNegative:
        return "AB-";
      case BloodGroudEnum.oPositive:
        return "O+";
      case BloodGroudEnum.oNegative:
        return "O-";
    }
  }
}
