// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i3;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'contributors.data.gql.g.dart';

abstract class GContributorsData
    implements Built<GContributorsData, GContributorsDataBuilder> {
  GContributorsData._();

  factory GContributorsData([Function(GContributorsDataBuilder b) updates]) =
      _$GContributorsData;

  static void _initializeBuilder(GContributorsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GContributorsData_contributors> get contributors;
  static Serializer<GContributorsData> get serializer =>
      _$gContributorsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GContributorsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GContributorsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GContributorsData.serializer,
        json,
      );
}

abstract class GContributorsData_contributors
    implements
        Built<GContributorsData_contributors,
            GContributorsData_contributorsBuilder> {
  GContributorsData_contributors._();

  factory GContributorsData_contributors(
          [Function(GContributorsData_contributorsBuilder b) updates]) =
      _$GContributorsData_contributors;

  static void _initializeBuilder(GContributorsData_contributorsBuilder b) =>
      b..G__typename = 'ContributorNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<_i2.GContributorType> get types;
  GContributorsData_contributors_user get user;
  static Serializer<GContributorsData_contributors> get serializer =>
      _$gContributorsDataContributorsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GContributorsData_contributors.serializer,
        this,
      ) as Map<String, dynamic>);
  static GContributorsData_contributors? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GContributorsData_contributors.serializer,
        json,
      );
}

abstract class GContributorsData_contributors_user
    implements
        Built<GContributorsData_contributors_user,
            GContributorsData_contributors_userBuilder>,
        _i3.GPartialUserFields {
  GContributorsData_contributors_user._();

  factory GContributorsData_contributors_user(
          [Function(GContributorsData_contributors_userBuilder b) updates]) =
      _$GContributorsData_contributors_user;

  static void _initializeBuilder(
          GContributorsData_contributors_userBuilder b) =>
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
  GContributorsData_contributors_user_iconImage? get iconImage;
  static Serializer<GContributorsData_contributors_user> get serializer =>
      _$gContributorsDataContributorsUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GContributorsData_contributors_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GContributorsData_contributors_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GContributorsData_contributors_user.serializer,
        json,
      );
}

abstract class GContributorsData_contributors_user_iconImage
    implements
        Built<GContributorsData_contributors_user_iconImage,
            GContributorsData_contributors_user_iconImageBuilder>,
        _i3.GPartialUserFields_iconImage {
  GContributorsData_contributors_user_iconImage._();

  factory GContributorsData_contributors_user_iconImage(
      [Function(GContributorsData_contributors_user_iconImageBuilder b)
          updates]) = _$GContributorsData_contributors_user_iconImage;

  static void _initializeBuilder(
          GContributorsData_contributors_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GContributorsData_contributors_user_iconImage>
      get serializer => _$gContributorsDataContributorsUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GContributorsData_contributors_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GContributorsData_contributors_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GContributorsData_contributors_user_iconImage.serializer,
        json,
      );
}
