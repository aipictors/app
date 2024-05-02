/// SDのバージョン
enum GenerationModelVersion {
  SD1('SD1'),
  SD2('SD2'),
  SDXL('SDXL'),
  OTHER('OTHER');

  const GenerationModelVersion(this.value);

  final String value;
  static GenerationModelVersion fromText(String value) {
    for (final item in GenerationModelVersion.values) {
      if (item.value == value) {
        return item;
      }
    }
    return GenerationModelVersion.OTHER;
  }
}
