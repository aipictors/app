// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'announcements.var.gql.g.dart';

abstract class GAnnouncementsVars
    implements Built<GAnnouncementsVars, GAnnouncementsVarsBuilder> {
  GAnnouncementsVars._();

  factory GAnnouncementsVars([Function(GAnnouncementsVarsBuilder b) updates]) =
      _$GAnnouncementsVars;

  static Serializer<GAnnouncementsVars> get serializer =>
      _$gAnnouncementsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAnnouncementsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAnnouncementsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAnnouncementsVars.serializer,
        json,
      );
}
