// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i4;
import 'package:aipictors/graphql/fragments/__generated__/partial_sticker_fields_fragment.data.gql.dart'
    as _i3;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_comment_reply_notification_fields_fragment.data.gql.g.dart';

abstract class GWorkCommentReplyNotificationFields {
  String get G__typename;
  String get id;
  int get createdAt;
  String? get message;
  GWorkCommentReplyNotificationFields_work? get work;
  GWorkCommentReplyNotificationFields_user? get user;
  GWorkCommentReplyNotificationFields_sticker? get sticker;
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentReplyNotificationFields_work
    implements _i1.GPartialWorkFields {
  @override
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
  String get imageURL;
  @override
  int get imageWidth;
  @override
  int get imageHeight;
  @override
  String get largeThumbnailImageURL;
  @override
  int get largeThumbnailImageWidth;
  @override
  int get largeThumbnailImageHeight;
  @override
  String get smallThumbnailImageURL;
  @override
  int get smallThumbnailImageWidth;
  @override
  int get smallThumbnailImageHeight;
  @override
  double? get thumbnailImagePosition;
  @override
  double get imageAspectRatio;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentReplyNotificationFields_user
    implements _i2.GPartialUserFields {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get login;
  @override
  String get name;
  @override
  String? get iconUrl;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentReplyNotificationFields_sticker
    implements _i3.GPartialStickerFields {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  String? get imageUrl;
  @override
  int get likesCount;
  @override
  int get downloadsCount;
  @override
  int get usesCount;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentReplyNotificationFieldsData
    implements
        Built<GWorkCommentReplyNotificationFieldsData,
            GWorkCommentReplyNotificationFieldsDataBuilder>,
        GWorkCommentReplyNotificationFields {
  GWorkCommentReplyNotificationFieldsData._();

  factory GWorkCommentReplyNotificationFieldsData(
      [void Function(GWorkCommentReplyNotificationFieldsDataBuilder b)
          updates]) = _$GWorkCommentReplyNotificationFieldsData;

  static void _initializeBuilder(
          GWorkCommentReplyNotificationFieldsDataBuilder b) =>
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
  GWorkCommentReplyNotificationFieldsData_work? get work;
  @override
  GWorkCommentReplyNotificationFieldsData_user? get user;
  @override
  GWorkCommentReplyNotificationFieldsData_sticker? get sticker;
  static Serializer<GWorkCommentReplyNotificationFieldsData> get serializer =>
      _$gWorkCommentReplyNotificationFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentReplyNotificationFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentReplyNotificationFieldsData? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentReplyNotificationFieldsData.serializer,
        json,
      );
}

abstract class GWorkCommentReplyNotificationFieldsData_work
    implements
        Built<GWorkCommentReplyNotificationFieldsData_work,
            GWorkCommentReplyNotificationFieldsData_workBuilder>,
        GWorkCommentReplyNotificationFields_work,
        _i1.GPartialWorkFields {
  GWorkCommentReplyNotificationFieldsData_work._();

  factory GWorkCommentReplyNotificationFieldsData_work(
      [void Function(GWorkCommentReplyNotificationFieldsData_workBuilder b)
          updates]) = _$GWorkCommentReplyNotificationFieldsData_work;

  static void _initializeBuilder(
          GWorkCommentReplyNotificationFieldsData_workBuilder b) =>
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
  String get imageURL;
  @override
  int get imageWidth;
  @override
  int get imageHeight;
  @override
  String get largeThumbnailImageURL;
  @override
  int get largeThumbnailImageWidth;
  @override
  int get largeThumbnailImageHeight;
  @override
  String get smallThumbnailImageURL;
  @override
  int get smallThumbnailImageWidth;
  @override
  int get smallThumbnailImageHeight;
  @override
  double? get thumbnailImagePosition;
  @override
  double get imageAspectRatio;
  static Serializer<GWorkCommentReplyNotificationFieldsData_work>
      get serializer => _$gWorkCommentReplyNotificationFieldsDataWorkSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentReplyNotificationFieldsData_work.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentReplyNotificationFieldsData_work? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentReplyNotificationFieldsData_work.serializer,
        json,
      );
}

abstract class GWorkCommentReplyNotificationFieldsData_user
    implements
        Built<GWorkCommentReplyNotificationFieldsData_user,
            GWorkCommentReplyNotificationFieldsData_userBuilder>,
        GWorkCommentReplyNotificationFields_user,
        _i2.GPartialUserFields {
  GWorkCommentReplyNotificationFieldsData_user._();

  factory GWorkCommentReplyNotificationFieldsData_user(
      [void Function(GWorkCommentReplyNotificationFieldsData_userBuilder b)
          updates]) = _$GWorkCommentReplyNotificationFieldsData_user;

  static void _initializeBuilder(
          GWorkCommentReplyNotificationFieldsData_userBuilder b) =>
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
  String? get iconUrl;
  static Serializer<GWorkCommentReplyNotificationFieldsData_user>
      get serializer => _$gWorkCommentReplyNotificationFieldsDataUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentReplyNotificationFieldsData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentReplyNotificationFieldsData_user? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentReplyNotificationFieldsData_user.serializer,
        json,
      );
}

abstract class GWorkCommentReplyNotificationFieldsData_sticker
    implements
        Built<GWorkCommentReplyNotificationFieldsData_sticker,
            GWorkCommentReplyNotificationFieldsData_stickerBuilder>,
        GWorkCommentReplyNotificationFields_sticker,
        _i3.GPartialStickerFields {
  GWorkCommentReplyNotificationFieldsData_sticker._();

  factory GWorkCommentReplyNotificationFieldsData_sticker(
      [void Function(GWorkCommentReplyNotificationFieldsData_stickerBuilder b)
          updates]) = _$GWorkCommentReplyNotificationFieldsData_sticker;

  static void _initializeBuilder(
          GWorkCommentReplyNotificationFieldsData_stickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  String? get imageUrl;
  @override
  int get likesCount;
  @override
  int get downloadsCount;
  @override
  int get usesCount;
  static Serializer<GWorkCommentReplyNotificationFieldsData_sticker>
      get serializer =>
          _$gWorkCommentReplyNotificationFieldsDataStickerSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentReplyNotificationFieldsData_sticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentReplyNotificationFieldsData_sticker? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentReplyNotificationFieldsData_sticker.serializer,
        json,
      );
}
