// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'folders.var.gql.g.dart';

abstract class GFoldersVars
    implements Built<GFoldersVars, GFoldersVarsBuilder> {
  GFoldersVars._();

  factory GFoldersVars([Function(GFoldersVarsBuilder b) updates]) =
      _$GFoldersVars;

  int get offset;
  int get limit;
  _i1.GFoldersWhereInput? get where;
  static Serializer<GFoldersVars> get serializer => _$gFoldersVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFoldersVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFoldersVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFoldersVars.serializer,
        json,
      );
}
