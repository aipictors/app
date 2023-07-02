// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_sticker_fields_fragment.data.gql.dart'
    as _i5;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i4;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i3;
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
  int get createdAt;
  String get message;
  String? get workId;
  GViewerNotificationsData_viewer_notifications_work? get work;
  String? get relatedUserId;
  GViewerNotificationsData_viewer_notifications_relatedUser? get relatedUser;
  String? get stickerId;
  GViewerNotificationsData_viewer_notifications_sticker? get sticker;
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

abstract class GViewerNotificationsData_viewer_notifications_work
    implements
        Built<GViewerNotificationsData_viewer_notifications_work,
            GViewerNotificationsData_viewer_notifications_workBuilder>,
        _i3.GPartialWorkFields {
  GViewerNotificationsData_viewer_notifications_work._();

  factory GViewerNotificationsData_viewer_notifications_work(
      [Function(GViewerNotificationsData_viewer_notifications_workBuilder b)
          updates]) = _$GViewerNotificationsData_viewer_notifications_work;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications_workBuilder b) =>
      b..G__typename = 'WorkNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GViewerNotificationsData_viewer_notifications_work_thumbnailImage?
      get thumbnailImage;
  static Serializer<GViewerNotificationsData_viewer_notifications_work>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsWorkSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications_work.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerNotificationsData_viewer_notifications_work? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerNotificationsData_viewer_notifications_work.serializer,
        json,
      );
}

abstract class GViewerNotificationsData_viewer_notifications_work_thumbnailImage
    implements
        Built<GViewerNotificationsData_viewer_notifications_work_thumbnailImage,
            GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder>,
        _i3.GPartialWorkFields_thumbnailImage {
  GViewerNotificationsData_viewer_notifications_work_thumbnailImage._();

  factory GViewerNotificationsData_viewer_notifications_work_thumbnailImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications_work_thumbnailImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder
              b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<
          GViewerNotificationsData_viewer_notifications_work_thumbnailImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsWorkThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications_work_thumbnailImage
            .serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerNotificationsData_viewer_notifications_work_thumbnailImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications_work_thumbnailImage
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications_relatedUser
    implements
        Built<GViewerNotificationsData_viewer_notifications_relatedUser,
            GViewerNotificationsData_viewer_notifications_relatedUserBuilder>,
        _i4.GPartialUserFields {
  GViewerNotificationsData_viewer_notifications_relatedUser._();

  factory GViewerNotificationsData_viewer_notifications_relatedUser(
      [Function(
              GViewerNotificationsData_viewer_notifications_relatedUserBuilder
                  b)
          updates]) = _$GViewerNotificationsData_viewer_notifications_relatedUser;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications_relatedUserBuilder b) =>
      b..G__typename = 'UserNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get login;
  @override
  String get name;
  @override
  GViewerNotificationsData_viewer_notifications_relatedUser_iconImage?
      get iconImage;
  static Serializer<GViewerNotificationsData_viewer_notifications_relatedUser>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsRelatedUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications_relatedUser.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerNotificationsData_viewer_notifications_relatedUser? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerNotificationsData_viewer_notifications_relatedUser.serializer,
        json,
      );
}

abstract class GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
    implements
        Built<
            GViewerNotificationsData_viewer_notifications_relatedUser_iconImage,
            GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder>,
        _i4.GPartialUserFields_iconImage {
  GViewerNotificationsData_viewer_notifications_relatedUser_iconImage._();

  factory GViewerNotificationsData_viewer_notifications_relatedUser_iconImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder
              b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<
          GViewerNotificationsData_viewer_notifications_relatedUser_iconImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsRelatedUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
            .serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerNotificationsData_viewer_notifications_relatedUser_iconImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications_sticker
    implements
        Built<GViewerNotificationsData_viewer_notifications_sticker,
            GViewerNotificationsData_viewer_notifications_stickerBuilder>,
        _i5.GPartialStickerFields {
  GViewerNotificationsData_viewer_notifications_sticker._();

  factory GViewerNotificationsData_viewer_notifications_sticker(
      [Function(GViewerNotificationsData_viewer_notifications_stickerBuilder b)
          updates]) = _$GViewerNotificationsData_viewer_notifications_sticker;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications_stickerBuilder b) =>
      b..G__typename = 'StickerNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GViewerNotificationsData_viewer_notifications_sticker_image get image;
  static Serializer<GViewerNotificationsData_viewer_notifications_sticker>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsStickerSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications_sticker.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerNotificationsData_viewer_notifications_sticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerNotificationsData_viewer_notifications_sticker.serializer,
        json,
      );
}

abstract class GViewerNotificationsData_viewer_notifications_sticker_image
    implements
        Built<GViewerNotificationsData_viewer_notifications_sticker_image,
            GViewerNotificationsData_viewer_notifications_sticker_imageBuilder>,
        _i5.GPartialStickerFields_image {
  GViewerNotificationsData_viewer_notifications_sticker_image._();

  factory GViewerNotificationsData_viewer_notifications_sticker_image(
      [Function(
              GViewerNotificationsData_viewer_notifications_sticker_imageBuilder
                  b)
          updates]) = _$GViewerNotificationsData_viewer_notifications_sticker_image;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications_sticker_imageBuilder
              b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GViewerNotificationsData_viewer_notifications_sticker_image>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsStickerImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications_sticker_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerNotificationsData_viewer_notifications_sticker_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerNotificationsData_viewer_notifications_sticker_image.serializer,
        json,
      );
}
