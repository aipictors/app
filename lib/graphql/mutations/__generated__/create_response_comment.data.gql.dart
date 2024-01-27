// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_response_comment.data.gql.g.dart';

abstract class GCreateResponseCommentData
    implements
        Built<GCreateResponseCommentData, GCreateResponseCommentDataBuilder> {
  GCreateResponseCommentData._();

  factory GCreateResponseCommentData(
          [Function(GCreateResponseCommentDataBuilder b) updates]) =
      _$GCreateResponseCommentData;

  static void _initializeBuilder(GCreateResponseCommentDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateResponseCommentData_createResponseComment get createResponseComment;
  static Serializer<GCreateResponseCommentData> get serializer =>
      _$gCreateResponseCommentDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateResponseCommentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateResponseCommentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateResponseCommentData.serializer,
        json,
      );
}

abstract class GCreateResponseCommentData_createResponseComment
    implements
        Built<GCreateResponseCommentData_createResponseComment,
            GCreateResponseCommentData_createResponseCommentBuilder> {
  GCreateResponseCommentData_createResponseComment._();

  factory GCreateResponseCommentData_createResponseComment(
      [Function(GCreateResponseCommentData_createResponseCommentBuilder b)
          updates]) = _$GCreateResponseCommentData_createResponseComment;

  static void _initializeBuilder(
          GCreateResponseCommentData_createResponseCommentBuilder b) =>
      b..G__typename = 'CommentNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GCreateResponseCommentData_createResponseComment>
      get serializer =>
          _$gCreateResponseCommentDataCreateResponseCommentSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateResponseCommentData_createResponseComment.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateResponseCommentData_createResponseComment? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateResponseCommentData_createResponseComment.serializer,
        json,
      );
}
