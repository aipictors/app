// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'folder.var.gql.g.dart';

abstract class GFolderVars implements Built<GFolderVars, GFolderVarsBuilder> {
  GFolderVars._();

  factory GFolderVars([Function(GFolderVarsBuilder b) updates]) = _$GFolderVars;

  String get id;
  static Serializer<GFolderVars> get serializer => _$gFolderVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFolderVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderVars.serializer,
        json,
      );
}
