// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_response_comment.var.gql.g.dart';

abstract class GCreateResponseCommentVars
    implements
        Built<GCreateResponseCommentVars, GCreateResponseCommentVarsBuilder> {
  GCreateResponseCommentVars._();

  factory GCreateResponseCommentVars(
          [Function(GCreateResponseCommentVarsBuilder b) updates]) =
      _$GCreateResponseCommentVars;

  _i1.GCreateResponseCommentInput get input;
  static Serializer<GCreateResponseCommentVars> get serializer =>
      _$gCreateResponseCommentVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateResponseCommentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateResponseCommentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateResponseCommentVars.serializer,
        json,
      );
}
