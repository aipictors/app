// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_awards.var.gql.g.dart';

abstract class GWorkAwardsVars
    implements Built<GWorkAwardsVars, GWorkAwardsVarsBuilder> {
  GWorkAwardsVars._();

  factory GWorkAwardsVars([void Function(GWorkAwardsVarsBuilder b) updates]) =
      _$GWorkAwardsVars;

  int get offset;
  int get limit;
  _i1.GWorkAwardsWhereInput get where;
  static Serializer<GWorkAwardsVars> get serializer =>
      _$gWorkAwardsVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GWorkAwardsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkAwardsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GWorkAwardsVars.serializer,
        json,
      );
}
