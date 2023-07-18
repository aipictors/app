// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/user_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.data.gql.g.dart';

abstract class GUserData implements Built<GUserData, GUserDataBuilder> {
  GUserData._();

  factory GUserData([Function(GUserDataBuilder b) updates]) = _$GUserData;

  static void _initializeBuilder(GUserDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserData_user? get user;
  static Serializer<GUserData> get serializer => _$gUserDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserData.serializer,
        json,
      );
}

abstract class GUserData_user
    implements Built<GUserData_user, GUserData_userBuilder>, _i2.GUserFields {
  GUserData_user._();

  factory GUserData_user([Function(GUserData_userBuilder b) updates]) =
      _$GUserData_user;

  static void _initializeBuilder(GUserData_userBuilder b) =>
      b..G__typename = 'UserNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String? get biography;
  @override
  String get login;
  @override
  String get name;
  @override
  int get receivedLikesCount;
  @override
  int get receivedViewsCount;
  @override
  int get awardsCount;
  @override
  int get followersCount;
  @override
  GUserData_user_iconImage? get iconImage;
  @override
  GUserData_user_headerImage? get headerImage;
  GUserData_user_viewer? get viewer;
  static Serializer<GUserData_user> get serializer => _$gUserDataUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserData_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserData_user.serializer,
        json,
      );
}

abstract class GUserData_user_iconImage
    implements
        Built<GUserData_user_iconImage, GUserData_user_iconImageBuilder>,
        _i2.GUserFields_iconImage {
  GUserData_user_iconImage._();

  factory GUserData_user_iconImage(
          [Function(GUserData_user_iconImageBuilder b) updates]) =
      _$GUserData_user_iconImage;

  static void _initializeBuilder(GUserData_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserData_user_iconImage> get serializer =>
      _$gUserDataUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserData_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserData_user_iconImage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserData_user_iconImage.serializer,
        json,
      );
}

abstract class GUserData_user_headerImage
    implements
        Built<GUserData_user_headerImage, GUserData_user_headerImageBuilder>,
        _i2.GUserFields_headerImage {
  GUserData_user_headerImage._();

  factory GUserData_user_headerImage(
          [Function(GUserData_user_headerImageBuilder b) updates]) =
      _$GUserData_user_headerImage;

  static void _initializeBuilder(GUserData_user_headerImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserData_user_headerImage> get serializer =>
      _$gUserDataUserHeaderImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserData_user_headerImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserData_user_headerImage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserData_user_headerImage.serializer,
        json,
      );
}

abstract class GUserData_user_viewer
    implements Built<GUserData_user_viewer, GUserData_user_viewerBuilder> {
  GUserData_user_viewer._();

  factory GUserData_user_viewer(
          [Function(GUserData_user_viewerBuilder b) updates]) =
      _$GUserData_user_viewer;

  static void _initializeBuilder(GUserData_user_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isFollower;
  bool get isFollowee;
  static Serializer<GUserData_user_viewer> get serializer =>
      _$gUserDataUserViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserData_user_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserData_user_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserData_user_viewer.serializer,
        json,
      );
}
