// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work.var.gql.g.dart';

abstract class GWorkVars implements Built<GWorkVars, GWorkVarsBuilder> {
  GWorkVars._();

  factory GWorkVars([void Function(GWorkVarsBuilder b) updates]) = _$GWorkVars;

  String get id;
  static Serializer<GWorkVars> get serializer => _$gWorkVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkVars.serializer,
        json,
      );
}
