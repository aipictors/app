// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_comment_responses.var.gql.g.dart';

abstract class GWorkCommentResponsesVars
    implements
        Built<GWorkCommentResponsesVars, GWorkCommentResponsesVarsBuilder> {
  GWorkCommentResponsesVars._();

  factory GWorkCommentResponsesVars(
          [Function(GWorkCommentResponsesVarsBuilder b) updates]) =
      _$GWorkCommentResponsesVars;

  String get workId;
  String get commentId;
  static Serializer<GWorkCommentResponsesVars> get serializer =>
      _$gWorkCommentResponsesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesVars.serializer,
        json,
      );
}
