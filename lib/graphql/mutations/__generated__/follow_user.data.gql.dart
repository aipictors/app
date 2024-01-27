// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'follow_user.data.gql.g.dart';

abstract class GFollowUserData
    implements Built<GFollowUserData, GFollowUserDataBuilder> {
  GFollowUserData._();

  factory GFollowUserData([Function(GFollowUserDataBuilder b) updates]) =
      _$GFollowUserData;

  static void _initializeBuilder(GFollowUserDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFollowUserData_followUser get followUser;
  static Serializer<GFollowUserData> get serializer =>
      _$gFollowUserDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowUserData.serializer,
        json,
      );
}

abstract class GFollowUserData_followUser
    implements
        Built<GFollowUserData_followUser, GFollowUserData_followUserBuilder> {
  GFollowUserData_followUser._();

  factory GFollowUserData_followUser(
          [Function(GFollowUserData_followUserBuilder b) updates]) =
      _$GFollowUserData_followUser;

  static void _initializeBuilder(GFollowUserData_followUserBuilder b) =>
      b..G__typename = 'UserNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  GFollowUserData_followUser_viewer? get viewer;
  static Serializer<GFollowUserData_followUser> get serializer =>
      _$gFollowUserDataFollowUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowUserData_followUser.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowUserData_followUser? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowUserData_followUser.serializer,
        json,
      );
}

abstract class GFollowUserData_followUser_viewer
    implements
        Built<GFollowUserData_followUser_viewer,
            GFollowUserData_followUser_viewerBuilder> {
  GFollowUserData_followUser_viewer._();

  factory GFollowUserData_followUser_viewer(
          [Function(GFollowUserData_followUser_viewerBuilder b) updates]) =
      _$GFollowUserData_followUser_viewer;

  static void _initializeBuilder(GFollowUserData_followUser_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isFollowee;
  static Serializer<GFollowUserData_followUser_viewer> get serializer =>
      _$gFollowUserDataFollowUserViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowUserData_followUser_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowUserData_followUser_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowUserData_followUser_viewer.serializer,
        json,
      );
}
