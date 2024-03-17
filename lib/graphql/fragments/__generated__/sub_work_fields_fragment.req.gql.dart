// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/fragments/__generated__/sub_work_fields_fragment.ast.gql.dart'
    as _i4;
import 'package:aipictors/graphql/fragments/__generated__/sub_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/sub_work_fields_fragment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;

part 'sub_work_fields_fragment.req.gql.g.dart';

abstract class GSubWorkFieldsReq
    implements
        Built<GSubWorkFieldsReq, GSubWorkFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GSubWorkFieldsData, _i3.GSubWorkFieldsVars> {
  GSubWorkFieldsReq._();

  factory GSubWorkFieldsReq(
          [void Function(GSubWorkFieldsReqBuilder b) updates]) =
      _$GSubWorkFieldsReq;

  static void _initializeBuilder(GSubWorkFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'SubWorkFields';

  @override
  _i3.GSubWorkFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GSubWorkFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GSubWorkFieldsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GSubWorkFieldsData data) => data.toJson();

  static Serializer<GSubWorkFieldsReq> get serializer =>
      _$gSubWorkFieldsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSubWorkFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSubWorkFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSubWorkFieldsReq.serializer,
        json,
      );
}
