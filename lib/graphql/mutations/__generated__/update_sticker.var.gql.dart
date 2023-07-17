// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_sticker.var.gql.g.dart';

abstract class GUpdateStickerVars
    implements Built<GUpdateStickerVars, GUpdateStickerVarsBuilder> {
  GUpdateStickerVars._();

  factory GUpdateStickerVars([Function(GUpdateStickerVarsBuilder b) updates]) =
      _$GUpdateStickerVars;

  _i1.GUpdateStickerInput get input;
  static Serializer<GUpdateStickerVars> get serializer =>
      _$gUpdateStickerVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateStickerVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateStickerVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateStickerVars.serializer,
        json,
      );
}
