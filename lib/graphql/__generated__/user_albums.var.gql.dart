// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_albums.var.gql.g.dart';

abstract class GUserAlbumsVars
    implements Built<GUserAlbumsVars, GUserAlbumsVarsBuilder> {
  GUserAlbumsVars._();

  factory GUserAlbumsVars([Function(GUserAlbumsVarsBuilder b) updates]) =
      _$GUserAlbumsVars;

  String get user_id;
  int get offset;
  int get limit;
  static Serializer<GUserAlbumsVars> get serializer =>
      _$gUserAlbumsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAlbumsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserAlbumsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAlbumsVars.serializer,
        json,
      );
}
