// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_followees.data.gql.g.dart';

abstract class GUserFolloweesData
    implements Built<GUserFolloweesData, GUserFolloweesDataBuilder> {
  GUserFolloweesData._();

  factory GUserFolloweesData(
          [void Function(GUserFolloweesDataBuilder b) updates]) =
      _$GUserFolloweesData;

  static void _initializeBuilder(GUserFolloweesDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserFolloweesData_user? get user;
  static Serializer<GUserFolloweesData> get serializer =>
      _$gUserFolloweesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolloweesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFolloweesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolloweesData.serializer,
        json,
      );
}

abstract class GUserFolloweesData_user
    implements Built<GUserFolloweesData_user, GUserFolloweesData_userBuilder> {
  GUserFolloweesData_user._();

  factory GUserFolloweesData_user(
          [void Function(GUserFolloweesData_userBuilder b) updates]) =
      _$GUserFolloweesData_user;

  static void _initializeBuilder(GUserFolloweesData_userBuilder b) =>
      b..G__typename = 'UserNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GUserFolloweesData_user_followees> get followees;
  static Serializer<GUserFolloweesData_user> get serializer =>
      _$gUserFolloweesDataUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolloweesData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFolloweesData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolloweesData_user.serializer,
        json,
      );
}

abstract class GUserFolloweesData_user_followees
    implements
        Built<GUserFolloweesData_user_followees,
            GUserFolloweesData_user_followeesBuilder>,
        _i2.GPartialUserFields {
  GUserFolloweesData_user_followees._();

  factory GUserFolloweesData_user_followees(
          [void Function(GUserFolloweesData_user_followeesBuilder b) updates]) =
      _$GUserFolloweesData_user_followees;

  static void _initializeBuilder(GUserFolloweesData_user_followeesBuilder b) =>
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
  static Serializer<GUserFolloweesData_user_followees> get serializer =>
      _$gUserFolloweesDataUserFolloweesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolloweesData_user_followees.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFolloweesData_user_followees? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolloweesData_user_followees.serializer,
        json,
      );
}
