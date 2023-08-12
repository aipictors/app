// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_album_work.var.gql.g.dart';

abstract class GCreateAlbumWorkVars
    implements Built<GCreateAlbumWorkVars, GCreateAlbumWorkVarsBuilder> {
  GCreateAlbumWorkVars._();

  factory GCreateAlbumWorkVars(
          [Function(GCreateAlbumWorkVarsBuilder b) updates]) =
      _$GCreateAlbumWorkVars;

  _i1.GCreateAlbumWorkInput get input;
  static Serializer<GCreateAlbumWorkVars> get serializer =>
      _$gCreateAlbumWorkVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateAlbumWorkVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateAlbumWorkVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateAlbumWorkVars.serializer,
        json,
      );
}
