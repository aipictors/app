// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_account.data.gql.g.dart';

abstract class GCreateAccountData
    implements Built<GCreateAccountData, GCreateAccountDataBuilder> {
  GCreateAccountData._();

  factory GCreateAccountData([Function(GCreateAccountDataBuilder b) updates]) =
      _$GCreateAccountData;

  static void _initializeBuilder(GCreateAccountDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateAccountData_createAccount get createAccount;
  static Serializer<GCreateAccountData> get serializer =>
      _$gCreateAccountDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAccountData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAccountData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAccountData.serializer,
        json,
      );
}

abstract class GCreateAccountData_createAccount
    implements
        Built<GCreateAccountData_createAccount,
            GCreateAccountData_createAccountBuilder> {
  GCreateAccountData_createAccount._();

  factory GCreateAccountData_createAccount(
          [Function(GCreateAccountData_createAccountBuilder b) updates]) =
      _$GCreateAccountData_createAccount;

  static void _initializeBuilder(GCreateAccountData_createAccountBuilder b) =>
      b..G__typename = 'UserNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GCreateAccountData_createAccount> get serializer =>
      _$gCreateAccountDataCreateAccountSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAccountData_createAccount.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAccountData_createAccount? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAccountData_createAccount.serializer,
        json,
      );
}
