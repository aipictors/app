// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_comment.var.gql.g.dart';

abstract class GDeleteCommentVars
    implements Built<GDeleteCommentVars, GDeleteCommentVarsBuilder> {
  GDeleteCommentVars._();

  factory GDeleteCommentVars(
          [void Function(GDeleteCommentVarsBuilder b) updates]) =
      _$GDeleteCommentVars;

  _i1.GDeleteCommentInput get input;
  static Serializer<GDeleteCommentVars> get serializer =>
      _$gDeleteCommentVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteCommentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteCommentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteCommentVars.serializer,
        json,
      );
}
