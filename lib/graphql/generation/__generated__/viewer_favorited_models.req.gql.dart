// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/generation/__generated__/viewer_favorited_models.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/generation/__generated__/viewer_favorited_models.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/generation/__generated__/viewer_favorited_models.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'viewer_favorited_models.req.gql.g.dart';

abstract class GViewerFavoritedImageGenerationModelsReq
    implements
        Built<GViewerFavoritedImageGenerationModelsReq,
            GViewerFavoritedImageGenerationModelsReqBuilder>,
        _i1.OperationRequest<_i2.GViewerFavoritedImageGenerationModelsData,
            _i3.GViewerFavoritedImageGenerationModelsVars> {
  GViewerFavoritedImageGenerationModelsReq._();

  factory GViewerFavoritedImageGenerationModelsReq(
      [void Function(GViewerFavoritedImageGenerationModelsReqBuilder b)
          updates]) = _$GViewerFavoritedImageGenerationModelsReq;

  static void _initializeBuilder(
          GViewerFavoritedImageGenerationModelsReqBuilder b) =>
      b
        ..operation = _i4.Operation(
          document: _i5.document,
          operationName: 'ViewerFavoritedImageGenerationModels',
        )
        ..executeOnListen = true;

  @override
  _i3.GViewerFavoritedImageGenerationModelsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
        context: context ?? const _i4.Context(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GViewerFavoritedImageGenerationModelsData? Function(
    _i2.GViewerFavoritedImageGenerationModelsData?,
    _i2.GViewerFavoritedImageGenerationModelsData?,
  )? get updateResult;
  @override
  _i2.GViewerFavoritedImageGenerationModelsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GViewerFavoritedImageGenerationModelsData? parseData(
          Map<String, dynamic> json) =>
      _i2.GViewerFavoritedImageGenerationModelsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(
          _i2.GViewerFavoritedImageGenerationModelsData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GViewerFavoritedImageGenerationModelsData,
      _i3.GViewerFavoritedImageGenerationModelsVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GViewerFavoritedImageGenerationModelsReq> get serializer =>
      _$gViewerFavoritedImageGenerationModelsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GViewerFavoritedImageGenerationModelsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFavoritedImageGenerationModelsReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GViewerFavoritedImageGenerationModelsReq.serializer,
        json,
      );
}
