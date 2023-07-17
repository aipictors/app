// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_folders.var.gql.g.dart';

abstract class GUserFolderVars
    implements Built<GUserFolderVars, GUserFolderVarsBuilder> {
  GUserFolderVars._();

  factory GUserFolderVars([Function(GUserFolderVarsBuilder b) updates]) =
      _$GUserFolderVars;

  String get user_id;
  int get offset;
  int get limit;
  static Serializer<GUserFolderVars> get serializer =>
      _$gUserFolderVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolderVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFolderVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolderVars.serializer,
        json,
      );
}
