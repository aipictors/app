// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/fragments/__generated__/user_fields_fragment.ast.gql.dart'
    as _i4;
import 'package:aipictors/fragments/__generated__/user_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/fragments/__generated__/user_fields_fragment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;

part 'user_fields_fragment.req.gql.g.dart';

abstract class GUserFieldsReq
    implements
        Built<GUserFieldsReq, GUserFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GUserFieldsData, _i3.GUserFieldsVars> {
  GUserFieldsReq._();

  factory GUserFieldsReq([void Function(GUserFieldsReqBuilder b) updates]) =
      _$GUserFieldsReq;

  static void _initializeBuilder(GUserFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'UserFields';

  @override
  _i3.GUserFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GUserFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GUserFieldsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GUserFieldsData data) => data.toJson();

  static Serializer<GUserFieldsReq> get serializer =>
      _$gUserFieldsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserFieldsReq.serializer,
        json,
      );
}
