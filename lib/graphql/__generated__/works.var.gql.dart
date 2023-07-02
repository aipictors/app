// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'works.var.gql.g.dart';

abstract class GWorksVars implements Built<GWorksVars, GWorksVarsBuilder> {
  GWorksVars._();

  factory GWorksVars([Function(GWorksVarsBuilder b) updates]) = _$GWorksVars;

  int get offset;
  int get limit;
  _i1.GWorksWhereInput? get where;
  static Serializer<GWorksVars> get serializer => _$gWorksVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorksVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GWorksVars.serializer,
        json,
      );
}
