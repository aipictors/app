// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'liked_work_notification_fields_fragment.var.gql.g.dart';

abstract class GLikedWorkNotificationFieldsVars
    implements
        Built<GLikedWorkNotificationFieldsVars,
            GLikedWorkNotificationFieldsVarsBuilder> {
  GLikedWorkNotificationFieldsVars._();

  factory GLikedWorkNotificationFieldsVars(
          [void Function(GLikedWorkNotificationFieldsVarsBuilder b) updates]) =
      _$GLikedWorkNotificationFieldsVars;

  static Serializer<GLikedWorkNotificationFieldsVars> get serializer =>
      _$gLikedWorkNotificationFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLikedWorkNotificationFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLikedWorkNotificationFieldsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLikedWorkNotificationFieldsVars.serializer,
        json,
      );
}
