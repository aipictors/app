// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed_popular_works.var.gql.g.dart';

abstract class GFeedPopularWorksVars
    implements Built<GFeedPopularWorksVars, GFeedPopularWorksVarsBuilder> {
  GFeedPopularWorksVars._();

  factory GFeedPopularWorksVars(
          [Function(GFeedPopularWorksVarsBuilder b) updates]) =
      _$GFeedPopularWorksVars;

  static Serializer<GFeedPopularWorksVars> get serializer =>
      _$gFeedPopularWorksVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedPopularWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedPopularWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedPopularWorksVars.serializer,
        json,
      );
}
