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

part 'feed_hot_works.data.gql.g.dart';

abstract class GFeedHotWorksData
    implements Built<GFeedHotWorksData, GFeedHotWorksDataBuilder> {
  GFeedHotWorksData._();

  factory GFeedHotWorksData(
          [void Function(GFeedHotWorksDataBuilder b) updates]) =
      _$GFeedHotWorksData;

  static void _initializeBuilder(GFeedHotWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GFeedHotWorksData_hotWorks> get hotWorks;
  static Serializer<GFeedHotWorksData> get serializer =>
      _$gFeedHotWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedHotWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedHotWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedHotWorksData.serializer,
        json,
      );
}

abstract class GFeedHotWorksData_hotWorks
    implements
        Built<GFeedHotWorksData_hotWorks, GFeedHotWorksData_hotWorksBuilder>,
        _i2.GPartialFeedWorkFields {
  GFeedHotWorksData_hotWorks._();

  factory GFeedHotWorksData_hotWorks(
          [void Function(GFeedHotWorksData_hotWorksBuilder b) updates]) =
      _$GFeedHotWorksData_hotWorks;

  static void _initializeBuilder(GFeedHotWorksData_hotWorksBuilder b) =>
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
  GFeedHotWorksData_hotWorks_user get user;
  bool get isLiked;
  static Serializer<GFeedHotWorksData_hotWorks> get serializer =>
      _$gFeedHotWorksDataHotWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedHotWorksData_hotWorks.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedHotWorksData_hotWorks? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedHotWorksData_hotWorks.serializer,
        json,
      );
}

abstract class GFeedHotWorksData_hotWorks_user
    implements
        Built<GFeedHotWorksData_hotWorks_user,
            GFeedHotWorksData_hotWorks_userBuilder>,
        _i3.GPartialUserFields {
  GFeedHotWorksData_hotWorks_user._();

  factory GFeedHotWorksData_hotWorks_user(
          [void Function(GFeedHotWorksData_hotWorks_userBuilder b) updates]) =
      _$GFeedHotWorksData_hotWorks_user;

  static void _initializeBuilder(GFeedHotWorksData_hotWorks_userBuilder b) =>
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
  static Serializer<GFeedHotWorksData_hotWorks_user> get serializer =>
      _$gFeedHotWorksDataHotWorksUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedHotWorksData_hotWorks_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedHotWorksData_hotWorks_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedHotWorksData_hotWorks_user.serializer,
        json,
      );
}
