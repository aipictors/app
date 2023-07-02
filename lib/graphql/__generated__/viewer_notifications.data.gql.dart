// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_notifications.data.gql.g.dart';

abstract class GViewerNotificationsData
    implements
        Built<GViewerNotificationsData, GViewerNotificationsDataBuilder> {
  GViewerNotificationsData._();

  factory GViewerNotificationsData(
          [Function(GViewerNotificationsDataBuilder b) updates]) =
      _$GViewerNotificationsData;

  static void _initializeBuilder(GViewerNotificationsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerNotificationsData_viewer? get viewer;
  static Serializer<GViewerNotificationsData> get serializer =>
      _$gViewerNotificationsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerNotificationsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerNotificationsData.serializer,
        json,
      );
}

abstract class GViewerNotificationsData_viewer
    implements
        Built<GViewerNotificationsData_viewer,
            GViewerNotificationsData_viewerBuilder> {
  GViewerNotificationsData_viewer._();

  factory GViewerNotificationsData_viewer(
          [Function(GViewerNotificationsData_viewerBuilder b) updates]) =
      _$GViewerNotificationsData_viewer;

  static void _initializeBuilder(GViewerNotificationsData_viewerBuilder b) =>
      b..G__typename = 'Viewer';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GViewerNotificationsData_viewer_notifications> get notifications;
  static Serializer<GViewerNotificationsData_viewer> get serializer =>
      _$gViewerNotificationsDataViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerNotificationsData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerNotificationsData_viewer.serializer,
        json,
      );
}

abstract class GViewerNotificationsData_viewer_notifications
    implements
        Built<GViewerNotificationsData_viewer_notifications,
            GViewerNotificationsData_viewer_notificationsBuilder> {
  GViewerNotificationsData_viewer_notifications._();

  factory GViewerNotificationsData_viewer_notifications(
      [Function(GViewerNotificationsData_viewer_notificationsBuilder b)
          updates]) = _$GViewerNotificationsData_viewer_notifications;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notificationsBuilder b) =>
      b..G__typename = 'NotificationNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  _i2.GNotificationType get type;
  int? get createdAt;
  String get message;
  String? get workId;
  static Serializer<GViewerNotificationsData_viewer_notifications>
      get serializer => _$gViewerNotificationsDataViewerNotificationsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerNotificationsData_viewer_notifications? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerNotificationsData_viewer_notifications.serializer,
        json,
      );
}
