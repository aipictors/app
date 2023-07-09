// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.ast.gql.dart'
    as _i4;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;

part 'partial_folder_fields_fragment.req.gql.g.dart';

abstract class GPartialFolderFieldsReq
    implements
        Built<GPartialFolderFieldsReq, GPartialFolderFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GPartialFolderFieldsData,
            _i3.GPartialFolderFieldsVars> {
  GPartialFolderFieldsReq._();

  factory GPartialFolderFieldsReq(
          [Function(GPartialFolderFieldsReqBuilder b) updates]) =
      _$GPartialFolderFieldsReq;

  static void _initializeBuilder(GPartialFolderFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'PartialFolderFields';
  @override
  _i3.GPartialFolderFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GPartialFolderFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GPartialFolderFieldsData.fromJson(json);
  static Serializer<GPartialFolderFieldsReq> get serializer =>
      _$gPartialFolderFieldsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPartialFolderFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialFolderFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPartialFolderFieldsReq.serializer,
        json,
      );
}
