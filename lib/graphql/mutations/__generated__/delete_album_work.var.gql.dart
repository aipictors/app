// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_album_work.var.gql.g.dart';

abstract class GDeleteAlbumWorkVars
    implements Built<GDeleteAlbumWorkVars, GDeleteAlbumWorkVarsBuilder> {
  GDeleteAlbumWorkVars._();

  factory GDeleteAlbumWorkVars(
          [void Function(GDeleteAlbumWorkVarsBuilder b) updates]) =
      _$GDeleteAlbumWorkVars;

  _i1.GDeleteAlbumWorkInput get input;
  static Serializer<GDeleteAlbumWorkVars> get serializer =>
      _$gDeleteAlbumWorkVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteAlbumWorkVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteAlbumWorkVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteAlbumWorkVars.serializer,
        json,
      );
}
