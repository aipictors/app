import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';

String toStickerGenreText(GStickerGenre n) {
  switch (n) {
    case GStickerGenre.ANIMAL:
      return '動物'.i18n;
    case GStickerGenre.BACKGROUND:
      return '背景'.i18n;
    case GStickerGenre.CHARACTER:
      return '人物'.i18n;
    case GStickerGenre.MACHINE:
      return '機械'.i18n;
    case GStickerGenre.OBJECT:
      return '物'.i18n;
    default:
      return n.toString();
  }
}
