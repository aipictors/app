// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_album_fields_fragment.var.gql.g.dart';

abstract class GPartialAlbumFieldsVars
    implements Built<GPartialAlbumFieldsVars, GPartialAlbumFieldsVarsBuilder> {
  GPartialAlbumFieldsVars._();

  factory GPartialAlbumFieldsVars(
          [void Function(GPartialAlbumFieldsVarsBuilder b) updates]) =
      _$GPartialAlbumFieldsVars;

  static Serializer<GPartialAlbumFieldsVars> get serializer =>
      _$gPartialAlbumFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialAlbumFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialAlbumFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialAlbumFieldsVars.serializer,
        json,
      );
}
