// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'liked_works_summary_notification_fields_fragment.var.gql.g.dart';

abstract class GLikedWorksSummaryNotificationFieldsVars
    implements
        Built<GLikedWorksSummaryNotificationFieldsVars,
            GLikedWorksSummaryNotificationFieldsVarsBuilder> {
  GLikedWorksSummaryNotificationFieldsVars._();

  factory GLikedWorksSummaryNotificationFieldsVars(
      [void Function(GLikedWorksSummaryNotificationFieldsVarsBuilder b)
          updates]) = _$GLikedWorksSummaryNotificationFieldsVars;

  static Serializer<GLikedWorksSummaryNotificationFieldsVars> get serializer =>
      _$gLikedWorksSummaryNotificationFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLikedWorksSummaryNotificationFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLikedWorksSummaryNotificationFieldsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLikedWorksSummaryNotificationFieldsVars.serializer,
        json,
      );
}
