// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_album.var.gql.g.dart';

abstract class GCreateAlbumVars
    implements Built<GCreateAlbumVars, GCreateAlbumVarsBuilder> {
  GCreateAlbumVars._();

  factory GCreateAlbumVars([Function(GCreateAlbumVarsBuilder b) updates]) =
      _$GCreateAlbumVars;

  _i1.GCreateFolderInput get input;
  static Serializer<GCreateAlbumVars> get serializer =>
      _$gCreateAlbumVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateAlbumVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateAlbumVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateAlbumVars.serializer,
        json,
      );
}
