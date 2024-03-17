// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stickers.var.gql.g.dart';

abstract class GStickersVars
    implements Built<GStickersVars, GStickersVarsBuilder> {
  GStickersVars._();

  factory GStickersVars([void Function(GStickersVarsBuilder b) updates]) =
      _$GStickersVars;

  int get offset;
  int get limit;
  _i1.GStickersWhereInput? get where;
  static Serializer<GStickersVars> get serializer => _$gStickersVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GStickersVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickersVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GStickersVars.serializer,
        json,
      );
}
