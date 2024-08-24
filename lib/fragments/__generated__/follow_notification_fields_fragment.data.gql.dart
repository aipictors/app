// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:aipictors/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'follow_notification_fields_fragment.data.gql.g.dart';

abstract class GFollowNotificationFields {
  String get G__typename;
  String get id;
  int get createdAt;
  GFollowNotificationFields_user? get user;
  Map<String, dynamic> toJson();
}

abstract class GFollowNotificationFields_user
    implements _i1.GPartialUserFields {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get login;
  @override
  String get name;
  @override
  String? get iconUrl;
  @override
  Map<String, dynamic> toJson();
}

abstract class GFollowNotificationFieldsData
    implements
        Built<GFollowNotificationFieldsData,
            GFollowNotificationFieldsDataBuilder>,
        GFollowNotificationFields {
  GFollowNotificationFieldsData._();

  factory GFollowNotificationFieldsData(
          [void Function(GFollowNotificationFieldsDataBuilder b) updates]) =
      _$GFollowNotificationFieldsData;

  static void _initializeBuilder(GFollowNotificationFieldsDataBuilder b) =>
      b..G__typename = 'FollowNotificationNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  GFollowNotificationFieldsData_user? get user;
  static Serializer<GFollowNotificationFieldsData> get serializer =>
      _$gFollowNotificationFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFollowNotificationFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowNotificationFieldsData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFollowNotificationFieldsData.serializer,
        json,
      );
}

abstract class GFollowNotificationFieldsData_user
    implements
        Built<GFollowNotificationFieldsData_user,
            GFollowNotificationFieldsData_userBuilder>,
        GFollowNotificationFields_user,
        _i1.GPartialUserFields {
  GFollowNotificationFieldsData_user._();

  factory GFollowNotificationFieldsData_user(
      [void Function(GFollowNotificationFieldsData_userBuilder b)
          updates]) = _$GFollowNotificationFieldsData_user;

  static void _initializeBuilder(GFollowNotificationFieldsData_userBuilder b) =>
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
  static Serializer<GFollowNotificationFieldsData_user> get serializer =>
      _$gFollowNotificationFieldsDataUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFollowNotificationFieldsData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowNotificationFieldsData_user? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFollowNotificationFieldsData_user.serializer,
        json,
      );
}
