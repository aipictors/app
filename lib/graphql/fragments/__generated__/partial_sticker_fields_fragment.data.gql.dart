// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_sticker_fields_fragment.data.gql.g.dart';

abstract class GPartialStickerFields {
  String get G__typename;
  String get id;
  String get title;
  String? get imageUrl;
  int get likesCount;
  int get downloadsCount;
  int get usesCount;
  Map<String, dynamic> toJson();
}

abstract class GPartialStickerFieldsData
    implements
        Built<GPartialStickerFieldsData, GPartialStickerFieldsDataBuilder>,
        GPartialStickerFields {
  GPartialStickerFieldsData._();

  factory GPartialStickerFieldsData(
          [void Function(GPartialStickerFieldsDataBuilder b) updates]) =
      _$GPartialStickerFieldsData;

  static void _initializeBuilder(GPartialStickerFieldsDataBuilder b) =>
      b..G__typename = 'StickerNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  String? get imageUrl;
  @override
  int get likesCount;
  @override
  int get downloadsCount;
  @override
  int get usesCount;
  static Serializer<GPartialStickerFieldsData> get serializer =>
      _$gPartialStickerFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialStickerFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialStickerFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialStickerFieldsData.serializer,
        json,
      );
}
