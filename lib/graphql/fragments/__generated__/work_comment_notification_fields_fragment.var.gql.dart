// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_comment_notification_fields_fragment.var.gql.g.dart';

abstract class GWorkCommentNotificationFieldsVars
    implements
        Built<GWorkCommentNotificationFieldsVars,
            GWorkCommentNotificationFieldsVarsBuilder> {
  GWorkCommentNotificationFieldsVars._();

  factory GWorkCommentNotificationFieldsVars(
          [Function(GWorkCommentNotificationFieldsVarsBuilder b) updates]) =
      _$GWorkCommentNotificationFieldsVars;

  static Serializer<GWorkCommentNotificationFieldsVars> get serializer =>
      _$gWorkCommentNotificationFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentNotificationFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentNotificationFieldsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentNotificationFieldsVars.serializer,
        json,
      );
}
