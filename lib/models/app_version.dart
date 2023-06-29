/// バージョン
class AppVersion {
  const AppVersion(this.text);

  final String text;

  int get major {
    final texts = text.split('.');
    return int.parse(texts[0]);
  }

  int get minor {
    final texts = text.split('.');
    return int.parse(texts[1]);
  }

  int get patch {
    final texts = text.split('.');
    return int.parse(texts[2]);
  }
}
