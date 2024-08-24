// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed_daily_theme_works.var.gql.g.dart';

abstract class GFeedDailyThemeWorksVars
    implements
        Built<GFeedDailyThemeWorksVars, GFeedDailyThemeWorksVarsBuilder> {
  GFeedDailyThemeWorksVars._();

  factory GFeedDailyThemeWorksVars(
          [void Function(GFeedDailyThemeWorksVarsBuilder b) updates]) =
      _$GFeedDailyThemeWorksVars;

  int get year;
  int get month;
  int get day;
  int get offset;
  int get limit;
  static Serializer<GFeedDailyThemeWorksVars> get serializer =>
      _$gFeedDailyThemeWorksVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedDailyThemeWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedDailyThemeWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedDailyThemeWorksVars.serializer,
        json,
      );
}
