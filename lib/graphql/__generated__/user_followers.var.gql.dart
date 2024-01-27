// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_followers.var.gql.g.dart';

abstract class GUserFollowersVars
    implements Built<GUserFollowersVars, GUserFollowersVarsBuilder> {
  GUserFollowersVars._();

  factory GUserFollowersVars([Function(GUserFollowersVarsBuilder b) updates]) =
      _$GUserFollowersVars;

  String get user_id;
  int get offset;
  int get limit;
  static Serializer<GUserFollowersVars> get serializer =>
      _$gUserFollowersVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFollowersVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFollowersVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFollowersVars.serializer,
        json,
      );
}
