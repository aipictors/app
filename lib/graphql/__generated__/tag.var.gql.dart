// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tag.var.gql.g.dart';

abstract class GTagVars implements Built<GTagVars, GTagVarsBuilder> {
  GTagVars._();

  factory GTagVars([Function(GTagVarsBuilder b) updates]) = _$GTagVars;

  String get name;
  static Serializer<GTagVars> get serializer => _$gTagVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTagVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagVars.serializer,
        json,
      );
}
