// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_comment.data.gql.g.dart';

abstract class GReportCommentData
    implements Built<GReportCommentData, GReportCommentDataBuilder> {
  GReportCommentData._();

  factory GReportCommentData(
          [void Function(GReportCommentDataBuilder b) updates]) =
      _$GReportCommentData;

  static void _initializeBuilder(GReportCommentDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get reportComment;
  static Serializer<GReportCommentData> get serializer =>
      _$gReportCommentDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportCommentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportCommentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportCommentData.serializer,
        json,
      );
}
