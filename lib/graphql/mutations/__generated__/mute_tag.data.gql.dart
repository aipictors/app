// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mute_tag.data.gql.g.dart';

abstract class GMuteTagData
    implements Built<GMuteTagData, GMuteTagDataBuilder> {
  GMuteTagData._();

  factory GMuteTagData([Function(GMuteTagDataBuilder b) updates]) =
      _$GMuteTagData;

  static void _initializeBuilder(GMuteTagDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GMuteTagData_muteTag get muteTag;
  static Serializer<GMuteTagData> get serializer => _$gMuteTagDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMuteTagData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMuteTagData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMuteTagData.serializer,
        json,
      );
}

abstract class GMuteTagData_muteTag
    implements Built<GMuteTagData_muteTag, GMuteTagData_muteTagBuilder> {
  GMuteTagData_muteTag._();

  factory GMuteTagData_muteTag(
          [Function(GMuteTagData_muteTagBuilder b) updates]) =
      _$GMuteTagData_muteTag;

  static void _initializeBuilder(GMuteTagData_muteTagBuilder b) =>
      b..G__typename = 'TagNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GMuteTagData_muteTag> get serializer =>
      _$gMuteTagDataMuteTagSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMuteTagData_muteTag.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMuteTagData_muteTag? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMuteTagData_muteTag.serializer,
        json,
      );
}
