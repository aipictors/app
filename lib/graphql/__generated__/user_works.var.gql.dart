// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_works.var.gql.g.dart';

abstract class GUserWorksVars
    implements Built<GUserWorksVars, GUserWorksVarsBuilder> {
  GUserWorksVars._();

  factory GUserWorksVars([Function(GUserWorksVarsBuilder b) updates]) =
      _$GUserWorksVars;

  String get user_id;
  int get offset;
  int get limit;
  static Serializer<GUserWorksVars> get serializer =>
      _$gUserWorksVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserWorksVars.serializer,
        json,
      );
}
