// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'album.data.gql.g.dart';

abstract class GAlbumData implements Built<GAlbumData, GAlbumDataBuilder> {
  GAlbumData._();

  factory GAlbumData([Function(GAlbumDataBuilder b) updates]) = _$GAlbumData;

  static void _initializeBuilder(GAlbumDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAlbumData_album? get album;
  static Serializer<GAlbumData> get serializer => _$gAlbumDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumData.serializer,
        json,
      );
}

abstract class GAlbumData_album
    implements Built<GAlbumData_album, GAlbumData_albumBuilder> {
  GAlbumData_album._();

  factory GAlbumData_album([Function(GAlbumData_albumBuilder b) updates]) =
      _$GAlbumData_album;

  static void _initializeBuilder(GAlbumData_albumBuilder b) =>
      b..G__typename = 'AlbumNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  String get description;
  GAlbumData_album_user get user;
  int get createdAt;
  _i2.GRating get rating;
  GAlbumData_album_thumbnailImage? get thumbnailImage;
  static Serializer<GAlbumData_album> get serializer =>
      _$gAlbumDataAlbumSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumData_album.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumData_album? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumData_album.serializer,
        json,
      );
}

abstract class GAlbumData_album_user
    implements
        Built<GAlbumData_album_user, GAlbumData_album_userBuilder>,
        _i3.GWorkUserFields {
  GAlbumData_album_user._();

  factory GAlbumData_album_user(
          [Function(GAlbumData_album_userBuilder b) updates]) =
      _$GAlbumData_album_user;

  static void _initializeBuilder(GAlbumData_album_userBuilder b) =>
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
  GAlbumData_album_user_iconImage? get iconImage;
  GAlbumData_album_user_viewer? get viewer;
  static Serializer<GAlbumData_album_user> get serializer =>
      _$gAlbumDataAlbumUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumData_album_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumData_album_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumData_album_user.serializer,
        json,
      );
}

abstract class GAlbumData_album_user_iconImage
    implements
        Built<GAlbumData_album_user_iconImage,
            GAlbumData_album_user_iconImageBuilder>,
        _i3.GWorkUserFields_iconImage {
  GAlbumData_album_user_iconImage._();

  factory GAlbumData_album_user_iconImage(
          [Function(GAlbumData_album_user_iconImageBuilder b) updates]) =
      _$GAlbumData_album_user_iconImage;

  static void _initializeBuilder(GAlbumData_album_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GAlbumData_album_user_iconImage> get serializer =>
      _$gAlbumDataAlbumUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumData_album_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumData_album_user_iconImage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumData_album_user_iconImage.serializer,
        json,
      );
}

abstract class GAlbumData_album_user_viewer
    implements
        Built<GAlbumData_album_user_viewer,
            GAlbumData_album_user_viewerBuilder> {
  GAlbumData_album_user_viewer._();

  factory GAlbumData_album_user_viewer(
          [Function(GAlbumData_album_user_viewerBuilder b) updates]) =
      _$GAlbumData_album_user_viewer;

  static void _initializeBuilder(GAlbumData_album_user_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get isFollowee;
  bool get isMuted;
  static Serializer<GAlbumData_album_user_viewer> get serializer =>
      _$gAlbumDataAlbumUserViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumData_album_user_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumData_album_user_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumData_album_user_viewer.serializer,
        json,
      );
}

abstract class GAlbumData_album_thumbnailImage
    implements
        Built<GAlbumData_album_thumbnailImage,
            GAlbumData_album_thumbnailImageBuilder> {
  GAlbumData_album_thumbnailImage._();

  factory GAlbumData_album_thumbnailImage(
          [Function(GAlbumData_album_thumbnailImageBuilder b) updates]) =
      _$GAlbumData_album_thumbnailImage;

  static void _initializeBuilder(GAlbumData_album_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get downloadURL;
  static Serializer<GAlbumData_album_thumbnailImage> get serializer =>
      _$gAlbumDataAlbumThumbnailImageSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumData_album_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumData_album_thumbnailImage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumData_album_thumbnailImage.serializer,
        json,
      );
}
