// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hot_tags.var.gql.g.dart';

abstract class GHotTagsVars
    implements Built<GHotTagsVars, GHotTagsVarsBuilder> {
  GHotTagsVars._();

  factory GHotTagsVars([Function(GHotTagsVarsBuilder b) updates]) =
      _$GHotTagsVars;

  static Serializer<GHotTagsVars> get serializer => _$gHotTagsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotTagsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHotTagsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotTagsVars.serializer,
        json,
      );
}
