// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'folder_works.var.gql.g.dart';

abstract class GFolderWorksVars
    implements Built<GFolderWorksVars, GFolderWorksVarsBuilder> {
  GFolderWorksVars._();

  factory GFolderWorksVars([Function(GFolderWorksVarsBuilder b) updates]) =
      _$GFolderWorksVars;

  String get folderId;
  int get offset;
  int get limit;
  static Serializer<GFolderWorksVars> get serializer =>
      _$gFolderWorksVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFolderWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderWorksVars.serializer,
        json,
      );
}
