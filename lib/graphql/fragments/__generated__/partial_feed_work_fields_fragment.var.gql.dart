// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_feed_work_fields_fragment.var.gql.g.dart';

abstract class GPartialFeedWorkFieldsVars
    implements
        Built<GPartialFeedWorkFieldsVars, GPartialFeedWorkFieldsVarsBuilder> {
  GPartialFeedWorkFieldsVars._();

  factory GPartialFeedWorkFieldsVars(
          [Function(GPartialFeedWorkFieldsVarsBuilder b) updates]) =
      _$GPartialFeedWorkFieldsVars;

  static Serializer<GPartialFeedWorkFieldsVars> get serializer =>
      _$gPartialFeedWorkFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialFeedWorkFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialFeedWorkFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialFeedWorkFieldsVars.serializer,
        json,
      );
}
