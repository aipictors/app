// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_fields_fragment.var.gql.g.dart';

abstract class GCommentFieldsVars
    implements Built<GCommentFieldsVars, GCommentFieldsVarsBuilder> {
  GCommentFieldsVars._();

  factory GCommentFieldsVars(
          [void Function(GCommentFieldsVarsBuilder b) updates]) =
      _$GCommentFieldsVars;

  static Serializer<GCommentFieldsVars> get serializer =>
      _$gCommentFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCommentFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCommentFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCommentFieldsVars.serializer,
        json,
      );
}
