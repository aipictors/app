// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_followers.data.gql.g.dart';

abstract class GUserFollowersData
    implements Built<GUserFollowersData, GUserFollowersDataBuilder> {
  GUserFollowersData._();

  factory GUserFollowersData([Function(GUserFollowersDataBuilder b) updates]) =
      _$GUserFollowersData;

  static void _initializeBuilder(GUserFollowersDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserFollowersData_user? get user;
  static Serializer<GUserFollowersData> get serializer =>
      _$gUserFollowersDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFollowersData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFollowersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFollowersData.serializer,
        json,
      );
}

abstract class GUserFollowersData_user
    implements Built<GUserFollowersData_user, GUserFollowersData_userBuilder> {
  GUserFollowersData_user._();

  factory GUserFollowersData_user(
          [Function(GUserFollowersData_userBuilder b) updates]) =
      _$GUserFollowersData_user;

  static void _initializeBuilder(GUserFollowersData_userBuilder b) =>
      b..G__typename = 'UserNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GUserFollowersData_user_followers> get followers;
  static Serializer<GUserFollowersData_user> get serializer =>
      _$gUserFollowersDataUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFollowersData_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFollowersData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFollowersData_user.serializer,
        json,
      );
}

abstract class GUserFollowersData_user_followers
    implements
        Built<GUserFollowersData_user_followers,
            GUserFollowersData_user_followersBuilder>,
        _i2.GPartialUserFields {
  GUserFollowersData_user_followers._();

  factory GUserFollowersData_user_followers(
          [Function(GUserFollowersData_user_followersBuilder b) updates]) =
      _$GUserFollowersData_user_followers;

  static void _initializeBuilder(GUserFollowersData_user_followersBuilder b) =>
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
  GUserFollowersData_user_followers_iconImage? get iconImage;
  static Serializer<GUserFollowersData_user_followers> get serializer =>
      _$gUserFollowersDataUserFollowersSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFollowersData_user_followers.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFollowersData_user_followers? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFollowersData_user_followers.serializer,
        json,
      );
}

abstract class GUserFollowersData_user_followers_iconImage
    implements
        Built<GUserFollowersData_user_followers_iconImage,
            GUserFollowersData_user_followers_iconImageBuilder>,
        _i2.GPartialUserFields_iconImage {
  GUserFollowersData_user_followers_iconImage._();

  factory GUserFollowersData_user_followers_iconImage(
      [Function(GUserFollowersData_user_followers_iconImageBuilder b)
          updates]) = _$GUserFollowersData_user_followers_iconImage;

  static void _initializeBuilder(
          GUserFollowersData_user_followers_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserFollowersData_user_followers_iconImage>
      get serializer => _$gUserFollowersDataUserFollowersIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFollowersData_user_followers_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFollowersData_user_followers_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFollowersData_user_followers_iconImage.serializer,
        json,
      );
}
