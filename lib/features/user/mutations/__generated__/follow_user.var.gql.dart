// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'follow_user.var.gql.g.dart';

abstract class GFollowUserVars
    implements Built<GFollowUserVars, GFollowUserVarsBuilder> {
  GFollowUserVars._();

  factory GFollowUserVars([void Function(GFollowUserVarsBuilder b) updates]) =
      _$GFollowUserVars;

  _i1.GFollowUserInput get input;
  static Serializer<GFollowUserVars> get serializer =>
      _$gFollowUserVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFollowUserVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowUserVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFollowUserVars.serializer,
        json,
      );
}
