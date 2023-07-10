// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_with_password.data.gql.g.dart';

abstract class GLoginWithPasswordData
    implements Built<GLoginWithPasswordData, GLoginWithPasswordDataBuilder> {
  GLoginWithPasswordData._();

  factory GLoginWithPasswordData(
          [Function(GLoginWithPasswordDataBuilder b) updates]) =
      _$GLoginWithPasswordData;

  static void _initializeBuilder(GLoginWithPasswordDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GLoginWithPasswordData_loginWithPassword get loginWithPassword;
  static Serializer<GLoginWithPasswordData> get serializer =>
      _$gLoginWithPasswordDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLoginWithPasswordData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLoginWithPasswordData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLoginWithPasswordData.serializer,
        json,
      );
}

abstract class GLoginWithPasswordData_loginWithPassword
    implements
        Built<GLoginWithPasswordData_loginWithPassword,
            GLoginWithPasswordData_loginWithPasswordBuilder> {
  GLoginWithPasswordData_loginWithPassword._();

  factory GLoginWithPasswordData_loginWithPassword(
      [Function(GLoginWithPasswordData_loginWithPasswordBuilder b)
          updates]) = _$GLoginWithPasswordData_loginWithPassword;

  static void _initializeBuilder(
          GLoginWithPasswordData_loginWithPasswordBuilder b) =>
      b..G__typename = 'LoginResult';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get token;
  static Serializer<GLoginWithPasswordData_loginWithPassword> get serializer =>
      _$gLoginWithPasswordDataLoginWithPasswordSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLoginWithPasswordData_loginWithPassword.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLoginWithPasswordData_loginWithPassword? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLoginWithPasswordData_loginWithPassword.serializer,
        json,
      );
}
