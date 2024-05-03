// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_task_fields_fragment.ast.gql.dart'
    as _i4;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_task_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_task_fields_fragment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;

part 'image_generation_task_fields_fragment.req.gql.g.dart';

abstract class GImageGenerationTaskFieldsReq
    implements
        Built<GImageGenerationTaskFieldsReq,
            GImageGenerationTaskFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GImageGenerationTaskFieldsData,
            _i3.GImageGenerationTaskFieldsVars> {
  GImageGenerationTaskFieldsReq._();

  factory GImageGenerationTaskFieldsReq(
          [void Function(GImageGenerationTaskFieldsReqBuilder b) updates]) =
      _$GImageGenerationTaskFieldsReq;

  static void _initializeBuilder(GImageGenerationTaskFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'ImageGenerationTaskFields';

  @override
  _i3.GImageGenerationTaskFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GImageGenerationTaskFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GImageGenerationTaskFieldsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GImageGenerationTaskFieldsData data) =>
      data.toJson();

  static Serializer<GImageGenerationTaskFieldsReq> get serializer =>
      _$gImageGenerationTaskFieldsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GImageGenerationTaskFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationTaskFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GImageGenerationTaskFieldsReq.serializer,
        json,
      );
}
