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

part 'feed_latest_works.data.gql.g.dart';

abstract class GFeedLatestWorksData
    implements Built<GFeedLatestWorksData, GFeedLatestWorksDataBuilder> {
  GFeedLatestWorksData._();

  factory GFeedLatestWorksData(
          [Function(GFeedLatestWorksDataBuilder b) updates]) =
      _$GFeedLatestWorksData;

  static void _initializeBuilder(GFeedLatestWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GFeedLatestWorksData_works> get works;
  static Serializer<GFeedLatestWorksData> get serializer =>
      _$gFeedLatestWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedLatestWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedLatestWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedLatestWorksData.serializer,
        json,
      );
}

abstract class GFeedLatestWorksData_works
    implements
        Built<GFeedLatestWorksData_works, GFeedLatestWorksData_worksBuilder>,
        _i2.GPartialFeedWorkFields {
  GFeedLatestWorksData_works._();

  factory GFeedLatestWorksData_works(
          [Function(GFeedLatestWorksData_worksBuilder b) updates]) =
      _$GFeedLatestWorksData_works;

  static void _initializeBuilder(GFeedLatestWorksData_worksBuilder b) =>
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
  GFeedLatestWorksData_works_image? get image;
  GFeedLatestWorksData_works_user get user;
  GFeedLatestWorksData_works_viewer? get viewer;
  static Serializer<GFeedLatestWorksData_works> get serializer =>
      _$gFeedLatestWorksDataWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedLatestWorksData_works.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedLatestWorksData_works? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedLatestWorksData_works.serializer,
        json,
      );
}

abstract class GFeedLatestWorksData_works_image
    implements
        Built<GFeedLatestWorksData_works_image,
            GFeedLatestWorksData_works_imageBuilder>,
        _i2.GPartialFeedWorkFields_image {
  GFeedLatestWorksData_works_image._();

  factory GFeedLatestWorksData_works_image(
          [Function(GFeedLatestWorksData_works_imageBuilder b) updates]) =
      _$GFeedLatestWorksData_works_image;

  static void _initializeBuilder(GFeedLatestWorksData_works_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFeedLatestWorksData_works_image> get serializer =>
      _$gFeedLatestWorksDataWorksImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedLatestWorksData_works_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedLatestWorksData_works_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedLatestWorksData_works_image.serializer,
        json,
      );
}

abstract class GFeedLatestWorksData_works_user
    implements
        Built<GFeedLatestWorksData_works_user,
            GFeedLatestWorksData_works_userBuilder>,
        _i3.GPartialUserFields {
  GFeedLatestWorksData_works_user._();

  factory GFeedLatestWorksData_works_user(
          [Function(GFeedLatestWorksData_works_userBuilder b) updates]) =
      _$GFeedLatestWorksData_works_user;

  static void _initializeBuilder(GFeedLatestWorksData_works_userBuilder b) =>
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
  GFeedLatestWorksData_works_user_iconImage? get iconImage;
  GFeedLatestWorksData_works_user_viewer? get viewer;
  static Serializer<GFeedLatestWorksData_works_user> get serializer =>
      _$gFeedLatestWorksDataWorksUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedLatestWorksData_works_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedLatestWorksData_works_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedLatestWorksData_works_user.serializer,
        json,
      );
}

abstract class GFeedLatestWorksData_works_user_iconImage
    implements
        Built<GFeedLatestWorksData_works_user_iconImage,
            GFeedLatestWorksData_works_user_iconImageBuilder>,
        _i3.GPartialUserFields_iconImage {
  GFeedLatestWorksData_works_user_iconImage._();

  factory GFeedLatestWorksData_works_user_iconImage(
      [Function(GFeedLatestWorksData_works_user_iconImageBuilder b)
          updates]) = _$GFeedLatestWorksData_works_user_iconImage;

  static void _initializeBuilder(
          GFeedLatestWorksData_works_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFeedLatestWorksData_works_user_iconImage> get serializer =>
      _$gFeedLatestWorksDataWorksUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedLatestWorksData_works_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedLatestWorksData_works_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedLatestWorksData_works_user_iconImage.serializer,
        json,
      );
}

abstract class GFeedLatestWorksData_works_user_viewer
    implements
        Built<GFeedLatestWorksData_works_user_viewer,
            GFeedLatestWorksData_works_user_viewerBuilder> {
  GFeedLatestWorksData_works_user_viewer._();

  factory GFeedLatestWorksData_works_user_viewer(
          [Function(GFeedLatestWorksData_works_user_viewerBuilder b) updates]) =
      _$GFeedLatestWorksData_works_user_viewer;

  static void _initializeBuilder(
          GFeedLatestWorksData_works_user_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isFollower;
  bool get isFollowee;
  bool get isMuted;
  static Serializer<GFeedLatestWorksData_works_user_viewer> get serializer =>
      _$gFeedLatestWorksDataWorksUserViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedLatestWorksData_works_user_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedLatestWorksData_works_user_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedLatestWorksData_works_user_viewer.serializer,
        json,
      );
}

abstract class GFeedLatestWorksData_works_viewer
    implements
        Built<GFeedLatestWorksData_works_viewer,
            GFeedLatestWorksData_works_viewerBuilder> {
  GFeedLatestWorksData_works_viewer._();

  factory GFeedLatestWorksData_works_viewer(
          [Function(GFeedLatestWorksData_works_viewerBuilder b) updates]) =
      _$GFeedLatestWorksData_works_viewer;

  static void _initializeBuilder(GFeedLatestWorksData_works_viewerBuilder b) =>
      b..G__typename = 'WorkViewerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isLiked;
  bool get isBookmarked;
  static Serializer<GFeedLatestWorksData_works_viewer> get serializer =>
      _$gFeedLatestWorksDataWorksViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedLatestWorksData_works_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedLatestWorksData_works_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedLatestWorksData_works_viewer.serializer,
        json,
      );
}
