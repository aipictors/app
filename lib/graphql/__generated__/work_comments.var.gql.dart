// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_comments.var.gql.g.dart';

abstract class GWorkCommentsVars
    implements Built<GWorkCommentsVars, GWorkCommentsVarsBuilder> {
  GWorkCommentsVars._();

  factory GWorkCommentsVars([Function(GWorkCommentsVarsBuilder b) updates]) =
      _$GWorkCommentsVars;

  String get workId;
  static Serializer<GWorkCommentsVars> get serializer =>
      _$gWorkCommentsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsVars.serializer,
        json,
      );
}
