// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i3;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed_daily_theme_works.data.gql.g.dart';

abstract class GDailyThemeData
    implements Built<GDailyThemeData, GDailyThemeDataBuilder> {
  GDailyThemeData._();

  factory GDailyThemeData([Function(GDailyThemeDataBuilder b) updates]) =
      _$GDailyThemeData;

  static void _initializeBuilder(GDailyThemeDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDailyThemeData_dailyTheme? get dailyTheme;
  static Serializer<GDailyThemeData> get serializer =>
      _$gDailyThemeDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemeData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemeData.serializer,
        json,
      );
}

abstract class GDailyThemeData_dailyTheme
    implements
        Built<GDailyThemeData_dailyTheme, GDailyThemeData_dailyThemeBuilder> {
  GDailyThemeData_dailyTheme._();

  factory GDailyThemeData_dailyTheme(
          [Function(GDailyThemeData_dailyThemeBuilder b) updates]) =
      _$GDailyThemeData_dailyTheme;

  static void _initializeBuilder(GDailyThemeData_dailyThemeBuilder b) =>
      b..G__typename = 'DailyThemeNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  BuiltList<GDailyThemeData_dailyTheme_works> get works;
  static Serializer<GDailyThemeData_dailyTheme> get serializer =>
      _$gDailyThemeDataDailyThemeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemeData_dailyTheme.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemeData_dailyTheme? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemeData_dailyTheme.serializer,
        json,
      );
}

abstract class GDailyThemeData_dailyTheme_works
    implements
        Built<GDailyThemeData_dailyTheme_works,
            GDailyThemeData_dailyTheme_worksBuilder>,
        _i2.GPartialWorkFields {
  GDailyThemeData_dailyTheme_works._();

  factory GDailyThemeData_dailyTheme_works(
          [Function(GDailyThemeData_dailyTheme_worksBuilder b) updates]) =
      _$GDailyThemeData_dailyTheme_works;

  static void _initializeBuilder(GDailyThemeData_dailyTheme_worksBuilder b) =>
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
  GDailyThemeData_dailyTheme_works_thumbnailImage? get thumbnailImage;
  GDailyThemeData_dailyTheme_works_user get user;
  GDailyThemeData_dailyTheme_works_viewer get viewer;
  static Serializer<GDailyThemeData_dailyTheme_works> get serializer =>
      _$gDailyThemeDataDailyThemeWorksSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemeData_dailyTheme_works.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemeData_dailyTheme_works? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemeData_dailyTheme_works.serializer,
        json,
      );
}

abstract class GDailyThemeData_dailyTheme_works_thumbnailImage
    implements
        Built<GDailyThemeData_dailyTheme_works_thumbnailImage,
            GDailyThemeData_dailyTheme_works_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GDailyThemeData_dailyTheme_works_thumbnailImage._();

  factory GDailyThemeData_dailyTheme_works_thumbnailImage(
      [Function(GDailyThemeData_dailyTheme_works_thumbnailImageBuilder b)
          updates]) = _$GDailyThemeData_dailyTheme_works_thumbnailImage;

  static void _initializeBuilder(
          GDailyThemeData_dailyTheme_works_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GDailyThemeData_dailyTheme_works_thumbnailImage>
      get serializer =>
          _$gDailyThemeDataDailyThemeWorksThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemeData_dailyTheme_works_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemeData_dailyTheme_works_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemeData_dailyTheme_works_thumbnailImage.serializer,
        json,
      );
}

abstract class GDailyThemeData_dailyTheme_works_user
    implements
        Built<GDailyThemeData_dailyTheme_works_user,
            GDailyThemeData_dailyTheme_works_userBuilder>,
        _i3.GPartialUserFields {
  GDailyThemeData_dailyTheme_works_user._();

  factory GDailyThemeData_dailyTheme_works_user(
          [Function(GDailyThemeData_dailyTheme_works_userBuilder b) updates]) =
      _$GDailyThemeData_dailyTheme_works_user;

  static void _initializeBuilder(
          GDailyThemeData_dailyTheme_works_userBuilder b) =>
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
  GDailyThemeData_dailyTheme_works_user_iconImage? get iconImage;
  static Serializer<GDailyThemeData_dailyTheme_works_user> get serializer =>
      _$gDailyThemeDataDailyThemeWorksUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemeData_dailyTheme_works_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemeData_dailyTheme_works_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemeData_dailyTheme_works_user.serializer,
        json,
      );
}

abstract class GDailyThemeData_dailyTheme_works_user_iconImage
    implements
        Built<GDailyThemeData_dailyTheme_works_user_iconImage,
            GDailyThemeData_dailyTheme_works_user_iconImageBuilder>,
        _i3.GPartialUserFields_iconImage {
  GDailyThemeData_dailyTheme_works_user_iconImage._();

  factory GDailyThemeData_dailyTheme_works_user_iconImage(
      [Function(GDailyThemeData_dailyTheme_works_user_iconImageBuilder b)
          updates]) = _$GDailyThemeData_dailyTheme_works_user_iconImage;

  static void _initializeBuilder(
          GDailyThemeData_dailyTheme_works_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GDailyThemeData_dailyTheme_works_user_iconImage>
      get serializer => _$gDailyThemeDataDailyThemeWorksUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemeData_dailyTheme_works_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemeData_dailyTheme_works_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemeData_dailyTheme_works_user_iconImage.serializer,
        json,
      );
}

abstract class GDailyThemeData_dailyTheme_works_viewer
    implements
        Built<GDailyThemeData_dailyTheme_works_viewer,
            GDailyThemeData_dailyTheme_works_viewerBuilder> {
  GDailyThemeData_dailyTheme_works_viewer._();

  factory GDailyThemeData_dailyTheme_works_viewer(
      [Function(GDailyThemeData_dailyTheme_works_viewerBuilder b)
          updates]) = _$GDailyThemeData_dailyTheme_works_viewer;

  static void _initializeBuilder(
          GDailyThemeData_dailyTheme_works_viewerBuilder b) =>
      b..G__typename = 'WorkViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isLiked;
  bool get isBookmarked;
  static Serializer<GDailyThemeData_dailyTheme_works_viewer> get serializer =>
      _$gDailyThemeDataDailyThemeWorksViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemeData_dailyTheme_works_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemeData_dailyTheme_works_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemeData_dailyTheme_works_viewer.serializer,
        json,
      );
}
