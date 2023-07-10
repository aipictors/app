// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_with_password.var.gql.g.dart';

abstract class GLoginWithPasswordVars
    implements Built<GLoginWithPasswordVars, GLoginWithPasswordVarsBuilder> {
  GLoginWithPasswordVars._();

  factory GLoginWithPasswordVars(
          [Function(GLoginWithPasswordVarsBuilder b) updates]) =
      _$GLoginWithPasswordVars;

  _i1.GLoginWithPasswordInput get input;
  static Serializer<GLoginWithPasswordVars> get serializer =>
      _$gLoginWithPasswordVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GLoginWithPasswordVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLoginWithPasswordVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GLoginWithPasswordVars.serializer,
        json,
      );
}
