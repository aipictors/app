// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_image_generation_task.var.gql.g.dart';

abstract class GViewerImageGenerationTaskVars
    implements
        Built<GViewerImageGenerationTaskVars,
            GViewerImageGenerationTaskVarsBuilder> {
  GViewerImageGenerationTaskVars._();

  factory GViewerImageGenerationTaskVars(
          [void Function(GViewerImageGenerationTaskVarsBuilder b) updates]) =
      _$GViewerImageGenerationTaskVars;

  String get id;
  static Serializer<GViewerImageGenerationTaskVars> get serializer =>
      _$gViewerImageGenerationTaskVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationTaskVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTaskVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationTaskVars.serializer,
        json,
      );
}
