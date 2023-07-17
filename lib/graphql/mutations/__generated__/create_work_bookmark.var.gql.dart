// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_work_bookmark.var.gql.g.dart';

abstract class GCreateWorkBookmarkVars
    implements Built<GCreateWorkBookmarkVars, GCreateWorkBookmarkVarsBuilder> {
  GCreateWorkBookmarkVars._();

  factory GCreateWorkBookmarkVars(
          [Function(GCreateWorkBookmarkVarsBuilder b) updates]) =
      _$GCreateWorkBookmarkVars;

  _i1.GCreateWorkBookmarkInput get input;
  static Serializer<GCreateWorkBookmarkVars> get serializer =>
      _$gCreateWorkBookmarkVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateWorkBookmarkVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkBookmarkVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateWorkBookmarkVars.serializer,
        json,
      );
}
