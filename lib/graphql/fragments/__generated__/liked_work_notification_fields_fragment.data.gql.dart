// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i3;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'liked_work_notification_fields_fragment.data.gql.g.dart';

abstract class GLikedWorkNotificationFields {
  String get G__typename;
  String get id;
  int get createdAt;
  bool get isAnonymous;
  GLikedWorkNotificationFields_work? get work;
  GLikedWorkNotificationFields_user? get user;
  Map<String, dynamic> toJson();
}

abstract class GLikedWorkNotificationFields_work
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
  GLikedWorkNotificationFields_work_thumbnailImage? get thumbnailImage;
  @override
  double? get thumbnailImagePosition;
  @override
  double get imageAspectRatio;
  @override
  Map<String, dynamic> toJson();
}

abstract class GLikedWorkNotificationFields_work_thumbnailImage
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

abstract class GLikedWorkNotificationFields_user
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
  GLikedWorkNotificationFields_user_iconImage? get iconImage;
  @override
  Map<String, dynamic> toJson();
}

abstract class GLikedWorkNotificationFields_user_iconImage
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

abstract class GLikedWorkNotificationFieldsData
    implements
        Built<GLikedWorkNotificationFieldsData,
            GLikedWorkNotificationFieldsDataBuilder>,
        GLikedWorkNotificationFields {
  GLikedWorkNotificationFieldsData._();

  factory GLikedWorkNotificationFieldsData(
          [void Function(GLikedWorkNotificationFieldsDataBuilder b) updates]) =
      _$GLikedWorkNotificationFieldsData;

  static void _initializeBuilder(GLikedWorkNotificationFieldsDataBuilder b) =>
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
  GLikedWorkNotificationFieldsData_work? get work;
  @override
  GLikedWorkNotificationFieldsData_user? get user;
  static Serializer<GLikedWorkNotificationFieldsData> get serializer =>
      _$gLikedWorkNotificationFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GLikedWorkNotificationFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLikedWorkNotificationFieldsData? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GLikedWorkNotificationFieldsData.serializer,
        json,
      );
}

abstract class GLikedWorkNotificationFieldsData_work
    implements
        Built<GLikedWorkNotificationFieldsData_work,
            GLikedWorkNotificationFieldsData_workBuilder>,
        GLikedWorkNotificationFields_work,
        _i1.GPartialWorkFields {
  GLikedWorkNotificationFieldsData_work._();

  factory GLikedWorkNotificationFieldsData_work(
      [void Function(GLikedWorkNotificationFieldsData_workBuilder b)
          updates]) = _$GLikedWorkNotificationFieldsData_work;

  static void _initializeBuilder(
          GLikedWorkNotificationFieldsData_workBuilder b) =>
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
  GLikedWorkNotificationFieldsData_work_thumbnailImage? get thumbnailImage;
  @override
  double? get thumbnailImagePosition;
  @override
  double get imageAspectRatio;
  static Serializer<GLikedWorkNotificationFieldsData_work> get serializer =>
      _$gLikedWorkNotificationFieldsDataWorkSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GLikedWorkNotificationFieldsData_work.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLikedWorkNotificationFieldsData_work? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GLikedWorkNotificationFieldsData_work.serializer,
        json,
      );
}

abstract class GLikedWorkNotificationFieldsData_work_thumbnailImage
    implements
        Built<GLikedWorkNotificationFieldsData_work_thumbnailImage,
            GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder>,
        GLikedWorkNotificationFields_work_thumbnailImage,
        _i1.GPartialWorkFields_thumbnailImage {
  GLikedWorkNotificationFieldsData_work_thumbnailImage._();

  factory GLikedWorkNotificationFieldsData_work_thumbnailImage(
      [void Function(
              GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder b)
          updates]) = _$GLikedWorkNotificationFieldsData_work_thumbnailImage;

  static void _initializeBuilder(
          GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GLikedWorkNotificationFieldsData_work_thumbnailImage>
      get serializer =>
          _$gLikedWorkNotificationFieldsDataWorkThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GLikedWorkNotificationFieldsData_work_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLikedWorkNotificationFieldsData_work_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GLikedWorkNotificationFieldsData_work_thumbnailImage.serializer,
        json,
      );
}

abstract class GLikedWorkNotificationFieldsData_user
    implements
        Built<GLikedWorkNotificationFieldsData_user,
            GLikedWorkNotificationFieldsData_userBuilder>,
        GLikedWorkNotificationFields_user,
        _i2.GPartialUserFields {
  GLikedWorkNotificationFieldsData_user._();

  factory GLikedWorkNotificationFieldsData_user(
      [void Function(GLikedWorkNotificationFieldsData_userBuilder b)
          updates]) = _$GLikedWorkNotificationFieldsData_user;

  static void _initializeBuilder(
          GLikedWorkNotificationFieldsData_userBuilder b) =>
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
  GLikedWorkNotificationFieldsData_user_iconImage? get iconImage;
  static Serializer<GLikedWorkNotificationFieldsData_user> get serializer =>
      _$gLikedWorkNotificationFieldsDataUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GLikedWorkNotificationFieldsData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLikedWorkNotificationFieldsData_user? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GLikedWorkNotificationFieldsData_user.serializer,
        json,
      );
}

abstract class GLikedWorkNotificationFieldsData_user_iconImage
    implements
        Built<GLikedWorkNotificationFieldsData_user_iconImage,
            GLikedWorkNotificationFieldsData_user_iconImageBuilder>,
        GLikedWorkNotificationFields_user_iconImage,
        _i2.GPartialUserFields_iconImage {
  GLikedWorkNotificationFieldsData_user_iconImage._();

  factory GLikedWorkNotificationFieldsData_user_iconImage(
      [void Function(GLikedWorkNotificationFieldsData_user_iconImageBuilder b)
          updates]) = _$GLikedWorkNotificationFieldsData_user_iconImage;

  static void _initializeBuilder(
          GLikedWorkNotificationFieldsData_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GLikedWorkNotificationFieldsData_user_iconImage>
      get serializer =>
          _$gLikedWorkNotificationFieldsDataUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GLikedWorkNotificationFieldsData_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLikedWorkNotificationFieldsData_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GLikedWorkNotificationFieldsData_user_iconImage.serializer,
        json,
      );
}
