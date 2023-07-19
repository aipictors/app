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

part 'feed_daily_theme_works.data.gql.g.dart';

abstract class GFeedDailyThemeWorksData
    implements
        Built<GFeedDailyThemeWorksData, GFeedDailyThemeWorksDataBuilder> {
  GFeedDailyThemeWorksData._();

  factory GFeedDailyThemeWorksData(
          [Function(GFeedDailyThemeWorksDataBuilder b) updates]) =
      _$GFeedDailyThemeWorksData;

  static void _initializeBuilder(GFeedDailyThemeWorksDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFeedDailyThemeWorksData_dailyTheme? get dailyTheme;
  static Serializer<GFeedDailyThemeWorksData> get serializer =>
      _$gFeedDailyThemeWorksDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedDailyThemeWorksData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedDailyThemeWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedDailyThemeWorksData.serializer,
        json,
      );
}

abstract class GFeedDailyThemeWorksData_dailyTheme
    implements
        Built<GFeedDailyThemeWorksData_dailyTheme,
            GFeedDailyThemeWorksData_dailyThemeBuilder> {
  GFeedDailyThemeWorksData_dailyTheme._();

  factory GFeedDailyThemeWorksData_dailyTheme(
          [Function(GFeedDailyThemeWorksData_dailyThemeBuilder b) updates]) =
      _$GFeedDailyThemeWorksData_dailyTheme;

  static void _initializeBuilder(
          GFeedDailyThemeWorksData_dailyThemeBuilder b) =>
      b..G__typename = 'DailyThemeNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  BuiltList<GFeedDailyThemeWorksData_dailyTheme_works> get works;
  static Serializer<GFeedDailyThemeWorksData_dailyTheme> get serializer =>
      _$gFeedDailyThemeWorksDataDailyThemeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedDailyThemeWorksData_dailyTheme.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedDailyThemeWorksData_dailyTheme? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedDailyThemeWorksData_dailyTheme.serializer,
        json,
      );
}

abstract class GFeedDailyThemeWorksData_dailyTheme_works
    implements
        Built<GFeedDailyThemeWorksData_dailyTheme_works,
            GFeedDailyThemeWorksData_dailyTheme_worksBuilder>,
        _i2.GPartialFeedWorkFields {
  GFeedDailyThemeWorksData_dailyTheme_works._();

  factory GFeedDailyThemeWorksData_dailyTheme_works(
      [Function(GFeedDailyThemeWorksData_dailyTheme_worksBuilder b)
          updates]) = _$GFeedDailyThemeWorksData_dailyTheme_works;

  static void _initializeBuilder(
          GFeedDailyThemeWorksData_dailyTheme_worksBuilder b) =>
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
  GFeedDailyThemeWorksData_dailyTheme_works_image? get image;
  GFeedDailyThemeWorksData_dailyTheme_works_user get user;
  GFeedDailyThemeWorksData_dailyTheme_works_viewer? get viewer;
  static Serializer<GFeedDailyThemeWorksData_dailyTheme_works> get serializer =>
      _$gFeedDailyThemeWorksDataDailyThemeWorksSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedDailyThemeWorksData_dailyTheme_works? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works.serializer,
        json,
      );
}

abstract class GFeedDailyThemeWorksData_dailyTheme_works_image
    implements
        Built<GFeedDailyThemeWorksData_dailyTheme_works_image,
            GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder>,
        _i2.GPartialFeedWorkFields_image {
  GFeedDailyThemeWorksData_dailyTheme_works_image._();

  factory GFeedDailyThemeWorksData_dailyTheme_works_image(
      [Function(GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder b)
          updates]) = _$GFeedDailyThemeWorksData_dailyTheme_works_image;

  static void _initializeBuilder(
          GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFeedDailyThemeWorksData_dailyTheme_works_image>
      get serializer =>
          _$gFeedDailyThemeWorksDataDailyThemeWorksImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedDailyThemeWorksData_dailyTheme_works_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_image.serializer,
        json,
      );
}

abstract class GFeedDailyThemeWorksData_dailyTheme_works_user
    implements
        Built<GFeedDailyThemeWorksData_dailyTheme_works_user,
            GFeedDailyThemeWorksData_dailyTheme_works_userBuilder>,
        _i3.GPartialUserFields {
  GFeedDailyThemeWorksData_dailyTheme_works_user._();

  factory GFeedDailyThemeWorksData_dailyTheme_works_user(
      [Function(GFeedDailyThemeWorksData_dailyTheme_works_userBuilder b)
          updates]) = _$GFeedDailyThemeWorksData_dailyTheme_works_user;

  static void _initializeBuilder(
          GFeedDailyThemeWorksData_dailyTheme_works_userBuilder b) =>
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
  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage? get iconImage;
  GFeedDailyThemeWorksData_dailyTheme_works_user_viewer? get viewer;
  static Serializer<GFeedDailyThemeWorksData_dailyTheme_works_user>
      get serializer => _$gFeedDailyThemeWorksDataDailyThemeWorksUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedDailyThemeWorksData_dailyTheme_works_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_user.serializer,
        json,
      );
}

abstract class GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage
    implements
        Built<GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage,
            GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder>,
        _i3.GPartialUserFields_iconImage {
  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage._();

  factory GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage(
      [Function(
              GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder b)
          updates]) = _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage;

  static void _initializeBuilder(
          GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage>
      get serializer =>
          _$gFeedDailyThemeWorksDataDailyThemeWorksUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage.serializer,
        json,
      );
}

abstract class GFeedDailyThemeWorksData_dailyTheme_works_user_viewer
    implements
        Built<GFeedDailyThemeWorksData_dailyTheme_works_user_viewer,
            GFeedDailyThemeWorksData_dailyTheme_works_user_viewerBuilder> {
  GFeedDailyThemeWorksData_dailyTheme_works_user_viewer._();

  factory GFeedDailyThemeWorksData_dailyTheme_works_user_viewer(
      [Function(GFeedDailyThemeWorksData_dailyTheme_works_user_viewerBuilder b)
          updates]) = _$GFeedDailyThemeWorksData_dailyTheme_works_user_viewer;

  static void _initializeBuilder(
          GFeedDailyThemeWorksData_dailyTheme_works_user_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isFollower;
  bool get isFollowee;
  bool get isMuted;
  static Serializer<GFeedDailyThemeWorksData_dailyTheme_works_user_viewer>
      get serializer =>
          _$gFeedDailyThemeWorksDataDailyThemeWorksUserViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_user_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedDailyThemeWorksData_dailyTheme_works_user_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_user_viewer.serializer,
        json,
      );
}

abstract class GFeedDailyThemeWorksData_dailyTheme_works_viewer
    implements
        Built<GFeedDailyThemeWorksData_dailyTheme_works_viewer,
            GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder> {
  GFeedDailyThemeWorksData_dailyTheme_works_viewer._();

  factory GFeedDailyThemeWorksData_dailyTheme_works_viewer(
      [Function(GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder b)
          updates]) = _$GFeedDailyThemeWorksData_dailyTheme_works_viewer;

  static void _initializeBuilder(
          GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder b) =>
      b..G__typename = 'WorkViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isLiked;
  bool get isBookmarked;
  static Serializer<GFeedDailyThemeWorksData_dailyTheme_works_viewer>
      get serializer =>
          _$gFeedDailyThemeWorksDataDailyThemeWorksViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedDailyThemeWorksData_dailyTheme_works_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedDailyThemeWorksData_dailyTheme_works_viewer.serializer,
        json,
      );
}
