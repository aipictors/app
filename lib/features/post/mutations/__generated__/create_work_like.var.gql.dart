// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_work_like.var.gql.g.dart';

abstract class GCreateWorkLikeVars
    implements Built<GCreateWorkLikeVars, GCreateWorkLikeVarsBuilder> {
  GCreateWorkLikeVars._();

  factory GCreateWorkLikeVars(
          [void Function(GCreateWorkLikeVarsBuilder b) updates]) =
      _$GCreateWorkLikeVars;

  _i1.GCreateWorkLikeInput get input;
  static Serializer<GCreateWorkLikeVars> get serializer =>
      _$gCreateWorkLikeVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateWorkLikeVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWorkLikeVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateWorkLikeVars.serializer,
        json,
      );
}
