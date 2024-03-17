// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'daily_theme.var.gql.g.dart';

abstract class GDailyThemeVars
    implements Built<GDailyThemeVars, GDailyThemeVarsBuilder> {
  GDailyThemeVars._();

  factory GDailyThemeVars([void Function(GDailyThemeVarsBuilder b) updates]) =
      _$GDailyThemeVars;

  String get id;
  int get offset;
  int get limit;
  static Serializer<GDailyThemeVars> get serializer =>
      _$gDailyThemeVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemeVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDailyThemeVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemeVars.serializer,
        json,
      );
}
