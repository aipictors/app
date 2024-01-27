// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_sticker_fields_fragment.var.gql.g.dart';

abstract class GPartialStickerFieldsVars
    implements
        Built<GPartialStickerFieldsVars, GPartialStickerFieldsVarsBuilder> {
  GPartialStickerFieldsVars._();

  factory GPartialStickerFieldsVars(
          [Function(GPartialStickerFieldsVarsBuilder b) updates]) =
      _$GPartialStickerFieldsVars;

  static Serializer<GPartialStickerFieldsVars> get serializer =>
      _$gPartialStickerFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialStickerFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialStickerFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialStickerFieldsVars.serializer,
        json,
      );
}
