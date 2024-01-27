// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_feed_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i3;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed_popular_works.data.gql.g.dart';

abstract class GFeedPopularWorksData
    implements Built<GFeedPopularWorksData, GFeedPopularWorksDataBuilder> {
  GFeedPopularWorksData._();

  factory GFeedPopularWorksData(
          [Function(GFeedPopularWorksDataBuilder b) updates]) =
      _$GFeedPopularWorksData;

  static void _initializeBuilder(GFeedPopularWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GFeedPopularWorksData_popularWorks> get popularWorks;
  static Serializer<GFeedPopularWorksData> get serializer =>
      _$gFeedPopularWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedPopularWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedPopularWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedPopularWorksData.serializer,
        json,
      );
}

abstract class GFeedPopularWorksData_popularWorks
    implements
        Built<GFeedPopularWorksData_popularWorks,
            GFeedPopularWorksData_popularWorksBuilder>,
        _i2.GPartialFeedWorkFields {
  GFeedPopularWorksData_popularWorks._();

  factory GFeedPopularWorksData_popularWorks(
          [Function(GFeedPopularWorksData_popularWorksBuilder b) updates]) =
      _$GFeedPopularWorksData_popularWorks;

  static void _initializeBuilder(GFeedPopularWorksData_popularWorksBuilder b) =>
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
  double get imageAspectRatio;
  @override
  GFeedPopularWorksData_popularWorks_image? get image;
  GFeedPopularWorksData_popularWorks_user get user;
  GFeedPopularWorksData_popularWorks_viewer? get viewer;
  static Serializer<GFeedPopularWorksData_popularWorks> get serializer =>
      _$gFeedPopularWorksDataPopularWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedPopularWorksData_popularWorks.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedPopularWorksData_popularWorks? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedPopularWorksData_popularWorks.serializer,
        json,
      );
}

abstract class GFeedPopularWorksData_popularWorks_image
    implements
        Built<GFeedPopularWorksData_popularWorks_image,
            GFeedPopularWorksData_popularWorks_imageBuilder>,
        _i2.GPartialFeedWorkFields_image {
  GFeedPopularWorksData_popularWorks_image._();

  factory GFeedPopularWorksData_popularWorks_image(
      [Function(GFeedPopularWorksData_popularWorks_imageBuilder b)
          updates]) = _$GFeedPopularWorksData_popularWorks_image;

  static void _initializeBuilder(
          GFeedPopularWorksData_popularWorks_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFeedPopularWorksData_popularWorks_image> get serializer =>
      _$gFeedPopularWorksDataPopularWorksImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedPopularWorksData_popularWorks_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedPopularWorksData_popularWorks_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedPopularWorksData_popularWorks_image.serializer,
        json,
      );
}

abstract class GFeedPopularWorksData_popularWorks_user
    implements
        Built<GFeedPopularWorksData_popularWorks_user,
            GFeedPopularWorksData_popularWorks_userBuilder>,
        _i3.GPartialUserFields {
  GFeedPopularWorksData_popularWorks_user._();

  factory GFeedPopularWorksData_popularWorks_user(
      [Function(GFeedPopularWorksData_popularWorks_userBuilder b)
          updates]) = _$GFeedPopularWorksData_popularWorks_user;

  static void _initializeBuilder(
          GFeedPopularWorksData_popularWorks_userBuilder b) =>
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
  GFeedPopularWorksData_popularWorks_user_iconImage? get iconImage;
  GFeedPopularWorksData_popularWorks_user_viewer? get viewer;
  static Serializer<GFeedPopularWorksData_popularWorks_user> get serializer =>
      _$gFeedPopularWorksDataPopularWorksUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedPopularWorksData_popularWorks_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedPopularWorksData_popularWorks_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedPopularWorksData_popularWorks_user.serializer,
        json,
      );
}

abstract class GFeedPopularWorksData_popularWorks_user_iconImage
    implements
        Built<GFeedPopularWorksData_popularWorks_user_iconImage,
            GFeedPopularWorksData_popularWorks_user_iconImageBuilder>,
        _i3.GPartialUserFields_iconImage {
  GFeedPopularWorksData_popularWorks_user_iconImage._();

  factory GFeedPopularWorksData_popularWorks_user_iconImage(
      [Function(GFeedPopularWorksData_popularWorks_user_iconImageBuilder b)
          updates]) = _$GFeedPopularWorksData_popularWorks_user_iconImage;

  static void _initializeBuilder(
          GFeedPopularWorksData_popularWorks_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFeedPopularWorksData_popularWorks_user_iconImage>
      get serializer =>
          _$gFeedPopularWorksDataPopularWorksUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedPopularWorksData_popularWorks_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedPopularWorksData_popularWorks_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedPopularWorksData_popularWorks_user_iconImage.serializer,
        json,
      );
}

abstract class GFeedPopularWorksData_popularWorks_user_viewer
    implements
        Built<GFeedPopularWorksData_popularWorks_user_viewer,
            GFeedPopularWorksData_popularWorks_user_viewerBuilder> {
  GFeedPopularWorksData_popularWorks_user_viewer._();

  factory GFeedPopularWorksData_popularWorks_user_viewer(
      [Function(GFeedPopularWorksData_popularWorks_user_viewerBuilder b)
          updates]) = _$GFeedPopularWorksData_popularWorks_user_viewer;

  static void _initializeBuilder(
          GFeedPopularWorksData_popularWorks_user_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isFollower;
  bool get isFollowee;
  bool get isMuted;
  static Serializer<GFeedPopularWorksData_popularWorks_user_viewer>
      get serializer => _$gFeedPopularWorksDataPopularWorksUserViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedPopularWorksData_popularWorks_user_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedPopularWorksData_popularWorks_user_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedPopularWorksData_popularWorks_user_viewer.serializer,
        json,
      );
}

abstract class GFeedPopularWorksData_popularWorks_viewer
    implements
        Built<GFeedPopularWorksData_popularWorks_viewer,
            GFeedPopularWorksData_popularWorks_viewerBuilder> {
  GFeedPopularWorksData_popularWorks_viewer._();

  factory GFeedPopularWorksData_popularWorks_viewer(
      [Function(GFeedPopularWorksData_popularWorks_viewerBuilder b)
          updates]) = _$GFeedPopularWorksData_popularWorks_viewer;

  static void _initializeBuilder(
          GFeedPopularWorksData_popularWorks_viewerBuilder b) =>
      b..G__typename = 'WorkViewerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isLiked;
  bool get isBookmarked;
  static Serializer<GFeedPopularWorksData_popularWorks_viewer> get serializer =>
      _$gFeedPopularWorksDataPopularWorksViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedPopularWorksData_popularWorks_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedPopularWorksData_popularWorks_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedPopularWorksData_popularWorks_viewer.serializer,
        json,
      );
}
