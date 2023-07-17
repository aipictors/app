// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_bookmarked_works.var.gql.g.dart';

abstract class GViewerBookmarkedWorksVars
    implements
        Built<GViewerBookmarkedWorksVars, GViewerBookmarkedWorksVarsBuilder> {
  GViewerBookmarkedWorksVars._();

  factory GViewerBookmarkedWorksVars(
          [Function(GViewerBookmarkedWorksVarsBuilder b) updates]) =
      _$GViewerBookmarkedWorksVars;

  int get offset;
  int get limit;
  static Serializer<GViewerBookmarkedWorksVars> get serializer =>
      _$gViewerBookmarkedWorksVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerBookmarkedWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerBookmarkedWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerBookmarkedWorksVars.serializer,
        json,
      );
}
