// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/follow_notification_fields_fragment.data.gql.dart'
    as _i11;
import 'package:aipictors/graphql/fragments/__generated__/liked_work_notification_fields_fragment.data.gql.dart'
    as _i3;
import 'package:aipictors/graphql/fragments/__generated__/liked_works_summary_notification_fields_fragment.data.gql.dart'
    as _i6;
import 'package:aipictors/graphql/fragments/__generated__/partial_sticker_fields_fragment.data.gql.dart'
    as _i9;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i5;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i4;
import 'package:aipictors/graphql/fragments/__generated__/work_award_notification_fields_fragment.data.gql.dart'
    as _i7;
import 'package:aipictors/graphql/fragments/__generated__/work_comment_notification_fields_fragment.data.gql.dart'
    as _i8;
import 'package:aipictors/graphql/fragments/__generated__/work_comment_reply_notification_fields_fragment.data.gql.dart'
    as _i10;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;

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

abstract class GViewerNotificationsData_viewer_notifications {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GViewerNotificationsData_viewer_notifications>
      get serializer => _i2.InlineFragmentSerializer<
              GViewerNotificationsData_viewer_notifications>(
            'GViewerNotificationsData_viewer_notifications',
            GViewerNotificationsData_viewer_notifications__base,
            {
              'LikedWorkNotificationNode':
                  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode,
              'LikedWorksSummaryNotificationNode':
                  GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode,
              'WorkAwardNotificationNode':
                  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode,
              'WorkCommentNotificationNode':
                  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode,
              'WorkCommentReplyNotificationNode':
                  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode,
              'FollowNotificationNode':
                  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode,
            },
          );

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

abstract class GViewerNotificationsData_viewer_notifications__base
    implements
        Built<GViewerNotificationsData_viewer_notifications__base,
            GViewerNotificationsData_viewer_notifications__baseBuilder>,
        GViewerNotificationsData_viewer_notifications {
  GViewerNotificationsData_viewer_notifications__base._();

  factory GViewerNotificationsData_viewer_notifications__base(
      [Function(GViewerNotificationsData_viewer_notifications__baseBuilder b)
          updates]) = _$GViewerNotificationsData_viewer_notifications__base;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__baseBuilder b) =>
      b..G__typename = 'NotificationNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GViewerNotificationsData_viewer_notifications__base>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerNotificationsData_viewer_notifications__base.serializer,
        json,
      );
}

abstract class GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode,
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNodeBuilder>,
        GViewerNotificationsData_viewer_notifications,
        _i3.GLikedWorkNotificationFields {
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode._();

  factory GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNodeBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNodeBuilder
              b) =>
      b..G__typename = 'LikedWorkNotificationNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  bool get isAnonymous;
  @override
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work?
      get work;
  @override
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user?
      get user;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsLikedWorkNotificationNodeSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work,
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_workBuilder>,
        _i3.GLikedWorkNotificationFields_work,
        _i4.GPartialWorkFields {
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work._();

  factory GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_workBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_workBuilder
              b) =>
      b..G__typename = 'WorkNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  int get createdAt;
  @override
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage?
      get thumbnailImage;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsLikedWorkNotificationNodeWorkSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage,
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImageBuilder>,
        _i3.GLikedWorkNotificationFields_work_thumbnailImage,
        _i4.GPartialWorkFields_thumbnailImage {
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage._();

  factory GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImageBuilder
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
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsLikedWorkNotificationNodeWorkThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user,
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_userBuilder>,
        _i3.GLikedWorkNotificationFields_user,
        _i5.GPartialUserFields {
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user._();

  factory GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_userBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_userBuilder
              b) =>
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
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage?
      get iconImage;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsLikedWorkNotificationNodeUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage,
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImageBuilder>,
        _i3.GLikedWorkNotificationFields_user_iconImage,
        _i5.GPartialUserFields_iconImage {
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage._();

  factory GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImageBuilder
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
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsLikedWorkNotificationNodeUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode,
            GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNodeBuilder>,
        GViewerNotificationsData_viewer_notifications,
        _i6.GLikedWorksSummaryNotificationFields {
  GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode._();

  factory GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNodeBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNodeBuilder
              b) =>
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
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsLikedWorksSummaryNotificationNodeSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode,
            GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNodeBuilder>,
        GViewerNotificationsData_viewer_notifications,
        _i7.GWorkAwardNotificationFields {
  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode._();

  factory GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNodeBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNodeBuilder
              b) =>
      b..G__typename = 'WorkAwardNotificationNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  String? get message;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work?
      get work;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkAwardNotificationNodeSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work,
            GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_workBuilder>,
        _i7.GWorkAwardNotificationFields_work,
        _i4.GPartialWorkFields {
  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work._();

  factory GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_workBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_workBuilder
              b) =>
      b..G__typename = 'WorkNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  int get createdAt;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage?
      get thumbnailImage;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkAwardNotificationNodeWorkSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage,
            GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImageBuilder>,
        _i7.GWorkAwardNotificationFields_work_thumbnailImage,
        _i4.GPartialWorkFields_thumbnailImage {
  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage._();

  factory GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImageBuilder
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
          GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkAwardNotificationNodeWorkThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode,
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNodeBuilder>,
        GViewerNotificationsData_viewer_notifications,
        _i8.GWorkCommentNotificationFields {
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNodeBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNodeBuilder
              b) =>
      b..G__typename = 'WorkCommentNotificationNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  String? get message;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work?
      get work;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user?
      get user;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker?
      get sticker;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentNotificationNodeSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work,
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_workBuilder>,
        _i8.GWorkCommentNotificationFields_work,
        _i4.GPartialWorkFields {
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_workBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_workBuilder
              b) =>
      b..G__typename = 'WorkNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  int get createdAt;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage?
      get thumbnailImage;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentNotificationNodeWorkSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage,
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImageBuilder>,
        _i8.GWorkCommentNotificationFields_work_thumbnailImage,
        _i4.GPartialWorkFields_thumbnailImage {
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImageBuilder
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
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentNotificationNodeWorkThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user,
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_userBuilder>,
        _i8.GWorkCommentNotificationFields_user,
        _i5.GPartialUserFields {
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_userBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_userBuilder
              b) =>
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
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage?
      get iconImage;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentNotificationNodeUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage,
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImageBuilder>,
        _i8.GWorkCommentNotificationFields_user_iconImage,
        _i5.GPartialUserFields_iconImage {
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImageBuilder
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
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentNotificationNodeUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker,
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_stickerBuilder>,
        _i8.GWorkCommentNotificationFields_sticker,
        _i9.GPartialStickerFields {
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_stickerBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_stickerBuilder
              b) =>
      b..G__typename = 'StickerNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image?
      get image;
  @override
  int get likesCount;
  @override
  int get downloadsCount;
  @override
  int get usesCount;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentNotificationNodeStickerSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image,
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_imageBuilder>,
        _i8.GWorkCommentNotificationFields_sticker_image,
        _i9.GPartialStickerFields_image {
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_imageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_imageBuilder
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
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentNotificationNodeStickerImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode,
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNodeBuilder>,
        GViewerNotificationsData_viewer_notifications,
        _i10.GWorkCommentReplyNotificationFields {
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNodeBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNodeBuilder
              b) =>
      b..G__typename = 'WorkCommentReplyNotificationNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  String? get message;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work?
      get work;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user?
      get user;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker?
      get sticker;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentReplyNotificationNodeSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work,
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_workBuilder>,
        _i10.GWorkCommentReplyNotificationFields_work,
        _i4.GPartialWorkFields {
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_workBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_workBuilder
              b) =>
      b..G__typename = 'WorkNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  int get createdAt;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage?
      get thumbnailImage;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentReplyNotificationNodeWorkSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage,
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImageBuilder>,
        _i10.GWorkCommentReplyNotificationFields_work_thumbnailImage,
        _i4.GPartialWorkFields_thumbnailImage {
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImageBuilder
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
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentReplyNotificationNodeWorkThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user,
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_userBuilder>,
        _i10.GWorkCommentReplyNotificationFields_user,
        _i5.GPartialUserFields {
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_userBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_userBuilder
              b) =>
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
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage?
      get iconImage;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentReplyNotificationNodeUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage,
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImageBuilder>,
        _i10.GWorkCommentReplyNotificationFields_user_iconImage,
        _i5.GPartialUserFields_iconImage {
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImageBuilder
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
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentReplyNotificationNodeUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker,
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_stickerBuilder>,
        _i10.GWorkCommentReplyNotificationFields_sticker,
        _i9.GPartialStickerFields {
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_stickerBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_stickerBuilder
              b) =>
      b..G__typename = 'StickerNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image?
      get image;
  @override
  int get likesCount;
  @override
  int get downloadsCount;
  @override
  int get usesCount;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentReplyNotificationNodeStickerSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image,
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_imageBuilder>,
        _i10.GWorkCommentReplyNotificationFields_sticker_image,
        _i9.GPartialStickerFields_image {
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image._();

  factory GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_imageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_imageBuilder
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
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsWorkCommentReplyNotificationNodeStickerImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asFollowNotificationNode
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asFollowNotificationNode,
            GViewerNotificationsData_viewer_notifications__asFollowNotificationNodeBuilder>,
        GViewerNotificationsData_viewer_notifications,
        _i11.GFollowNotificationFields {
  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode._();

  factory GViewerNotificationsData_viewer_notifications__asFollowNotificationNode(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asFollowNotificationNodeBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asFollowNotificationNode;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asFollowNotificationNodeBuilder
              b) =>
      b..G__typename = 'FollowNotificationNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user?
      get user;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asFollowNotificationNode>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsFollowNotificationNodeSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asFollowNotificationNode
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asFollowNotificationNode?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asFollowNotificationNode
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user,
            GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_userBuilder>,
        _i11.GFollowNotificationFields_user,
        _i5.GPartialUserFields {
  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user._();

  factory GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_userBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_userBuilder
              b) =>
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
  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage?
      get iconImage;
  static Serializer<
          GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsFollowNotificationNodeUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user
                .serializer,
            json,
          );
}

abstract class GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage
    implements
        Built<
            GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage,
            GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImageBuilder>,
        _i11.GFollowNotificationFields_user_iconImage,
        _i5.GPartialUserFields_iconImage {
  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage._();

  factory GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage(
          [Function(
                  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImageBuilder
                      b)
              updates]) =
      _$GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage;

  static void _initializeBuilder(
          GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImageBuilder
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
          GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage>
      get serializer =>
          _$gViewerNotificationsDataViewerNotificationsAsFollowNotificationNodeUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage
                .serializer,
            json,
          );
}
