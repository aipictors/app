/// 文字列を言語コードに変換する
String toLocaleCode(String localName) {
  if (localName == 'ja') {
    return 'ja';
  }
  if (localName == 'ja_JP') {
    return 'ja';
  }
  return 'en';
}
