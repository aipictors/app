// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_tag_fields_fragment.data.gql.g.dart';

abstract class GPartialTagFields {
  String get G__typename;
  String get id;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GPartialTagFieldsData
    implements
        Built<GPartialTagFieldsData, GPartialTagFieldsDataBuilder>,
        GPartialTagFields {
  GPartialTagFieldsData._();

  factory GPartialTagFieldsData(
          [Function(GPartialTagFieldsDataBuilder b) updates]) =
      _$GPartialTagFieldsData;

  static void _initializeBuilder(GPartialTagFieldsDataBuilder b) =>
      b..G__typename = 'TagNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GPartialTagFieldsData> get serializer =>
      _$gPartialTagFieldsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialTagFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialTagFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialTagFieldsData.serializer,
        json,
      );
}
