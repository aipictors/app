// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'album.var.gql.g.dart';

abstract class GAlbumVars implements Built<GAlbumVars, GAlbumVarsBuilder> {
  GAlbumVars._();

  factory GAlbumVars([void Function(GAlbumVarsBuilder b) updates]) =
      _$GAlbumVars;

  String get id;
  static Serializer<GAlbumVars> get serializer => _$gAlbumVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAlbumVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumVars.serializer,
        json,
      );
}
