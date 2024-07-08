import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';

String toGenerationSizeTypeText(GImageGenerationSizeType sizeType) {
  switch (sizeType) {
    case GImageGenerationSizeType.SD1_512_512:
      return '【正方形】768x768(upscale:1.5)'.i18n;
    case GImageGenerationSizeType.SD1_512_768:
      return '【縦長】768x1152(upscale:1.5)'.i18n;
    case GImageGenerationSizeType.SD1_768_512:
      return '【横長】1152x768(upscale:1.5)'.i18n;
    case GImageGenerationSizeType.SD1_384_960:
      return '【超縦長】576x1440(upscale:1.5)'.i18n;
    case GImageGenerationSizeType.SD1_960_384:
      return '【超横長】1440x576(upscale:1.5)'.i18n;
    case GImageGenerationSizeType.SD2_768_768:
      return '【正方形】768x768'.i18n;
    case GImageGenerationSizeType.SD2_768_1200:
      return '【縦長】768x1200'.i18n;
    case GImageGenerationSizeType.SD2_1200_768:
      return '【横長】1200x768'.i18n;
    case GImageGenerationSizeType.SD3_1024_1024:
      return '【正方形】1024x1024'.i18n;
    case GImageGenerationSizeType.SD3_832_1216:
      return '【縦長】832x1216'.i18n;
    case GImageGenerationSizeType.SD3_1216_832:
      return '【横長】1216x832'.i18n;
    case GImageGenerationSizeType.SD3_640_1536:
      return '【超縦長】640x1536'.i18n;
    case GImageGenerationSizeType.SD3_1536_640:
      return '【超横長】1536x640'.i18n;
    default:
      return sizeType.name.toString();
  }
}
