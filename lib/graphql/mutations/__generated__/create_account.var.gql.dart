// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_account.var.gql.g.dart';

abstract class GCreateAccountVars
    implements Built<GCreateAccountVars, GCreateAccountVarsBuilder> {
  GCreateAccountVars._();

  factory GCreateAccountVars(
          [void Function(GCreateAccountVarsBuilder b) updates]) =
      _$GCreateAccountVars;

  _i1.GCreateAccountInput get input;
  static Serializer<GCreateAccountVars> get serializer =>
      _$gCreateAccountVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateAccountVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAccountVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateAccountVars.serializer,
        json,
      );
}
