// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_account_password.var.gql.g.dart';

abstract class GUpdateAccountPasswordVars
    implements
        Built<GUpdateAccountPasswordVars, GUpdateAccountPasswordVarsBuilder> {
  GUpdateAccountPasswordVars._();

  factory GUpdateAccountPasswordVars(
          [Function(GUpdateAccountPasswordVarsBuilder b) updates]) =
      _$GUpdateAccountPasswordVars;

  _i1.GUpdateAccountPasswordInput get input;
  static Serializer<GUpdateAccountPasswordVars> get serializer =>
      _$gUpdateAccountPasswordVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateAccountPasswordVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateAccountPasswordVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateAccountPasswordVars.serializer,
        json,
      );
}
