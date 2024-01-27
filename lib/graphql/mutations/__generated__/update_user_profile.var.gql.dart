// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_user_profile.var.gql.g.dart';

abstract class GUpdateUserProfileVars
    implements Built<GUpdateUserProfileVars, GUpdateUserProfileVarsBuilder> {
  GUpdateUserProfileVars._();

  factory GUpdateUserProfileVars(
          [Function(GUpdateUserProfileVarsBuilder b) updates]) =
      _$GUpdateUserProfileVars;

  _i1.GUpdateUserProfileInput get input;
  static Serializer<GUpdateUserProfileVars> get serializer =>
      _$gUpdateUserProfileVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateUserProfileVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateUserProfileVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateUserProfileVars.serializer,
        json,
      );
}
