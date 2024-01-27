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

part 'viewer_feed_works.data.gql.g.dart';

abstract class GViewerFeedWorksData
    implements Built<GViewerFeedWorksData, GViewerFeedWorksDataBuilder> {
  GViewerFeedWorksData._();

  factory GViewerFeedWorksData(
          [Function(GViewerFeedWorksDataBuilder b) updates]) =
      _$GViewerFeedWorksData;

  static void _initializeBuilder(GViewerFeedWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerFeedWorksData_viewer? get viewer;
  static Serializer<GViewerFeedWorksData> get serializer =>
      _$gViewerFeedWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFeedWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFeedWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFeedWorksData.serializer,
        json,
      );
}

abstract class GViewerFeedWorksData_viewer
    implements
        Built<GViewerFeedWorksData_viewer, GViewerFeedWorksData_viewerBuilder> {
  GViewerFeedWorksData_viewer._();

  factory GViewerFeedWorksData_viewer(
          [Function(GViewerFeedWorksData_viewerBuilder b) updates]) =
      _$GViewerFeedWorksData_viewer;

  static void _initializeBuilder(GViewerFeedWorksData_viewerBuilder b) =>
      b..G__typename = 'Viewer';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GViewerFeedWorksData_viewer_feedWorks> get feedWorks;
  static Serializer<GViewerFeedWorksData_viewer> get serializer =>
      _$gViewerFeedWorksDataViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFeedWorksData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFeedWorksData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFeedWorksData_viewer.serializer,
        json,
      );
}

abstract class GViewerFeedWorksData_viewer_feedWorks
    implements
        Built<GViewerFeedWorksData_viewer_feedWorks,
            GViewerFeedWorksData_viewer_feedWorksBuilder>,
        _i2.GPartialFeedWorkFields {
  GViewerFeedWorksData_viewer_feedWorks._();

  factory GViewerFeedWorksData_viewer_feedWorks(
          [Function(GViewerFeedWorksData_viewer_feedWorksBuilder b) updates]) =
      _$GViewerFeedWorksData_viewer_feedWorks;

  static void _initializeBuilder(
          GViewerFeedWorksData_viewer_feedWorksBuilder b) =>
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
  GViewerFeedWorksData_viewer_feedWorks_image? get image;
  GViewerFeedWorksData_viewer_feedWorks_user get user;
  GViewerFeedWorksData_viewer_feedWorks_viewer? get viewer;
  static Serializer<GViewerFeedWorksData_viewer_feedWorks> get serializer =>
      _$gViewerFeedWorksDataViewerFeedWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFeedWorksData_viewer_feedWorks.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFeedWorksData_viewer_feedWorks? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFeedWorksData_viewer_feedWorks.serializer,
        json,
      );
}

abstract class GViewerFeedWorksData_viewer_feedWorks_image
    implements
        Built<GViewerFeedWorksData_viewer_feedWorks_image,
            GViewerFeedWorksData_viewer_feedWorks_imageBuilder>,
        _i2.GPartialFeedWorkFields_image {
  GViewerFeedWorksData_viewer_feedWorks_image._();

  factory GViewerFeedWorksData_viewer_feedWorks_image(
      [Function(GViewerFeedWorksData_viewer_feedWorks_imageBuilder b)
          updates]) = _$GViewerFeedWorksData_viewer_feedWorks_image;

  static void _initializeBuilder(
          GViewerFeedWorksData_viewer_feedWorks_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GViewerFeedWorksData_viewer_feedWorks_image>
      get serializer => _$gViewerFeedWorksDataViewerFeedWorksImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFeedWorksData_viewer_feedWorks_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFeedWorksData_viewer_feedWorks_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFeedWorksData_viewer_feedWorks_image.serializer,
        json,
      );
}

abstract class GViewerFeedWorksData_viewer_feedWorks_user
    implements
        Built<GViewerFeedWorksData_viewer_feedWorks_user,
            GViewerFeedWorksData_viewer_feedWorks_userBuilder>,
        _i3.GPartialUserFields {
  GViewerFeedWorksData_viewer_feedWorks_user._();

  factory GViewerFeedWorksData_viewer_feedWorks_user(
      [Function(GViewerFeedWorksData_viewer_feedWorks_userBuilder b)
          updates]) = _$GViewerFeedWorksData_viewer_feedWorks_user;

  static void _initializeBuilder(
          GViewerFeedWorksData_viewer_feedWorks_userBuilder b) =>
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
  GViewerFeedWorksData_viewer_feedWorks_user_iconImage? get iconImage;
  GViewerFeedWorksData_viewer_feedWorks_user_viewer? get viewer;
  static Serializer<GViewerFeedWorksData_viewer_feedWorks_user>
      get serializer => _$gViewerFeedWorksDataViewerFeedWorksUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFeedWorksData_viewer_feedWorks_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFeedWorksData_viewer_feedWorks_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFeedWorksData_viewer_feedWorks_user.serializer,
        json,
      );
}

abstract class GViewerFeedWorksData_viewer_feedWorks_user_iconImage
    implements
        Built<GViewerFeedWorksData_viewer_feedWorks_user_iconImage,
            GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder>,
        _i3.GPartialUserFields_iconImage {
  GViewerFeedWorksData_viewer_feedWorks_user_iconImage._();

  factory GViewerFeedWorksData_viewer_feedWorks_user_iconImage(
      [Function(GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder b)
          updates]) = _$GViewerFeedWorksData_viewer_feedWorks_user_iconImage;

  static void _initializeBuilder(
          GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GViewerFeedWorksData_viewer_feedWorks_user_iconImage>
      get serializer =>
          _$gViewerFeedWorksDataViewerFeedWorksUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFeedWorksData_viewer_feedWorks_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFeedWorksData_viewer_feedWorks_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFeedWorksData_viewer_feedWorks_user_iconImage.serializer,
        json,
      );
}

abstract class GViewerFeedWorksData_viewer_feedWorks_user_viewer
    implements
        Built<GViewerFeedWorksData_viewer_feedWorks_user_viewer,
            GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder> {
  GViewerFeedWorksData_viewer_feedWorks_user_viewer._();

  factory GViewerFeedWorksData_viewer_feedWorks_user_viewer(
      [Function(GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder b)
          updates]) = _$GViewerFeedWorksData_viewer_feedWorks_user_viewer;

  static void _initializeBuilder(
          GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isFollower;
  bool get isFollowee;
  bool get isMuted;
  static Serializer<GViewerFeedWorksData_viewer_feedWorks_user_viewer>
      get serializer =>
          _$gViewerFeedWorksDataViewerFeedWorksUserViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFeedWorksData_viewer_feedWorks_user_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFeedWorksData_viewer_feedWorks_user_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFeedWorksData_viewer_feedWorks_user_viewer.serializer,
        json,
      );
}

abstract class GViewerFeedWorksData_viewer_feedWorks_viewer
    implements
        Built<GViewerFeedWorksData_viewer_feedWorks_viewer,
            GViewerFeedWorksData_viewer_feedWorks_viewerBuilder> {
  GViewerFeedWorksData_viewer_feedWorks_viewer._();

  factory GViewerFeedWorksData_viewer_feedWorks_viewer(
      [Function(GViewerFeedWorksData_viewer_feedWorks_viewerBuilder b)
          updates]) = _$GViewerFeedWorksData_viewer_feedWorks_viewer;

  static void _initializeBuilder(
          GViewerFeedWorksData_viewer_feedWorks_viewerBuilder b) =>
      b..G__typename = 'WorkViewerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isLiked;
  bool get isBookmarked;
  static Serializer<GViewerFeedWorksData_viewer_feedWorks_viewer>
      get serializer => _$gViewerFeedWorksDataViewerFeedWorksViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFeedWorksData_viewer_feedWorks_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFeedWorksData_viewer_feedWorks_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFeedWorksData_viewer_feedWorks_viewer.serializer,
        json,
      );
}
