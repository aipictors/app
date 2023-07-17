// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_folder.var.gql.g.dart';

abstract class GDeleteFolderVars
    implements Built<GDeleteFolderVars, GDeleteFolderVarsBuilder> {
  GDeleteFolderVars._();

  factory GDeleteFolderVars([Function(GDeleteFolderVarsBuilder b) updates]) =
      _$GDeleteFolderVars;

  _i1.GDeleteFolderInput get input;
  static Serializer<GDeleteFolderVars> get serializer =>
      _$gDeleteFolderVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteFolderVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteFolderVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteFolderVars.serializer,
        json,
      );
}
