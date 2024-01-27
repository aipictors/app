// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_albums.var.gql.g.dart';

abstract class GViewerAlbumsVars
    implements Built<GViewerAlbumsVars, GViewerAlbumsVarsBuilder> {
  GViewerAlbumsVars._();

  factory GViewerAlbumsVars([Function(GViewerAlbumsVarsBuilder b) updates]) =
      _$GViewerAlbumsVars;

  int get offset;
  int get limit;
  static Serializer<GViewerAlbumsVars> get serializer =>
      _$gViewerAlbumsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerAlbumsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerAlbumsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerAlbumsVars.serializer,
        json,
      );
}
