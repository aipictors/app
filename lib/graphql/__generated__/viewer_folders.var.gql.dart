// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_folders.var.gql.g.dart';

abstract class GViewerFoldersVars
    implements Built<GViewerFoldersVars, GViewerFoldersVarsBuilder> {
  GViewerFoldersVars._();

  factory GViewerFoldersVars(
          [void Function(GViewerFoldersVarsBuilder b) updates]) =
      _$GViewerFoldersVars;

  int get offset;
  int get limit;
  static Serializer<GViewerFoldersVars> get serializer =>
      _$gViewerFoldersVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFoldersVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFoldersVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFoldersVars.serializer,
        json,
      );
}
