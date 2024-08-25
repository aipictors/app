// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_user_sticker.var.gql.g.dart';

abstract class GDeleteUserStickerVars
    implements Built<GDeleteUserStickerVars, GDeleteUserStickerVarsBuilder> {
  GDeleteUserStickerVars._();

  factory GDeleteUserStickerVars(
          [void Function(GDeleteUserStickerVarsBuilder b) updates]) =
      _$GDeleteUserStickerVars;

  _i1.GDeleteUserStickerInput get input;
  static Serializer<GDeleteUserStickerVars> get serializer =>
      _$gDeleteUserStickerVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteUserStickerVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteUserStickerVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteUserStickerVars.serializer,
        json,
      );
}
