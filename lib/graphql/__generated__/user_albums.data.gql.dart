// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_album_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_albums.data.gql.g.dart';

abstract class GUserAlbumsData
    implements Built<GUserAlbumsData, GUserAlbumsDataBuilder> {
  GUserAlbumsData._();

  factory GUserAlbumsData([Function(GUserAlbumsDataBuilder b) updates]) =
      _$GUserAlbumsData;

  static void _initializeBuilder(GUserAlbumsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserAlbumsData_user? get user;
  static Serializer<GUserAlbumsData> get serializer =>
      _$gUserAlbumsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAlbumsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserAlbumsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAlbumsData.serializer,
        json,
      );
}

abstract class GUserAlbumsData_user
    implements Built<GUserAlbumsData_user, GUserAlbumsData_userBuilder> {
  GUserAlbumsData_user._();

  factory GUserAlbumsData_user(
          [Function(GUserAlbumsData_userBuilder b) updates]) =
      _$GUserAlbumsData_user;

  static void _initializeBuilder(GUserAlbumsData_userBuilder b) =>
      b..G__typename = 'UserNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GUserAlbumsData_user_albums> get albums;
  static Serializer<GUserAlbumsData_user> get serializer =>
      _$gUserAlbumsDataUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAlbumsData_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserAlbumsData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAlbumsData_user.serializer,
        json,
      );
}

abstract class GUserAlbumsData_user_albums
    implements
        Built<GUserAlbumsData_user_albums, GUserAlbumsData_user_albumsBuilder>,
        _i2.GPartialAlbumFields {
  GUserAlbumsData_user_albums._();

  factory GUserAlbumsData_user_albums(
          [Function(GUserAlbumsData_user_albumsBuilder b) updates]) =
      _$GUserAlbumsData_user_albums;

  static void _initializeBuilder(GUserAlbumsData_user_albumsBuilder b) =>
      b..G__typename = 'AlbumNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  bool get isSensitive;
  @override
  int get likesCount;
  @override
  int get viewsCount;
  @override
  GUserAlbumsData_user_albums_thumbnailImage? get thumbnailImage;
  static Serializer<GUserAlbumsData_user_albums> get serializer =>
      _$gUserAlbumsDataUserAlbumsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAlbumsData_user_albums.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserAlbumsData_user_albums? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAlbumsData_user_albums.serializer,
        json,
      );
}

abstract class GUserAlbumsData_user_albums_thumbnailImage
    implements
        Built<GUserAlbumsData_user_albums_thumbnailImage,
            GUserAlbumsData_user_albums_thumbnailImageBuilder>,
        _i2.GPartialAlbumFields_thumbnailImage {
  GUserAlbumsData_user_albums_thumbnailImage._();

  factory GUserAlbumsData_user_albums_thumbnailImage(
      [Function(GUserAlbumsData_user_albums_thumbnailImageBuilder b)
          updates]) = _$GUserAlbumsData_user_albums_thumbnailImage;

  static void _initializeBuilder(
          GUserAlbumsData_user_albums_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserAlbumsData_user_albums_thumbnailImage>
      get serializer => _$gUserAlbumsDataUserAlbumsThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAlbumsData_user_albums_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserAlbumsData_user_albums_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAlbumsData_user_albums_thumbnailImage.serializer,
        json,
      );
}
