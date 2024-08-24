// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_liked_works.var.gql.g.dart';

abstract class GViewerLikedWorksVars
    implements Built<GViewerLikedWorksVars, GViewerLikedWorksVarsBuilder> {
  GViewerLikedWorksVars._();

  factory GViewerLikedWorksVars(
          [void Function(GViewerLikedWorksVarsBuilder b) updates]) =
      _$GViewerLikedWorksVars;

  int get offset;
  int get limit;
  static Serializer<GViewerLikedWorksVars> get serializer =>
      _$gViewerLikedWorksVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerLikedWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerLikedWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerLikedWorksVars.serializer,
        json,
      );
}
