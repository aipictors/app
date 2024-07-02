// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/sub_work_fields_fragment.data.gql.dart'
    as _i3;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work.data.gql.g.dart';

abstract class GWorkData implements Built<GWorkData, GWorkDataBuilder> {
  GWorkData._();

  factory GWorkData([void Function(GWorkDataBuilder b) updates]) = _$GWorkData;

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

  factory GWorkData_work([void Function(GWorkData_workBuilder b) updates]) =
      _$GWorkData_work;

  static void _initializeBuilder(GWorkData_workBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  String? get description;
  bool get isDeleted;
  String get imageURL;
  GWorkData_work_user get user;
  BuiltList<String> get tagNames;
  int get createdAt;
  int get likesCount;
  int get viewsCount;
  BuiltList<GWorkData_work_subWorks> get subWorks;
  bool get isLiked;
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

abstract class GWorkData_work_user
    implements
        Built<GWorkData_work_user, GWorkData_work_userBuilder>,
        _i2.GWorkUserFields {
  GWorkData_work_user._();

  factory GWorkData_work_user(
          [void Function(GWorkData_work_userBuilder b) updates]) =
      _$GWorkData_work_user;

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
  bool get isFollower;
  bool get isFollowee;
  bool get isMuted;
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
          [void Function(GWorkData_work_user_iconImageBuilder b) updates]) =
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

abstract class GWorkData_work_subWorks
    implements
        Built<GWorkData_work_subWorks, GWorkData_work_subWorksBuilder>,
        _i3.GSubWorkFields {
  GWorkData_work_subWorks._();

  factory GWorkData_work_subWorks(
          [void Function(GWorkData_work_subWorksBuilder b) updates]) =
      _$GWorkData_work_subWorks;

  static void _initializeBuilder(GWorkData_work_subWorksBuilder b) =>
      b..G__typename = 'SubWorkNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String? get imageUrl;
  static Serializer<GWorkData_work_subWorks> get serializer =>
      _$gWorkDataWorkSubWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkData_work_subWorks.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkData_work_subWorks? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkData_work_subWorks.serializer,
        json,
      );
}
