// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/fragments/__generated__/partial_work_fields_fragment.ast.gql.dart'
    as _i4;
import 'package:aipictors/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/fragments/__generated__/partial_work_fields_fragment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;

part 'partial_work_fields_fragment.req.gql.g.dart';

abstract class GPartialWorkFieldsReq
    implements
        Built<GPartialWorkFieldsReq, GPartialWorkFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GPartialWorkFieldsData,
            _i3.GPartialWorkFieldsVars> {
  GPartialWorkFieldsReq._();

  factory GPartialWorkFieldsReq(
          [void Function(GPartialWorkFieldsReqBuilder b) updates]) =
      _$GPartialWorkFieldsReq;

  static void _initializeBuilder(GPartialWorkFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'PartialWorkFields';

  @override
  _i3.GPartialWorkFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GPartialWorkFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GPartialWorkFieldsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GPartialWorkFieldsData data) =>
      data.toJson();

  static Serializer<GPartialWorkFieldsReq> get serializer =>
      _$gPartialWorkFieldsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPartialWorkFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialWorkFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPartialWorkFieldsReq.serializer,
        json,
      );
}
