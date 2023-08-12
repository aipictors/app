// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/fragments/__generated__/partial_album_fields_fragment.ast.gql.dart'
    as _i4;
import 'package:aipictors/graphql/fragments/__generated__/partial_album_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/partial_album_fields_fragment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;

part 'partial_album_fields_fragment.req.gql.g.dart';

abstract class GPartialAlbumFieldsReq
    implements
        Built<GPartialAlbumFieldsReq, GPartialAlbumFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GPartialAlbumFieldsData,
            _i3.GPartialAlbumFieldsVars> {
  GPartialAlbumFieldsReq._();

  factory GPartialAlbumFieldsReq(
          [Function(GPartialAlbumFieldsReqBuilder b) updates]) =
      _$GPartialAlbumFieldsReq;

  static void _initializeBuilder(GPartialAlbumFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'PartialAlbumFields';
  @override
  _i3.GPartialAlbumFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GPartialAlbumFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GPartialAlbumFieldsData.fromJson(json);
  static Serializer<GPartialAlbumFieldsReq> get serializer =>
      _$gPartialAlbumFieldsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPartialAlbumFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialAlbumFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPartialAlbumFieldsReq.serializer,
        json,
      );
}
