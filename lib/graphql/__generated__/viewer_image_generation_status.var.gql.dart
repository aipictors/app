// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_image_generation_status.var.gql.g.dart';

abstract class GViewerImageGenerationStatusVars
    implements
        Built<GViewerImageGenerationStatusVars,
            GViewerImageGenerationStatusVarsBuilder> {
  GViewerImageGenerationStatusVars._();

  factory GViewerImageGenerationStatusVars(
          [void Function(GViewerImageGenerationStatusVarsBuilder b) updates]) =
      _$GViewerImageGenerationStatusVars;

  static Serializer<GViewerImageGenerationStatusVars> get serializer =>
      _$gViewerImageGenerationStatusVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationStatusVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationStatusVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationStatusVars.serializer,
        json,
      );
}
