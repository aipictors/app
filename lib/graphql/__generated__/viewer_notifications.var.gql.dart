// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_notifications.var.gql.g.dart';

abstract class GViewerNotificationsVars
    implements
        Built<GViewerNotificationsVars, GViewerNotificationsVarsBuilder> {
  GViewerNotificationsVars._();

  factory GViewerNotificationsVars(
          [void Function(GViewerNotificationsVarsBuilder b) updates]) =
      _$GViewerNotificationsVars;

  int get offset;
  int get limit;
  static Serializer<GViewerNotificationsVars> get serializer =>
      _$gViewerNotificationsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerNotificationsVars.serializer,
        json,
      );
}
