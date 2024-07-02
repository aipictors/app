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
          [void Function(GFeedPopularWorksDataBuilder b) updates]) =
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
      [void Function(GFeedPopularWorksData_popularWorksBuilder b)
          updates]) = _$GFeedPopularWorksData_popularWorks;

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
  String get imageURL;
  GFeedPopularWorksData_popularWorks_user get user;
  bool get isLiked;
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

abstract class GFeedPopularWorksData_popularWorks_user
    implements
        Built<GFeedPopularWorksData_popularWorks_user,
            GFeedPopularWorksData_popularWorks_userBuilder>,
        _i3.GPartialUserFields {
  GFeedPopularWorksData_popularWorks_user._();

  factory GFeedPopularWorksData_popularWorks_user(
      [void Function(GFeedPopularWorksData_popularWorks_userBuilder b)
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
  String? get iconUrl;
  bool get isFollower;
  bool get isFollowee;
  bool get isMuted;
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
