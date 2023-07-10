// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_feed_works.var.gql.g.dart';

abstract class GViewerFeedWorksVars
    implements Built<GViewerFeedWorksVars, GViewerFeedWorksVarsBuilder> {
  GViewerFeedWorksVars._();

  factory GViewerFeedWorksVars(
          [Function(GViewerFeedWorksVarsBuilder b) updates]) =
      _$GViewerFeedWorksVars;

  int get offset;
  int get limit;
  static Serializer<GViewerFeedWorksVars> get serializer =>
      _$gViewerFeedWorksVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFeedWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerFeedWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFeedWorksVars.serializer,
        json,
      );
}
