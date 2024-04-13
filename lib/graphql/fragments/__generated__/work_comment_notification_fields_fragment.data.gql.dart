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

part 'work_comment_notification_fields_fragment.data.gql.g.dart';

abstract class GWorkCommentNotificationFields {
  String get G__typename;
  String get id;
  int get createdAt;
  String? get message;
  GWorkCommentNotificationFields_work? get work;
  GWorkCommentNotificationFields_user? get user;
  GWorkCommentNotificationFields_sticker? get sticker;
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentNotificationFields_work
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
  GWorkCommentNotificationFields_work_thumbnailImage? get thumbnailImage;
  @override
  double? get thumbnailImagePosition;
  @override
  double get imageAspectRatio;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentNotificationFields_work_thumbnailImage
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

abstract class GWorkCommentNotificationFields_user
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
  GWorkCommentNotificationFields_user_iconImage? get iconImage;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentNotificationFields_user_iconImage
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

abstract class GWorkCommentNotificationFields_sticker
    implements _i3.GPartialStickerFields {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GWorkCommentNotificationFields_sticker_image? get image;
  @override
  int get likesCount;
  @override
  int get downloadsCount;
  @override
  int get usesCount;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkCommentNotificationFields_sticker_image
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

abstract class GWorkCommentNotificationFieldsData
    implements
        Built<GWorkCommentNotificationFieldsData,
            GWorkCommentNotificationFieldsDataBuilder>,
        GWorkCommentNotificationFields {
  GWorkCommentNotificationFieldsData._();

  factory GWorkCommentNotificationFieldsData(
      [void Function(GWorkCommentNotificationFieldsDataBuilder b)
          updates]) = _$GWorkCommentNotificationFieldsData;

  static void _initializeBuilder(GWorkCommentNotificationFieldsDataBuilder b) =>
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
  GWorkCommentNotificationFieldsData_work? get work;
  @override
  GWorkCommentNotificationFieldsData_user? get user;
  @override
  GWorkCommentNotificationFieldsData_sticker? get sticker;
  static Serializer<GWorkCommentNotificationFieldsData> get serializer =>
      _$gWorkCommentNotificationFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentNotificationFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentNotificationFieldsData? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentNotificationFieldsData.serializer,
        json,
      );
}

abstract class GWorkCommentNotificationFieldsData_work
    implements
        Built<GWorkCommentNotificationFieldsData_work,
            GWorkCommentNotificationFieldsData_workBuilder>,
        GWorkCommentNotificationFields_work,
        _i1.GPartialWorkFields {
  GWorkCommentNotificationFieldsData_work._();

  factory GWorkCommentNotificationFieldsData_work(
      [void Function(GWorkCommentNotificationFieldsData_workBuilder b)
          updates]) = _$GWorkCommentNotificationFieldsData_work;

  static void _initializeBuilder(
          GWorkCommentNotificationFieldsData_workBuilder b) =>
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
  GWorkCommentNotificationFieldsData_work_thumbnailImage? get thumbnailImage;
  @override
  double? get thumbnailImagePosition;
  @override
  double get imageAspectRatio;
  static Serializer<GWorkCommentNotificationFieldsData_work> get serializer =>
      _$gWorkCommentNotificationFieldsDataWorkSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentNotificationFieldsData_work.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentNotificationFieldsData_work? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentNotificationFieldsData_work.serializer,
        json,
      );
}

abstract class GWorkCommentNotificationFieldsData_work_thumbnailImage
    implements
        Built<GWorkCommentNotificationFieldsData_work_thumbnailImage,
            GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder>,
        GWorkCommentNotificationFields_work_thumbnailImage,
        _i1.GPartialWorkFields_thumbnailImage {
  GWorkCommentNotificationFieldsData_work_thumbnailImage._();

  factory GWorkCommentNotificationFieldsData_work_thumbnailImage(
      [void Function(
              GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder b)
          updates]) = _$GWorkCommentNotificationFieldsData_work_thumbnailImage;

  static void _initializeBuilder(
          GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentNotificationFieldsData_work_thumbnailImage>
      get serializer =>
          _$gWorkCommentNotificationFieldsDataWorkThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentNotificationFieldsData_work_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentNotificationFieldsData_work_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentNotificationFieldsData_work_thumbnailImage.serializer,
        json,
      );
}

abstract class GWorkCommentNotificationFieldsData_user
    implements
        Built<GWorkCommentNotificationFieldsData_user,
            GWorkCommentNotificationFieldsData_userBuilder>,
        GWorkCommentNotificationFields_user,
        _i2.GPartialUserFields {
  GWorkCommentNotificationFieldsData_user._();

  factory GWorkCommentNotificationFieldsData_user(
      [void Function(GWorkCommentNotificationFieldsData_userBuilder b)
          updates]) = _$GWorkCommentNotificationFieldsData_user;

  static void _initializeBuilder(
          GWorkCommentNotificationFieldsData_userBuilder b) =>
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
  GWorkCommentNotificationFieldsData_user_iconImage? get iconImage;
  static Serializer<GWorkCommentNotificationFieldsData_user> get serializer =>
      _$gWorkCommentNotificationFieldsDataUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentNotificationFieldsData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentNotificationFieldsData_user? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentNotificationFieldsData_user.serializer,
        json,
      );
}

abstract class GWorkCommentNotificationFieldsData_user_iconImage
    implements
        Built<GWorkCommentNotificationFieldsData_user_iconImage,
            GWorkCommentNotificationFieldsData_user_iconImageBuilder>,
        GWorkCommentNotificationFields_user_iconImage,
        _i2.GPartialUserFields_iconImage {
  GWorkCommentNotificationFieldsData_user_iconImage._();

  factory GWorkCommentNotificationFieldsData_user_iconImage(
      [void Function(GWorkCommentNotificationFieldsData_user_iconImageBuilder b)
          updates]) = _$GWorkCommentNotificationFieldsData_user_iconImage;

  static void _initializeBuilder(
          GWorkCommentNotificationFieldsData_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentNotificationFieldsData_user_iconImage>
      get serializer =>
          _$gWorkCommentNotificationFieldsDataUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentNotificationFieldsData_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentNotificationFieldsData_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentNotificationFieldsData_user_iconImage.serializer,
        json,
      );
}

abstract class GWorkCommentNotificationFieldsData_sticker
    implements
        Built<GWorkCommentNotificationFieldsData_sticker,
            GWorkCommentNotificationFieldsData_stickerBuilder>,
        GWorkCommentNotificationFields_sticker,
        _i3.GPartialStickerFields {
  GWorkCommentNotificationFieldsData_sticker._();

  factory GWorkCommentNotificationFieldsData_sticker(
      [void Function(GWorkCommentNotificationFieldsData_stickerBuilder b)
          updates]) = _$GWorkCommentNotificationFieldsData_sticker;

  static void _initializeBuilder(
          GWorkCommentNotificationFieldsData_stickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GWorkCommentNotificationFieldsData_sticker_image? get image;
  @override
  int get likesCount;
  @override
  int get downloadsCount;
  @override
  int get usesCount;
  static Serializer<GWorkCommentNotificationFieldsData_sticker>
      get serializer => _$gWorkCommentNotificationFieldsDataStickerSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentNotificationFieldsData_sticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentNotificationFieldsData_sticker? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentNotificationFieldsData_sticker.serializer,
        json,
      );
}

abstract class GWorkCommentNotificationFieldsData_sticker_image
    implements
        Built<GWorkCommentNotificationFieldsData_sticker_image,
            GWorkCommentNotificationFieldsData_sticker_imageBuilder>,
        GWorkCommentNotificationFields_sticker_image,
        _i3.GPartialStickerFields_image {
  GWorkCommentNotificationFieldsData_sticker_image._();

  factory GWorkCommentNotificationFieldsData_sticker_image(
      [void Function(GWorkCommentNotificationFieldsData_sticker_imageBuilder b)
          updates]) = _$GWorkCommentNotificationFieldsData_sticker_image;

  static void _initializeBuilder(
          GWorkCommentNotificationFieldsData_sticker_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentNotificationFieldsData_sticker_image>
      get serializer =>
          _$gWorkCommentNotificationFieldsDataStickerImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GWorkCommentNotificationFieldsData_sticker_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentNotificationFieldsData_sticker_image? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GWorkCommentNotificationFieldsData_sticker_image.serializer,
        json,
      );
}
