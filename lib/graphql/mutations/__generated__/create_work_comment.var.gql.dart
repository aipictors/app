// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_work_comment.var.gql.g.dart';

abstract class GCreateWorkCommentVars
    implements Built<GCreateWorkCommentVars, GCreateWorkCommentVarsBuilder> {
  GCreateWorkCommentVars._();

  factory GCreateWorkCommentVars(
          [Function(GCreateWorkCommentVarsBuilder b) updates]) =
      _$GCreateWorkCommentVars;

  _i1.GCreateWorkCommentInput get input;
  static Serializer<GCreateWorkCommentVars> get serializer =>
      _$gCreateWorkCommentVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateWorkCommentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWorkCommentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateWorkCommentVars.serializer,
        json,
      );
}
