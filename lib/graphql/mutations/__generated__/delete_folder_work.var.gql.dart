// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_folder_work.var.gql.g.dart';

abstract class GDeleteFolderWorkVars
    implements Built<GDeleteFolderWorkVars, GDeleteFolderWorkVarsBuilder> {
  GDeleteFolderWorkVars._();

  factory GDeleteFolderWorkVars(
          [Function(GDeleteFolderWorkVarsBuilder b) updates]) =
      _$GDeleteFolderWorkVars;

  _i1.GDeleteFolderWorkInput get input;
  static Serializer<GDeleteFolderWorkVars> get serializer =>
      _$gDeleteFolderWorkVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteFolderWorkVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteFolderWorkVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteFolderWorkVars.serializer,
        json,
      );
}
