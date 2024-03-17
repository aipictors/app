// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_sticker.var.gql.g.dart';

abstract class GCreateStickerVars
    implements Built<GCreateStickerVars, GCreateStickerVarsBuilder> {
  GCreateStickerVars._();

  factory GCreateStickerVars(
          [void Function(GCreateStickerVarsBuilder b) updates]) =
      _$GCreateStickerVars;

  _i1.GCreateStickerInput get input;
  static Serializer<GCreateStickerVars> get serializer =>
      _$gCreateStickerVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateStickerVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateStickerVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateStickerVars.serializer,
        json,
      );
}
