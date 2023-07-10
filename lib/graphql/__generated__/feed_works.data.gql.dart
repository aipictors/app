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

part 'feed_works.data.gql.g.dart';

abstract class GFeedWorksData
    implements Built<GFeedWorksData, GFeedWorksDataBuilder> {
  GFeedWorksData._();

  factory GFeedWorksData([Function(GFeedWorksDataBuilder b) updates]) =
      _$GFeedWorksData;

  static void _initializeBuilder(GFeedWorksDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GFeedWorksData_works>? get works;
  static Serializer<GFeedWorksData> get serializer =>
      _$gFeedWorksDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedWorksData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedWorksData.serializer,
        json,
      );
}

abstract class GFeedWorksData_works
    implements
        Built<GFeedWorksData_works, GFeedWorksData_worksBuilder>,
        _i2.GPartialWorkFields {
  GFeedWorksData_works._();

  factory GFeedWorksData_works(
          [Function(GFeedWorksData_worksBuilder b) updates]) =
      _$GFeedWorksData_works;

  static void _initializeBuilder(GFeedWorksData_worksBuilder b) =>
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
  GFeedWorksData_works_thumbnailImage? get thumbnailImage;
  GFeedWorksData_works_user get user;
  GFeedWorksData_works_viewer get viewer;
  static Serializer<GFeedWorksData_works> get serializer =>
      _$gFeedWorksDataWorksSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedWorksData_works.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedWorksData_works? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedWorksData_works.serializer,
        json,
      );
}

abstract class GFeedWorksData_works_thumbnailImage
    implements
        Built<GFeedWorksData_works_thumbnailImage,
            GFeedWorksData_works_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GFeedWorksData_works_thumbnailImage._();

  factory GFeedWorksData_works_thumbnailImage(
          [Function(GFeedWorksData_works_thumbnailImageBuilder b) updates]) =
      _$GFeedWorksData_works_thumbnailImage;

  static void _initializeBuilder(
          GFeedWorksData_works_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFeedWorksData_works_thumbnailImage> get serializer =>
      _$gFeedWorksDataWorksThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedWorksData_works_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedWorksData_works_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedWorksData_works_thumbnailImage.serializer,
        json,
      );
}

abstract class GFeedWorksData_works_user
    implements
        Built<GFeedWorksData_works_user, GFeedWorksData_works_userBuilder>,
        _i3.GPartialUserFields {
  GFeedWorksData_works_user._();

  factory GFeedWorksData_works_user(
          [Function(GFeedWorksData_works_userBuilder b) updates]) =
      _$GFeedWorksData_works_user;

  static void _initializeBuilder(GFeedWorksData_works_userBuilder b) =>
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
  GFeedWorksData_works_user_iconImage? get iconImage;
  static Serializer<GFeedWorksData_works_user> get serializer =>
      _$gFeedWorksDataWorksUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedWorksData_works_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedWorksData_works_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedWorksData_works_user.serializer,
        json,
      );
}

abstract class GFeedWorksData_works_user_iconImage
    implements
        Built<GFeedWorksData_works_user_iconImage,
            GFeedWorksData_works_user_iconImageBuilder>,
        _i3.GPartialUserFields_iconImage {
  GFeedWorksData_works_user_iconImage._();

  factory GFeedWorksData_works_user_iconImage(
          [Function(GFeedWorksData_works_user_iconImageBuilder b) updates]) =
      _$GFeedWorksData_works_user_iconImage;

  static void _initializeBuilder(
          GFeedWorksData_works_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFeedWorksData_works_user_iconImage> get serializer =>
      _$gFeedWorksDataWorksUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedWorksData_works_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedWorksData_works_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedWorksData_works_user_iconImage.serializer,
        json,
      );
}

abstract class GFeedWorksData_works_viewer
    implements
        Built<GFeedWorksData_works_viewer, GFeedWorksData_works_viewerBuilder> {
  GFeedWorksData_works_viewer._();

  factory GFeedWorksData_works_viewer(
          [Function(GFeedWorksData_works_viewerBuilder b) updates]) =
      _$GFeedWorksData_works_viewer;

  static void _initializeBuilder(GFeedWorksData_works_viewerBuilder b) =>
      b..G__typename = 'WorkViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isLiked;
  bool get isBookmarked;
  static Serializer<GFeedWorksData_works_viewer> get serializer =>
      _$gFeedWorksDataWorksViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedWorksData_works_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFeedWorksData_works_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedWorksData_works_viewer.serializer,
        json,
      );
}
