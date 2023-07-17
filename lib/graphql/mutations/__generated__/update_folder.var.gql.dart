// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_folder.var.gql.g.dart';

abstract class GUpdateFolderVars
    implements Built<GUpdateFolderVars, GUpdateFolderVarsBuilder> {
  GUpdateFolderVars._();

  factory GUpdateFolderVars([Function(GUpdateFolderVarsBuilder b) updates]) =
      _$GUpdateFolderVars;

  _i1.GUpdateFolderInput get input;
  static Serializer<GUpdateFolderVars> get serializer =>
      _$gUpdateFolderVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateFolderVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateFolderVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateFolderVars.serializer,
        json,
      );
}
