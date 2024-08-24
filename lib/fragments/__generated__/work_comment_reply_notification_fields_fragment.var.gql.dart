// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_comment_reply_notification_fields_fragment.var.gql.g.dart';

abstract class GWorkCommentReplyNotificationFieldsVars
    implements
        Built<GWorkCommentReplyNotificationFieldsVars,
            GWorkCommentReplyNotificationFieldsVarsBuilder> {
  GWorkCommentReplyNotificationFieldsVars._();

  factory GWorkCommentReplyNotificationFieldsVars(
      [void Function(GWorkCommentReplyNotificationFieldsVarsBuilder b)
          updates]) = _$GWorkCommentReplyNotificationFieldsVars;

  static Serializer<GWorkCommentReplyNotificationFieldsVars> get serializer =>
      _$gWorkCommentReplyNotificationFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentReplyNotificationFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentReplyNotificationFieldsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentReplyNotificationFieldsVars.serializer,
        json,
      );
}
