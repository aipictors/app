/// SDのバージョン
enum GenerationModelVersion {
  sd1('sd1'),
  sd2('sd2'),
  sdxl('sdxl'),
  other('other');

  const GenerationModelVersion(this.value);

  final String value;
  static GenerationModelVersion fromText(String value) {
    for (final item in GenerationModelVersion.values) {
      if (item.value.toLowerCase() == value.toLowerCase()) {
        return item;
      }
    }
    return GenerationModelVersion.other;
  }
}
