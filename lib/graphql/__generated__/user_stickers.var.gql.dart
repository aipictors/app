// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_stickers.var.gql.g.dart';

abstract class GUserStickersVars
    implements Built<GUserStickersVars, GUserStickersVarsBuilder> {
  GUserStickersVars._();

  factory GUserStickersVars([Function(GUserStickersVarsBuilder b) updates]) =
      _$GUserStickersVars;

  int get offset;
  int get limit;
  static Serializer<GUserStickersVars> get serializer =>
      _$gUserStickersVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStickersVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserStickersVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStickersVars.serializer,
        json,
      );
}
