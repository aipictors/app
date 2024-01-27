// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mute_tag.var.gql.g.dart';

abstract class GMuteTagVars
    implements Built<GMuteTagVars, GMuteTagVarsBuilder> {
  GMuteTagVars._();

  factory GMuteTagVars([Function(GMuteTagVarsBuilder b) updates]) =
      _$GMuteTagVars;

  _i1.GMuteTagInput get input;
  static Serializer<GMuteTagVars> get serializer => _$gMuteTagVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GMuteTagVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMuteTagVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GMuteTagVars.serializer,
        json,
      );
}
