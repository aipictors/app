/// 文字列を言語コードに変換する
String toLocaleCode(String localName) {
  if (localName == 'ja') {
    return 'ja';
  }

  if (localName == 'ja_JP') {
    return 'ja';
  }

  if (localName == 'en') {
    return 'en';
  }

  if (localName == 'en_US') {
    return 'en';
  }

  if (localName == 'vi') {
    return 'vi';
  }

  if (localName == 'vi_VN') {
    return 'vi';
  }

  if (localName == 'zh_Hans_CN') {
    return 'zh_cn';
  }

  if (localName == 'zh_Hans') {
    return 'zh_cn';
  }

  if (localName == 'zh_CN') {
    return 'zh_cn';
  }

  if (localName == 'zh_Hant_TW') {
    return 'zh_tw';
  }

  if (localName == 'zh_Hant') {
    return 'zh_tw';
  }

  if (localName == 'zh_TW') {
    return 'zh_tw';
  }

  if (localName == 'fr') {
    return 'fr';
  }

  if (localName == 'fr_FR') {
    return 'fr';
  }

  if (localName == 'it') {
    return 'it';
  }

  if (localName == 'it_IT') {
    return 'it';
  }

  return 'en';
}
