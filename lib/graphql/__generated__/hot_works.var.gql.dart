// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hot_works.var.gql.g.dart';

abstract class GHotWorksVars
    implements Built<GHotWorksVars, GHotWorksVarsBuilder> {
  GHotWorksVars._();

  factory GHotWorksVars([Function(GHotWorksVarsBuilder b) updates]) =
      _$GHotWorksVars;

  static Serializer<GHotWorksVars> get serializer => _$gHotWorksVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotWorksVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotWorksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotWorksVars.serializer,
        json,
      );
}
