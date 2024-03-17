// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_comment.data.gql.g.dart';

abstract class GDeleteCommentData
    implements Built<GDeleteCommentData, GDeleteCommentDataBuilder> {
  GDeleteCommentData._();

  factory GDeleteCommentData(
          [void Function(GDeleteCommentDataBuilder b) updates]) =
      _$GDeleteCommentData;

  static void _initializeBuilder(GDeleteCommentDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeleteCommentData_deleteComment get deleteComment;
  static Serializer<GDeleteCommentData> get serializer =>
      _$gDeleteCommentDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteCommentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteCommentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteCommentData.serializer,
        json,
      );
}

abstract class GDeleteCommentData_deleteComment
    implements
        Built<GDeleteCommentData_deleteComment,
            GDeleteCommentData_deleteCommentBuilder> {
  GDeleteCommentData_deleteComment._();

  factory GDeleteCommentData_deleteComment(
          [void Function(GDeleteCommentData_deleteCommentBuilder b) updates]) =
      _$GDeleteCommentData_deleteComment;

  static void _initializeBuilder(GDeleteCommentData_deleteCommentBuilder b) =>
      b..G__typename = 'CommentNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GDeleteCommentData_deleteComment> get serializer =>
      _$gDeleteCommentDataDeleteCommentSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteCommentData_deleteComment.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteCommentData_deleteComment? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteCommentData_deleteComment.serializer,
        json,
      );
}
