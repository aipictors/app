// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed_works.var.gql.g.dart';

abstract class GFeedWorksVars
    implements Built<GFeedWorksVars, GFeedWorksVarsBuilder> {
  GFeedWorksVars._();

  factory GFeedWorksVars([Function(GFeedWorksVarsBuilder b) updates]) =
      _$GFeedWorksVars;

  int get offset;
  int get limit;
  _i1.GWorksWhereInput? get where;
  static Serializer<GFeedWorksVars> get serializer =>
      _$gFeedWorksVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFeedWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedWorksVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFeedWorksVars.serializer,
        json,
      );
}
