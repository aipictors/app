// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_liked_works.data.gql.g.dart';

abstract class GUserLikedWorksData
    implements Built<GUserLikedWorksData, GUserLikedWorksDataBuilder> {
  GUserLikedWorksData._();

  factory GUserLikedWorksData(
      [Function(GUserLikedWorksDataBuilder b) updates]) = _$GUserLikedWorksData;

  static void _initializeBuilder(GUserLikedWorksDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserLikedWorksData_user? get user;
  static Serializer<GUserLikedWorksData> get serializer =>
      _$gUserLikedWorksDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLikedWorksData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLikedWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLikedWorksData.serializer,
        json,
      );
}

abstract class GUserLikedWorksData_user
    implements
        Built<GUserLikedWorksData_user, GUserLikedWorksData_userBuilder> {
  GUserLikedWorksData_user._();

  factory GUserLikedWorksData_user(
          [Function(GUserLikedWorksData_userBuilder b) updates]) =
      _$GUserLikedWorksData_user;

  static void _initializeBuilder(GUserLikedWorksData_userBuilder b) =>
      b..G__typename = 'UserNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GUserLikedWorksData_user_likedWorks> get likedWorks;
  static Serializer<GUserLikedWorksData_user> get serializer =>
      _$gUserLikedWorksDataUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLikedWorksData_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLikedWorksData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLikedWorksData_user.serializer,
        json,
      );
}

abstract class GUserLikedWorksData_user_likedWorks
    implements
        Built<GUserLikedWorksData_user_likedWorks,
            GUserLikedWorksData_user_likedWorksBuilder>,
        _i2.GPartialWorkFields {
  GUserLikedWorksData_user_likedWorks._();

  factory GUserLikedWorksData_user_likedWorks(
          [Function(GUserLikedWorksData_user_likedWorksBuilder b) updates]) =
      _$GUserLikedWorksData_user_likedWorks;

  static void _initializeBuilder(
          GUserLikedWorksData_user_likedWorksBuilder b) =>
      b..G__typename = 'WorkNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GUserLikedWorksData_user_likedWorks_image? get image;
  @override
  GUserLikedWorksData_user_likedWorks_thumbnailImage? get thumbnailImage;
  static Serializer<GUserLikedWorksData_user_likedWorks> get serializer =>
      _$gUserLikedWorksDataUserLikedWorksSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLikedWorksData_user_likedWorks.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLikedWorksData_user_likedWorks? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLikedWorksData_user_likedWorks.serializer,
        json,
      );
}

abstract class GUserLikedWorksData_user_likedWorks_image
    implements
        Built<GUserLikedWorksData_user_likedWorks_image,
            GUserLikedWorksData_user_likedWorks_imageBuilder>,
        _i2.GPartialWorkFields_image {
  GUserLikedWorksData_user_likedWorks_image._();

  factory GUserLikedWorksData_user_likedWorks_image(
      [Function(GUserLikedWorksData_user_likedWorks_imageBuilder b)
          updates]) = _$GUserLikedWorksData_user_likedWorks_image;

  static void _initializeBuilder(
          GUserLikedWorksData_user_likedWorks_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserLikedWorksData_user_likedWorks_image> get serializer =>
      _$gUserLikedWorksDataUserLikedWorksImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLikedWorksData_user_likedWorks_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLikedWorksData_user_likedWorks_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLikedWorksData_user_likedWorks_image.serializer,
        json,
      );
}

abstract class GUserLikedWorksData_user_likedWorks_thumbnailImage
    implements
        Built<GUserLikedWorksData_user_likedWorks_thumbnailImage,
            GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GUserLikedWorksData_user_likedWorks_thumbnailImage._();

  factory GUserLikedWorksData_user_likedWorks_thumbnailImage(
      [Function(GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder b)
          updates]) = _$GUserLikedWorksData_user_likedWorks_thumbnailImage;

  static void _initializeBuilder(
          GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserLikedWorksData_user_likedWorks_thumbnailImage>
      get serializer =>
          _$gUserLikedWorksDataUserLikedWorksThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserLikedWorksData_user_likedWorks_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserLikedWorksData_user_likedWorks_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserLikedWorksData_user_likedWorks_thumbnailImage.serializer,
        json,
      );
}
