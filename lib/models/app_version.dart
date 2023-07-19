/// バージョン
class AppVersion {
  const AppVersion(this.text);

  final String text;

  int get major {
    final textList = text.split('.');
    return int.parse(textList[0]);
  }

  int get minor {
    final textList = text.split('.');
    return int.parse(textList[1]);
  }

  int get patch {
    final textList = text.split('.');
    return int.parse(textList[2]);
  }
}
