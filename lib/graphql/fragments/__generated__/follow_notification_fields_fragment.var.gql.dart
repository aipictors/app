// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'follow_notification_fields_fragment.var.gql.g.dart';

abstract class GFollowNotificationFieldsVars
    implements
        Built<GFollowNotificationFieldsVars,
            GFollowNotificationFieldsVarsBuilder> {
  GFollowNotificationFieldsVars._();

  factory GFollowNotificationFieldsVars(
          [Function(GFollowNotificationFieldsVarsBuilder b) updates]) =
      _$GFollowNotificationFieldsVars;

  static Serializer<GFollowNotificationFieldsVars> get serializer =>
      _$gFollowNotificationFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowNotificationFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFollowNotificationFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowNotificationFieldsVars.serializer,
        json,
      );
}
