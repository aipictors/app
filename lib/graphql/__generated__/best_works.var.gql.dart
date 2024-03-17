// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'best_works.var.gql.g.dart';

abstract class GBestWorksVars
    implements Built<GBestWorksVars, GBestWorksVarsBuilder> {
  GBestWorksVars._();

  factory GBestWorksVars([void Function(GBestWorksVarsBuilder b) updates]) =
      _$GBestWorksVars;

  static Serializer<GBestWorksVars> get serializer =>
      _$gBestWorksVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBestWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBestWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBestWorksVars.serializer,
        json,
      );
}
