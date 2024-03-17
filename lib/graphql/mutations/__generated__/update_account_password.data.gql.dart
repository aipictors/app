// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_account_password.data.gql.g.dart';

abstract class GUpdateAccountPasswordData
    implements
        Built<GUpdateAccountPasswordData, GUpdateAccountPasswordDataBuilder> {
  GUpdateAccountPasswordData._();

  factory GUpdateAccountPasswordData(
          [void Function(GUpdateAccountPasswordDataBuilder b) updates]) =
      _$GUpdateAccountPasswordData;

  static void _initializeBuilder(GUpdateAccountPasswordDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateAccountPasswordData_updateAccountPassword get updateAccountPassword;
  static Serializer<GUpdateAccountPasswordData> get serializer =>
      _$gUpdateAccountPasswordDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountPasswordData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountPasswordData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountPasswordData.serializer,
        json,
      );
}

abstract class GUpdateAccountPasswordData_updateAccountPassword
    implements
        Built<GUpdateAccountPasswordData_updateAccountPassword,
            GUpdateAccountPasswordData_updateAccountPasswordBuilder> {
  GUpdateAccountPasswordData_updateAccountPassword._();

  factory GUpdateAccountPasswordData_updateAccountPassword(
      [void Function(GUpdateAccountPasswordData_updateAccountPasswordBuilder b)
          updates]) = _$GUpdateAccountPasswordData_updateAccountPassword;

  static void _initializeBuilder(
          GUpdateAccountPasswordData_updateAccountPasswordBuilder b) =>
      b..G__typename = 'UserNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GUpdateAccountPasswordData_updateAccountPassword>
      get serializer =>
          _$gUpdateAccountPasswordDataUpdateAccountPasswordSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountPasswordData_updateAccountPassword.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountPasswordData_updateAccountPassword? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountPasswordData_updateAccountPassword.serializer,
        json,
      );
}
