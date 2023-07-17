// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'contributors.var.gql.g.dart';

abstract class GContributorsVars
    implements Built<GContributorsVars, GContributorsVarsBuilder> {
  GContributorsVars._();

  factory GContributorsVars([Function(GContributorsVarsBuilder b) updates]) =
      _$GContributorsVars;

  String get user_id;
  int get offset;
  int get limit;
  static Serializer<GContributorsVars> get serializer =>
      _$gContributorsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GContributorsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GContributorsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GContributorsVars.serializer,
        json,
      );
}
