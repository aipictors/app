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
  GWorkCommentReplyNotificationFields_work_thumbnailImage? get thumbnailImage;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentReplyNotificationFields_work_thumbnailImage
    implements _i1.GPartialWorkFields_thumbnailImage {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
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
  GWorkCommentReplyNotificationFields_user_iconImage? get iconImage;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentReplyNotificationFields_user_iconImage
    implements _i2.GPartialUserFields_iconImage {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
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
  GWorkCommentReplyNotificationFields_sticker_image? get image;
  @override
  int get likesCount;
  @override
  int get downloadsCount;
  @override
  int get usesCount;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentReplyNotificationFields_sticker_image
    implements _i3.GPartialStickerFields_image {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
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
      [Function(GWorkCommentReplyNotificationFieldsDataBuilder b)
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
      [Function(GWorkCommentReplyNotificationFieldsData_workBuilder b)
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
  GWorkCommentReplyNotificationFieldsData_work_thumbnailImage?
      get thumbnailImage;
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

abstract class GWorkCommentReplyNotificationFieldsData_work_thumbnailImage
    implements
        Built<GWorkCommentReplyNotificationFieldsData_work_thumbnailImage,
            GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder>,
        GWorkCommentReplyNotificationFields_work_thumbnailImage,
        _i1.GPartialWorkFields_thumbnailImage {
  GWorkCommentReplyNotificationFieldsData_work_thumbnailImage._();

  factory GWorkCommentReplyNotificationFieldsData_work_thumbnailImage(
      [Function(
              GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder
                  b)
          updates]) = _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImage;

  static void _initializeBuilder(
          GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder
              b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentReplyNotificationFieldsData_work_thumbnailImage>
      get serializer =>
          _$gWorkCommentReplyNotificationFieldsDataWorkThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentReplyNotificationFieldsData_work_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentReplyNotificationFieldsData_work_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentReplyNotificationFieldsData_work_thumbnailImage.serializer,
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
      [Function(GWorkCommentReplyNotificationFieldsData_userBuilder b)
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
  GWorkCommentReplyNotificationFieldsData_user_iconImage? get iconImage;
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

abstract class GWorkCommentReplyNotificationFieldsData_user_iconImage
    implements
        Built<GWorkCommentReplyNotificationFieldsData_user_iconImage,
            GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder>,
        GWorkCommentReplyNotificationFields_user_iconImage,
        _i2.GPartialUserFields_iconImage {
  GWorkCommentReplyNotificationFieldsData_user_iconImage._();

  factory GWorkCommentReplyNotificationFieldsData_user_iconImage(
      [Function(GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder b)
          updates]) = _$GWorkCommentReplyNotificationFieldsData_user_iconImage;

  static void _initializeBuilder(
          GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentReplyNotificationFieldsData_user_iconImage>
      get serializer =>
          _$gWorkCommentReplyNotificationFieldsDataUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentReplyNotificationFieldsData_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentReplyNotificationFieldsData_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentReplyNotificationFieldsData_user_iconImage.serializer,
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
      [Function(GWorkCommentReplyNotificationFieldsData_stickerBuilder b)
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
  GWorkCommentReplyNotificationFieldsData_sticker_image? get image;
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

abstract class GWorkCommentReplyNotificationFieldsData_sticker_image
    implements
        Built<GWorkCommentReplyNotificationFieldsData_sticker_image,
            GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder>,
        GWorkCommentReplyNotificationFields_sticker_image,
        _i3.GPartialStickerFields_image {
  GWorkCommentReplyNotificationFieldsData_sticker_image._();

  factory GWorkCommentReplyNotificationFieldsData_sticker_image(
      [Function(GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder b)
          updates]) = _$GWorkCommentReplyNotificationFieldsData_sticker_image;

  static void _initializeBuilder(
          GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentReplyNotificationFieldsData_sticker_image>
      get serializer =>
          _$gWorkCommentReplyNotificationFieldsDataStickerImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentReplyNotificationFieldsData_sticker_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentReplyNotificationFieldsData_sticker_image? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentReplyNotificationFieldsData_sticker_image.serializer,
        json,
      );
}
