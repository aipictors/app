// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_account_login.data.gql.g.dart';

abstract class GUpdateAccountLoginData
    implements Built<GUpdateAccountLoginData, GUpdateAccountLoginDataBuilder> {
  GUpdateAccountLoginData._();

  factory GUpdateAccountLoginData(
          [Function(GUpdateAccountLoginDataBuilder b) updates]) =
      _$GUpdateAccountLoginData;

  static void _initializeBuilder(GUpdateAccountLoginDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateAccountLoginData_updateAccountLogin get updateAccountLogin;
  static Serializer<GUpdateAccountLoginData> get serializer =>
      _$gUpdateAccountLoginDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountLoginData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountLoginData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountLoginData.serializer,
        json,
      );
}

abstract class GUpdateAccountLoginData_updateAccountLogin
    implements
        Built<GUpdateAccountLoginData_updateAccountLogin,
            GUpdateAccountLoginData_updateAccountLoginBuilder> {
  GUpdateAccountLoginData_updateAccountLogin._();

  factory GUpdateAccountLoginData_updateAccountLogin(
      [Function(GUpdateAccountLoginData_updateAccountLoginBuilder b)
          updates]) = _$GUpdateAccountLoginData_updateAccountLogin;

  static void _initializeBuilder(
          GUpdateAccountLoginData_updateAccountLoginBuilder b) =>
      b..G__typename = 'UserNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get login;
  static Serializer<GUpdateAccountLoginData_updateAccountLogin>
      get serializer => _$gUpdateAccountLoginDataUpdateAccountLoginSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountLoginData_updateAccountLogin.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountLoginData_updateAccountLogin? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountLoginData_updateAccountLogin.serializer,
        json,
      );
}
