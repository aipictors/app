// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_folder.var.gql.g.dart';

abstract class GCreateFolderVars
    implements Built<GCreateFolderVars, GCreateFolderVarsBuilder> {
  GCreateFolderVars._();

  factory GCreateFolderVars([Function(GCreateFolderVarsBuilder b) updates]) =
      _$GCreateFolderVars;

  _i1.GCreateFolderInput get input;
  static Serializer<GCreateFolderVars> get serializer =>
      _$gCreateFolderVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateFolderVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateFolderVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateFolderVars.serializer,
        json,
      );
}
