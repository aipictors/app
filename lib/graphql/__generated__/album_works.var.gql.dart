// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'album_works.var.gql.g.dart';

abstract class GAlbumWorksVars
    implements Built<GAlbumWorksVars, GAlbumWorksVarsBuilder> {
  GAlbumWorksVars._();

  factory GAlbumWorksVars([Function(GAlbumWorksVarsBuilder b) updates]) =
      _$GAlbumWorksVars;

  String get albumId;
  int get offset;
  int get limit;
  static Serializer<GAlbumWorksVars> get serializer =>
      _$gAlbumWorksVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumWorksVars.serializer,
        json,
      );
}
