// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_works.var.gql.g.dart';

abstract class GViewerWorksVars
    implements Built<GViewerWorksVars, GViewerWorksVarsBuilder> {
  GViewerWorksVars._();

  factory GViewerWorksVars([Function(GViewerWorksVarsBuilder b) updates]) =
      _$GViewerWorksVars;

  int get offset;
  int get limit;
  static Serializer<GViewerWorksVars> get serializer =>
      _$gViewerWorksVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerWorksVars.serializer,
        json,
      );
}
