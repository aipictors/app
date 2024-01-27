// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'liked_works_summary_notification_fields_fragment.data.gql.g.dart';

abstract class GLikedWorksSummaryNotificationFields {
  String get G__typename;
  String get id;
  int get createdAt;
  String? get message;
  Map<String, dynamic> toJson();
}

abstract class GLikedWorksSummaryNotificationFieldsData
    implements
        Built<GLikedWorksSummaryNotificationFieldsData,
            GLikedWorksSummaryNotificationFieldsDataBuilder>,
        GLikedWorksSummaryNotificationFields {
  GLikedWorksSummaryNotificationFieldsData._();

  factory GLikedWorksSummaryNotificationFieldsData(
      [Function(GLikedWorksSummaryNotificationFieldsDataBuilder b)
          updates]) = _$GLikedWorksSummaryNotificationFieldsData;

  static void _initializeBuilder(
          GLikedWorksSummaryNotificationFieldsDataBuilder b) =>
      b..G__typename = 'LikedWorksSummaryNotificationNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  String? get message;
  static Serializer<GLikedWorksSummaryNotificationFieldsData> get serializer =>
      _$gLikedWorksSummaryNotificationFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLikedWorksSummaryNotificationFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLikedWorksSummaryNotificationFieldsData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLikedWorksSummaryNotificationFieldsData.serializer,
        json,
      );
}
