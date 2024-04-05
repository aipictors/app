import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';

String toStickerGenreText(GStickerGenre n) {
  switch (n) {
    case GStickerGenre.ANIMAL:
      return '動物'.i18n;
    default:
      return n.toString();
  }
}
