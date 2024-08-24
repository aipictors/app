// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_user_sticker.var.gql.g.dart';

abstract class GCreateUserStickerVars
    implements Built<GCreateUserStickerVars, GCreateUserStickerVarsBuilder> {
  GCreateUserStickerVars._();

  factory GCreateUserStickerVars(
          [void Function(GCreateUserStickerVarsBuilder b) updates]) =
      _$GCreateUserStickerVars;

  _i1.GCreateUserStickerInput get input;
  static Serializer<GCreateUserStickerVars> get serializer =>
      _$gCreateUserStickerVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateUserStickerVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserStickerVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateUserStickerVars.serializer,
        json,
      );
}
