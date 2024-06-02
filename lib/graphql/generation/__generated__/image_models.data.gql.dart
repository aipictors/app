// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_models.data.gql.g.dart';

abstract class GImageModelsData
    implements Built<GImageModelsData, GImageModelsDataBuilder> {
  GImageModelsData._();

  factory GImageModelsData([void Function(GImageModelsDataBuilder b) updates]) =
      _$GImageModelsData;

  static void _initializeBuilder(GImageModelsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GImageModelsData_imageModels> get imageModels;
  static Serializer<GImageModelsData> get serializer =>
      _$gImageModelsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageModelsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageModelsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageModelsData.serializer,
        json,
      );
}

abstract class GImageModelsData_imageModels
    implements
        Built<GImageModelsData_imageModels,
            GImageModelsData_imageModelsBuilder> {
  GImageModelsData_imageModels._();

  factory GImageModelsData_imageModels(
          [void Function(GImageModelsData_imageModelsBuilder b) updates]) =
      _$GImageModelsData_imageModels;

  static void _initializeBuilder(GImageModelsData_imageModelsBuilder b) =>
      b..G__typename = 'ImageModelNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String get displayName;
  _i2.GImageModelCategory get category;
  String? get description;
  String? get license;
  BuiltList<String> get prompts;
  String get slug;
  _i2.GImageStyle get style;
  String? get thumbnailImageURL;
  String get type;
  static Serializer<GImageModelsData_imageModels> get serializer =>
      _$gImageModelsDataImageModelsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageModelsData_imageModels.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageModelsData_imageModels? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageModelsData_imageModels.serializer,
        json,
      );
}
