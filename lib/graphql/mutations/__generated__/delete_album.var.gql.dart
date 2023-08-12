// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_album.var.gql.g.dart';

abstract class GDeleteAlbumVars
    implements Built<GDeleteAlbumVars, GDeleteAlbumVarsBuilder> {
  GDeleteAlbumVars._();

  factory GDeleteAlbumVars([Function(GDeleteAlbumVarsBuilder b) updates]) =
      _$GDeleteAlbumVars;

  _i1.GDeleteAlbumInput get input;
  static Serializer<GDeleteAlbumVars> get serializer =>
      _$gDeleteAlbumVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteAlbumVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteAlbumVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteAlbumVars.serializer,
        json,
      );
}
