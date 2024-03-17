// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_followees.var.gql.g.dart';

abstract class GUserFolloweesVars
    implements Built<GUserFolloweesVars, GUserFolloweesVarsBuilder> {
  GUserFolloweesVars._();

  factory GUserFolloweesVars(
          [void Function(GUserFolloweesVarsBuilder b) updates]) =
      _$GUserFolloweesVars;

  String get user_id;
  int get offset;
  int get limit;
  static Serializer<GUserFolloweesVars> get serializer =>
      _$gUserFolloweesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolloweesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFolloweesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolloweesVars.serializer,
        json,
      );
}
