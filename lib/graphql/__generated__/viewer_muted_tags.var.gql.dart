// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_muted_tags.var.gql.g.dart';

abstract class GViewerMutedTagsVars
    implements Built<GViewerMutedTagsVars, GViewerMutedTagsVarsBuilder> {
  GViewerMutedTagsVars._();

  factory GViewerMutedTagsVars(
          [Function(GViewerMutedTagsVarsBuilder b) updates]) =
      _$GViewerMutedTagsVars;

  int get offset;
  int get limit;
  static Serializer<GViewerMutedTagsVars> get serializer =>
      _$gViewerMutedTagsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerMutedTagsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerMutedTagsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerMutedTagsVars.serializer,
        json,
      );
}
