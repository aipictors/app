// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_award_notification_fields_fragment.var.gql.g.dart';

abstract class GWorkAwardNotificationFieldsVars
    implements
        Built<GWorkAwardNotificationFieldsVars,
            GWorkAwardNotificationFieldsVarsBuilder> {
  GWorkAwardNotificationFieldsVars._();

  factory GWorkAwardNotificationFieldsVars(
          [void Function(GWorkAwardNotificationFieldsVarsBuilder b) updates]) =
      _$GWorkAwardNotificationFieldsVars;

  static Serializer<GWorkAwardNotificationFieldsVars> get serializer =>
      _$gWorkAwardNotificationFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkAwardNotificationFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkAwardNotificationFieldsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkAwardNotificationFieldsVars.serializer,
        json,
      );
}
