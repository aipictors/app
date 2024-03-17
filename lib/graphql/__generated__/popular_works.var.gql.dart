// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'popular_works.var.gql.g.dart';

abstract class GPopularWorksVars
    implements Built<GPopularWorksVars, GPopularWorksVarsBuilder> {
  GPopularWorksVars._();

  factory GPopularWorksVars(
          [void Function(GPopularWorksVarsBuilder b) updates]) =
      _$GPopularWorksVars;

  static Serializer<GPopularWorksVars> get serializer =>
      _$gPopularWorksVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPopularWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPopularWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPopularWorksVars.serializer,
        json,
      );
}
