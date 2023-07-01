enum SurveySex {
  female('female'),
  male('male'),
  other('other');

  const SurveySex(this.value);

  final String value;

  static SurveySex fromText(String value) {
    for (final item in SurveySex.values) {
      if (item.value == value) {
        return item;
      }
    }
    return SurveySex.other;
  }
}
