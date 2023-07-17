// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mute_user.var.gql.g.dart';

abstract class GMuteUserVars
    implements Built<GMuteUserVars, GMuteUserVarsBuilder> {
  GMuteUserVars._();

  factory GMuteUserVars([Function(GMuteUserVarsBuilder b) updates]) =
      _$GMuteUserVars;

  _i1.GMuteUserInput get input;
  static Serializer<GMuteUserVars> get serializer => _$gMuteUserVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GMuteUserVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMuteUserVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GMuteUserVars.serializer,
        json,
      );
}
