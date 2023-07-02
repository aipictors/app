// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_liked_works.var.gql.g.dart';

abstract class GUserLikedWorksVars
    implements Built<GUserLikedWorksVars, GUserLikedWorksVarsBuilder> {
  GUserLikedWorksVars._();

  factory GUserLikedWorksVars(
      [Function(GUserLikedWorksVarsBuilder b) updates]) = _$GUserLikedWorksVars;

  String get user_id;
  int get offset;
  int get limit;
  static Serializer<GUserLikedWorksVars> get serializer =>
      _$gUserLikedWorksVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLikedWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLikedWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLikedWorksVars.serializer,
        json,
      );
}
