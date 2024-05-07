// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_lora_models.data.gql.g.dart';

abstract class GImageLoraModelsData
    implements Built<GImageLoraModelsData, GImageLoraModelsDataBuilder> {
  GImageLoraModelsData._();

  factory GImageLoraModelsData(
          [void Function(GImageLoraModelsDataBuilder b) updates]) =
      _$GImageLoraModelsData;

  static void _initializeBuilder(GImageLoraModelsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GImageLoraModelsData_imageLoraModels> get imageLoraModels;
  static Serializer<GImageLoraModelsData> get serializer =>
      _$gImageLoraModelsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageLoraModelsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageLoraModelsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageLoraModelsData.serializer,
        json,
      );
}

abstract class GImageLoraModelsData_imageLoraModels
    implements
        Built<GImageLoraModelsData_imageLoraModels,
            GImageLoraModelsData_imageLoraModelsBuilder> {
  GImageLoraModelsData_imageLoraModels._();

  factory GImageLoraModelsData_imageLoraModels(
      [void Function(GImageLoraModelsData_imageLoraModelsBuilder b)
          updates]) = _$GImageLoraModelsData_imageLoraModels;

  static void _initializeBuilder(
          GImageLoraModelsData_imageLoraModelsBuilder b) =>
      b..G__typename = 'ImageLoraModelNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String? get description;
  String? get license;
  BuiltList<String> get prompts;
  String get slug;
  String? get thumbnailImageURL;
  String? get genre;
  static Serializer<GImageLoraModelsData_imageLoraModels> get serializer =>
      _$gImageLoraModelsDataImageLoraModelsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageLoraModelsData_imageLoraModels.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageLoraModelsData_imageLoraModels? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageLoraModelsData_imageLoraModels.serializer,
        json,
      );
}
