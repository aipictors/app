import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';

String toModelCategoryText(GImageModelCategory n) {
  switch (n) {
    case GImageModelCategory.ANIMAL:
      return '獣系'.i18n;
    case GImageModelCategory.BACKGROUND:
      return '背景'.i18n;
    case GImageModelCategory.BIKINI_MODEL:
      return 'グラビア'.i18n;
    case GImageModelCategory.FIGURE:
      return 'フィギュア'.i18n;
    case GImageModelCategory.ILLUSTRATION_BOY:
      return '美男子イラスト'.i18n;
    case GImageModelCategory.ILLUSTRATION_GIRL:
      return '美少女イラスト'.i18n;
    default:
      return n.toString();
  }
}
