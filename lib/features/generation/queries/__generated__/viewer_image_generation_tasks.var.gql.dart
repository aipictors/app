// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_image_generation_tasks.var.gql.g.dart';

abstract class GViewerImageGenerationTasksVars
    implements
        Built<GViewerImageGenerationTasksVars,
            GViewerImageGenerationTasksVarsBuilder> {
  GViewerImageGenerationTasksVars._();

  factory GViewerImageGenerationTasksVars(
          [void Function(GViewerImageGenerationTasksVarsBuilder b) updates]) =
      _$GViewerImageGenerationTasksVars;

  int get offset;
  int get limit;
  _i1.GImageGenerationTasksWhereInput? get where;
  static Serializer<GViewerImageGenerationTasksVars> get serializer =>
      _$gViewerImageGenerationTasksVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GViewerImageGenerationTasksVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTasksVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GViewerImageGenerationTasksVars.serializer,
        json,
      );
}
