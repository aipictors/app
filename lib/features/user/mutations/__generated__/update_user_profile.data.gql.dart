// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_user_profile.data.gql.g.dart';

abstract class GUpdateUserProfileData
    implements Built<GUpdateUserProfileData, GUpdateUserProfileDataBuilder> {
  GUpdateUserProfileData._();

  factory GUpdateUserProfileData(
          [void Function(GUpdateUserProfileDataBuilder b) updates]) =
      _$GUpdateUserProfileData;

  static void _initializeBuilder(GUpdateUserProfileDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateUserProfileData_updateUserProfile get updateUserProfile;
  static Serializer<GUpdateUserProfileData> get serializer =>
      _$gUpdateUserProfileDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserProfileData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateUserProfileData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserProfileData.serializer,
        json,
      );
}

abstract class GUpdateUserProfileData_updateUserProfile
    implements
        Built<GUpdateUserProfileData_updateUserProfile,
            GUpdateUserProfileData_updateUserProfileBuilder> {
  GUpdateUserProfileData_updateUserProfile._();

  factory GUpdateUserProfileData_updateUserProfile(
      [void Function(GUpdateUserProfileData_updateUserProfileBuilder b)
          updates]) = _$GUpdateUserProfileData_updateUserProfile;

  static void _initializeBuilder(
          GUpdateUserProfileData_updateUserProfileBuilder b) =>
      b..G__typename = 'UserNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GUpdateUserProfileData_updateUserProfile> get serializer =>
      _$gUpdateUserProfileDataUpdateUserProfileSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserProfileData_updateUserProfile.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateUserProfileData_updateUserProfile? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserProfileData_updateUserProfile.serializer,
        json,
      );
}
