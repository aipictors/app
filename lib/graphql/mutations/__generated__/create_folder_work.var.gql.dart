// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_folder_work.var.gql.g.dart';

abstract class GCreateFolderWorkVars
    implements Built<GCreateFolderWorkVars, GCreateFolderWorkVarsBuilder> {
  GCreateFolderWorkVars._();

  factory GCreateFolderWorkVars(
          [Function(GCreateFolderWorkVarsBuilder b) updates]) =
      _$GCreateFolderWorkVars;

  _i1.GCreateFolderWorkInput get input;
  static Serializer<GCreateFolderWorkVars> get serializer =>
      _$gCreateFolderWorkVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateFolderWorkVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateFolderWorkVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateFolderWorkVars.serializer,
        json,
      );
}
