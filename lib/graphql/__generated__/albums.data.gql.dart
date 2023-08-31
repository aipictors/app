// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_album_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i3;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'albums.data.gql.g.dart';

abstract class GAlbumsData implements Built<GAlbumsData, GAlbumsDataBuilder> {
  GAlbumsData._();

  factory GAlbumsData([Function(GAlbumsDataBuilder b) updates]) = _$GAlbumsData;

  static void _initializeBuilder(GAlbumsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAlbumsData_albums>? get albums;
  static Serializer<GAlbumsData> get serializer => _$gAlbumsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumsData.serializer,
        json,
      );
}

abstract class GAlbumsData_albums
    implements
        Built<GAlbumsData_albums, GAlbumsData_albumsBuilder>,
        _i2.GPartialAlbumFields {
  GAlbumsData_albums._();

  factory GAlbumsData_albums([Function(GAlbumsData_albumsBuilder b) updates]) =
      _$GAlbumsData_albums;

  static void _initializeBuilder(GAlbumsData_albumsBuilder b) =>
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
  GAlbumsData_albums_thumbnailImage? get thumbnailImage;
  GAlbumsData_albums_user get user;
  static Serializer<GAlbumsData_albums> get serializer =>
      _$gAlbumsDataAlbumsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumsData_albums.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumsData_albums? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumsData_albums.serializer,
        json,
      );
}

abstract class GAlbumsData_albums_thumbnailImage
    implements
        Built<GAlbumsData_albums_thumbnailImage,
            GAlbumsData_albums_thumbnailImageBuilder>,
        _i2.GPartialAlbumFields_thumbnailImage {
  GAlbumsData_albums_thumbnailImage._();

  factory GAlbumsData_albums_thumbnailImage(
          [Function(GAlbumsData_albums_thumbnailImageBuilder b) updates]) =
      _$GAlbumsData_albums_thumbnailImage;

  static void _initializeBuilder(GAlbumsData_albums_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GAlbumsData_albums_thumbnailImage> get serializer =>
      _$gAlbumsDataAlbumsThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumsData_albums_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumsData_albums_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumsData_albums_thumbnailImage.serializer,
        json,
      );
}

abstract class GAlbumsData_albums_user
    implements
        Built<GAlbumsData_albums_user, GAlbumsData_albums_userBuilder>,
        _i3.GPartialUserFields {
  GAlbumsData_albums_user._();

  factory GAlbumsData_albums_user(
          [Function(GAlbumsData_albums_userBuilder b) updates]) =
      _$GAlbumsData_albums_user;

  static void _initializeBuilder(GAlbumsData_albums_userBuilder b) =>
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
  GAlbumsData_albums_user_iconImage? get iconImage;
  static Serializer<GAlbumsData_albums_user> get serializer =>
      _$gAlbumsDataAlbumsUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumsData_albums_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumsData_albums_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumsData_albums_user.serializer,
        json,
      );
}

abstract class GAlbumsData_albums_user_iconImage
    implements
        Built<GAlbumsData_albums_user_iconImage,
            GAlbumsData_albums_user_iconImageBuilder>,
        _i3.GPartialUserFields_iconImage {
  GAlbumsData_albums_user_iconImage._();

  factory GAlbumsData_albums_user_iconImage(
          [Function(GAlbumsData_albums_user_iconImageBuilder b) updates]) =
      _$GAlbumsData_albums_user_iconImage;

  static void _initializeBuilder(GAlbumsData_albums_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GAlbumsData_albums_user_iconImage> get serializer =>
      _$gAlbumsDataAlbumsUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumsData_albums_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlbumsData_albums_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumsData_albums_user_iconImage.serializer,
        json,
      );
}
