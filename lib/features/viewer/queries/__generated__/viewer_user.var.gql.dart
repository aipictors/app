// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_user.var.gql.g.dart';

abstract class GViewerUserVars
    implements Built<GViewerUserVars, GViewerUserVarsBuilder> {
  GViewerUserVars._();

  factory GViewerUserVars([void Function(GViewerUserVarsBuilder b) updates]) =
      _$GViewerUserVars;

  static Serializer<GViewerUserVars> get serializer =>
      _$gViewerUserVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerUserVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerUserVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerUserVars.serializer,
        json,
      );
}
