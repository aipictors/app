// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_work.var.gql.g.dart';

abstract class GCreateWorkVars
    implements Built<GCreateWorkVars, GCreateWorkVarsBuilder> {
  GCreateWorkVars._();

  factory GCreateWorkVars([Function(GCreateWorkVarsBuilder b) updates]) =
      _$GCreateWorkVars;

  _i1.GCreateWorkInput get input;
  static Serializer<GCreateWorkVars> get serializer =>
      _$gCreateWorkVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateWorkVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateWorkVars.serializer,
        json,
      );
}
