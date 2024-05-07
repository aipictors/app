Map<String, double> toGenerationLoraNameMap(String prompt) {
  Map<String, double> loraNameMap = {};
  prompt.split(',').forEach((element) {
    RegExp regex = RegExp(r'<lora:([^:]+):([^>]+)>');
    Match? match = regex.firstMatch(element);

    if (match == null) return;
    try {
      loraNameMap[match.group(1)!] = double.parse(match.group(2)!);
      // ignore: empty_catches
    } on FormatException {}
  });
  return loraNameMap;
}
