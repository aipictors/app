// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tags.var.gql.g.dart';

abstract class GTagsVars implements Built<GTagsVars, GTagsVarsBuilder> {
  GTagsVars._();

  factory GTagsVars([Function(GTagsVarsBuilder b) updates]) = _$GTagsVars;

  int get offset;
  int get limit;
  _i1.GTagsWhereInput? get where;
  static Serializer<GTagsVars> get serializer => _$gTagsVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GTagsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTagsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GTagsVars.serializer,
        json,
      );
}
