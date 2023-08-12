// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'albums.var.gql.g.dart';

abstract class GAlbumsVars implements Built<GAlbumsVars, GAlbumsVarsBuilder> {
  GAlbumsVars._();

  factory GAlbumsVars([Function(GAlbumsVarsBuilder b) updates]) = _$GAlbumsVars;

  int get offset;
  int get limit;
  _i1.GAlbumsWhereInput? get where;
  static Serializer<GAlbumsVars> get serializer => _$gAlbumsVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GAlbumsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GAlbumsVars.serializer,
        json,
      );
}
