// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart'
    as _i3;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sticker.data.gql.g.dart';

abstract class GStickerData
    implements Built<GStickerData, GStickerDataBuilder> {
  GStickerData._();

  factory GStickerData([void Function(GStickerDataBuilder b) updates]) =
      _$GStickerData;

  static void _initializeBuilder(GStickerDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GStickerData_sticker? get sticker;
  static Serializer<GStickerData> get serializer => _$gStickerDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickerData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickerData.serializer,
        json,
      );
}

abstract class GStickerData_sticker
    implements Built<GStickerData_sticker, GStickerData_stickerBuilder> {
  GStickerData_sticker._();

  factory GStickerData_sticker(
          [void Function(GStickerData_stickerBuilder b) updates]) =
      _$GStickerData_sticker;

  static void _initializeBuilder(GStickerData_stickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  int get createdAt;
  String get title;
  GStickerData_sticker_image? get image;
  GStickerData_sticker_user get user;
  bool get isLiked;
  int get downloadsCount;
  int get likesCount;
  int get usesCount;
  _i2.GStickerGenre get genre;
  BuiltList<String> get categories;
  bool get isDownloaded;
  bool get isDeleted;
  static Serializer<GStickerData_sticker> get serializer =>
      _$gStickerDataStickerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickerData_sticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerData_sticker? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickerData_sticker.serializer,
        json,
      );
}

abstract class GStickerData_sticker_image
    implements
        Built<GStickerData_sticker_image, GStickerData_sticker_imageBuilder> {
  GStickerData_sticker_image._();

  factory GStickerData_sticker_image(
          [void Function(GStickerData_sticker_imageBuilder b) updates]) =
      _$GStickerData_sticker_image;

  static void _initializeBuilder(GStickerData_sticker_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get downloadURL;
  static Serializer<GStickerData_sticker_image> get serializer =>
      _$gStickerDataStickerImageSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickerData_sticker_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerData_sticker_image? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickerData_sticker_image.serializer,
        json,
      );
}

abstract class GStickerData_sticker_user
    implements
        Built<GStickerData_sticker_user, GStickerData_sticker_userBuilder>,
        _i3.GWorkUserFields {
  GStickerData_sticker_user._();

  factory GStickerData_sticker_user(
          [void Function(GStickerData_sticker_userBuilder b) updates]) =
      _$GStickerData_sticker_user;

  static void _initializeBuilder(GStickerData_sticker_userBuilder b) =>
      b..G__typename = 'UserNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  String get login;
  @override
  GStickerData_sticker_user_iconImage? get iconImage;
  GStickerData_sticker_user_viewer? get viewer;
  static Serializer<GStickerData_sticker_user> get serializer =>
      _$gStickerDataStickerUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickerData_sticker_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerData_sticker_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickerData_sticker_user.serializer,
        json,
      );
}

abstract class GStickerData_sticker_user_iconImage
    implements
        Built<GStickerData_sticker_user_iconImage,
            GStickerData_sticker_user_iconImageBuilder>,
        _i3.GWorkUserFields_iconImage {
  GStickerData_sticker_user_iconImage._();

  factory GStickerData_sticker_user_iconImage(
      [void Function(GStickerData_sticker_user_iconImageBuilder b)
          updates]) = _$GStickerData_sticker_user_iconImage;

  static void _initializeBuilder(
          GStickerData_sticker_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GStickerData_sticker_user_iconImage> get serializer =>
      _$gStickerDataStickerUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickerData_sticker_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerData_sticker_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickerData_sticker_user_iconImage.serializer,
        json,
      );
}

abstract class GStickerData_sticker_user_viewer
    implements
        Built<GStickerData_sticker_user_viewer,
            GStickerData_sticker_user_viewerBuilder> {
  GStickerData_sticker_user_viewer._();

  factory GStickerData_sticker_user_viewer(
          [void Function(GStickerData_sticker_user_viewerBuilder b) updates]) =
      _$GStickerData_sticker_user_viewer;

  static void _initializeBuilder(GStickerData_sticker_user_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isFollower;
  bool get isFollowee;
  bool get isMuted;
  static Serializer<GStickerData_sticker_user_viewer> get serializer =>
      _$gStickerDataStickerUserViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickerData_sticker_user_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerData_sticker_user_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickerData_sticker_user_viewer.serializer,
        json,
      );
}
