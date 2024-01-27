// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_folder_fields_fragment.var.gql.g.dart';

abstract class GPartialFolderFieldsVars
    implements
        Built<GPartialFolderFieldsVars, GPartialFolderFieldsVarsBuilder> {
  GPartialFolderFieldsVars._();

  factory GPartialFolderFieldsVars(
          [Function(GPartialFolderFieldsVarsBuilder b) updates]) =
      _$GPartialFolderFieldsVars;

  static Serializer<GPartialFolderFieldsVars> get serializer =>
      _$gPartialFolderFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialFolderFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialFolderFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialFolderFieldsVars.serializer,
        json,
      );
}
