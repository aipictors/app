// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_tasks.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_tasks.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/generation/__generated__/viewer_image_generation_tasks.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'viewer_image_generation_tasks.req.gql.g.dart';

abstract class GViewerImageGenerationTasksReq
    implements
        Built<GViewerImageGenerationTasksReq,
            GViewerImageGenerationTasksReqBuilder>,
        _i1.OperationRequest<_i2.GViewerImageGenerationTasksData,
            _i3.GViewerImageGenerationTasksVars> {
  GViewerImageGenerationTasksReq._();

  factory GViewerImageGenerationTasksReq(
          [void Function(GViewerImageGenerationTasksReqBuilder b) updates]) =
      _$GViewerImageGenerationTasksReq;

  static void _initializeBuilder(GViewerImageGenerationTasksReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ViewerImageGenerationTasks',
    )
    ..executeOnListen = true;

  @override
  _i3.GViewerImageGenerationTasksVars get vars;
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
  _i2.GViewerImageGenerationTasksData? Function(
    _i2.GViewerImageGenerationTasksData?,
    _i2.GViewerImageGenerationTasksData?,
  )? get updateResult;
  @override
  _i2.GViewerImageGenerationTasksData? get optimisticResponse;
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
  _i2.GViewerImageGenerationTasksData? parseData(Map<String, dynamic> json) =>
      _i2.GViewerImageGenerationTasksData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GViewerImageGenerationTasksData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GViewerImageGenerationTasksData,
      _i3.GViewerImageGenerationTasksVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GViewerImageGenerationTasksReq> get serializer =>
      _$gViewerImageGenerationTasksReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GViewerImageGenerationTasksReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTasksReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GViewerImageGenerationTasksReq.serializer,
        json,
      );
}
