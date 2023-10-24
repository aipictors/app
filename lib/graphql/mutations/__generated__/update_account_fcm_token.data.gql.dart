// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_account_fcm_token.data.gql.g.dart';

abstract class GUpdateAccountFcmTokenData
    implements
        Built<GUpdateAccountFcmTokenData, GUpdateAccountFcmTokenDataBuilder> {
  GUpdateAccountFcmTokenData._();

  factory GUpdateAccountFcmTokenData(
          [Function(GUpdateAccountFcmTokenDataBuilder b) updates]) =
      _$GUpdateAccountFcmTokenData;

  static void _initializeBuilder(GUpdateAccountFcmTokenDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateAccountFcmTokenData_updateAccountFcmToken get updateAccountFcmToken;
  static Serializer<GUpdateAccountFcmTokenData> get serializer =>
      _$gUpdateAccountFcmTokenDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountFcmTokenData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateAccountFcmTokenData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountFcmTokenData.serializer,
        json,
      );
}

abstract class GUpdateAccountFcmTokenData_updateAccountFcmToken
    implements
        Built<GUpdateAccountFcmTokenData_updateAccountFcmToken,
            GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder> {
  GUpdateAccountFcmTokenData_updateAccountFcmToken._();

  factory GUpdateAccountFcmTokenData_updateAccountFcmToken(
      [Function(GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder b)
          updates]) = _$GUpdateAccountFcmTokenData_updateAccountFcmToken;

  static void _initializeBuilder(
          GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder b) =>
      b..G__typename = 'UserNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GUpdateAccountFcmTokenData_updateAccountFcmToken>
      get serializer =>
          _$gUpdateAccountFcmTokenDataUpdateAccountFcmTokenSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountFcmTokenData_updateAccountFcmToken.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateAccountFcmTokenData_updateAccountFcmToken? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountFcmTokenData_updateAccountFcmToken.serializer,
        json,
      );
}
