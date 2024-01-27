// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_sticker.var.gql.g.dart';

abstract class GDeleteStickerVars
    implements Built<GDeleteStickerVars, GDeleteStickerVarsBuilder> {
  GDeleteStickerVars._();

  factory GDeleteStickerVars([Function(GDeleteStickerVarsBuilder b) updates]) =
      _$GDeleteStickerVars;

  _i1.GDeleteStickerInput get input;
  static Serializer<GDeleteStickerVars> get serializer =>
      _$gDeleteStickerVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteStickerVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteStickerVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteStickerVars.serializer,
        json,
      );
}
