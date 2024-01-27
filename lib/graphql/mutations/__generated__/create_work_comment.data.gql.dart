// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_work_comment.data.gql.g.dart';

abstract class GCreateWorkCommentData
    implements Built<GCreateWorkCommentData, GCreateWorkCommentDataBuilder> {
  GCreateWorkCommentData._();

  factory GCreateWorkCommentData(
          [Function(GCreateWorkCommentDataBuilder b) updates]) =
      _$GCreateWorkCommentData;

  static void _initializeBuilder(GCreateWorkCommentDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateWorkCommentData_createWorkComment get createWorkComment;
  static Serializer<GCreateWorkCommentData> get serializer =>
      _$gCreateWorkCommentDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkCommentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWorkCommentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWorkCommentData.serializer,
        json,
      );
}

abstract class GCreateWorkCommentData_createWorkComment
    implements
        Built<GCreateWorkCommentData_createWorkComment,
            GCreateWorkCommentData_createWorkCommentBuilder> {
  GCreateWorkCommentData_createWorkComment._();

  factory GCreateWorkCommentData_createWorkComment(
      [Function(GCreateWorkCommentData_createWorkCommentBuilder b)
          updates]) = _$GCreateWorkCommentData_createWorkComment;

  static void _initializeBuilder(
          GCreateWorkCommentData_createWorkCommentBuilder b) =>
      b..G__typename = 'CommentNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GCreateWorkCommentData_createWorkComment> get serializer =>
      _$gCreateWorkCommentDataCreateWorkCommentSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkCommentData_createWorkComment.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWorkCommentData_createWorkComment? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWorkCommentData_createWorkComment.serializer,
        json,
      );
}
