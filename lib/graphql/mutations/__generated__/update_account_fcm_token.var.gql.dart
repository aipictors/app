// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_account_fcm_token.var.gql.g.dart';

abstract class GUpdateAccountFcmTokenVars
    implements
        Built<GUpdateAccountFcmTokenVars, GUpdateAccountFcmTokenVarsBuilder> {
  GUpdateAccountFcmTokenVars._();

  factory GUpdateAccountFcmTokenVars(
          [Function(GUpdateAccountFcmTokenVarsBuilder b) updates]) =
      _$GUpdateAccountFcmTokenVars;

  _i1.GUpdateAccountFcmTokenInput get input;
  static Serializer<GUpdateAccountFcmTokenVars> get serializer =>
      _$gUpdateAccountFcmTokenVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateAccountFcmTokenVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountFcmTokenVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateAccountFcmTokenVars.serializer,
        json,
      );
}
