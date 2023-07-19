// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work.data.gql.g.dart';

abstract class GWorkData implements Built<GWorkData, GWorkDataBuilder> {
  GWorkData._();

  factory GWorkData([Function(GWorkDataBuilder b) updates]) = _$GWorkData;

  static void _initializeBuilder(GWorkDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GWorkData_work? get work;
  static Serializer<GWorkData> get serializer => _$gWorkDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkData.serializer,
        json,
      );
}

abstract class GWorkData_work
    implements Built<GWorkData_work, GWorkData_workBuilder> {
  GWorkData_work._();

  factory GWorkData_work([Function(GWorkData_workBuilder b) updates]) =
      _$GWorkData_work;

  static void _initializeBuilder(GWorkData_workBuilder b) =>
      b..G__typename = 'WorkNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  String? get description;
  GWorkData_work_image? get image;
  GWorkData_work_user get user;
  BuiltList<String> get tagNames;
  int get createdAt;
  int get likesCount;
  int get viewsCount;
  GWorkData_work_viewer? get viewer;
  static Serializer<GWorkData_work> get serializer => _$gWorkDataWorkSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkData_work.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkData_work? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkData_work.serializer,
        json,
      );
}

abstract class GWorkData_work_image
    implements Built<GWorkData_work_image, GWorkData_work_imageBuilder> {
  GWorkData_work_image._();

  factory GWorkData_work_image(
          [Function(GWorkData_work_imageBuilder b) updates]) =
      _$GWorkData_work_image;

  static void _initializeBuilder(GWorkData_work_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get downloadURL;
  static Serializer<GWorkData_work_image> get serializer =>
      _$gWorkDataWorkImageSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkData_work_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkData_work_image? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkData_work_image.serializer,
        json,
      );
}

abstract class GWorkData_work_user
    implements
        Built<GWorkData_work_user, GWorkData_work_userBuilder>,
        _i2.GWorkUserFields {
  GWorkData_work_user._();

  factory GWorkData_work_user(
      [Function(GWorkData_work_userBuilder b) updates]) = _$GWorkData_work_user;

  static void _initializeBuilder(GWorkData_work_userBuilder b) =>
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
  GWorkData_work_user_iconImage? get iconImage;
  GWorkData_work_user_viewer? get viewer;
  static Serializer<GWorkData_work_user> get serializer =>
      _$gWorkDataWorkUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkData_work_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkData_work_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkData_work_user.serializer,
        json,
      );
}

abstract class GWorkData_work_user_iconImage
    implements
        Built<GWorkData_work_user_iconImage,
            GWorkData_work_user_iconImageBuilder>,
        _i2.GWorkUserFields_iconImage {
  GWorkData_work_user_iconImage._();

  factory GWorkData_work_user_iconImage(
          [Function(GWorkData_work_user_iconImageBuilder b) updates]) =
      _$GWorkData_work_user_iconImage;

  static void _initializeBuilder(GWorkData_work_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkData_work_user_iconImage> get serializer =>
      _$gWorkDataWorkUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkData_work_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkData_work_user_iconImage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkData_work_user_iconImage.serializer,
        json,
      );
}

abstract class GWorkData_work_user_viewer
    implements
        Built<GWorkData_work_user_viewer, GWorkData_work_user_viewerBuilder> {
  GWorkData_work_user_viewer._();

  factory GWorkData_work_user_viewer(
          [Function(GWorkData_work_user_viewerBuilder b) updates]) =
      _$GWorkData_work_user_viewer;

  static void _initializeBuilder(GWorkData_work_user_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isFollower;
  bool get isFollowee;
  bool get isMuted;
  static Serializer<GWorkData_work_user_viewer> get serializer =>
      _$gWorkDataWorkUserViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkData_work_user_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkData_work_user_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkData_work_user_viewer.serializer,
        json,
      );
}

abstract class GWorkData_work_viewer
    implements Built<GWorkData_work_viewer, GWorkData_work_viewerBuilder> {
  GWorkData_work_viewer._();

  factory GWorkData_work_viewer(
          [Function(GWorkData_work_viewerBuilder b) updates]) =
      _$GWorkData_work_viewer;

  static void _initializeBuilder(GWorkData_work_viewerBuilder b) =>
      b..G__typename = 'WorkViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isLiked;
  bool get isBookmarked;
  static Serializer<GWorkData_work_viewer> get serializer =>
      _$gWorkDataWorkViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkData_work_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkData_work_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkData_work_viewer.serializer,
        json,
      );
}
