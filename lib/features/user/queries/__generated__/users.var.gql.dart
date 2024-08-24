// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'users.var.gql.g.dart';

abstract class GUsersVars implements Built<GUsersVars, GUsersVarsBuilder> {
  GUsersVars._();

  factory GUsersVars([void Function(GUsersVarsBuilder b) updates]) =
      _$GUsersVars;

  int get offset;
  int get limit;
  _i1.GUsersWhereInput? get where;
  static Serializer<GUsersVars> get serializer => _$gUsersVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUsersVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUsersVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUsersVars.serializer,
        json,
      );
}
