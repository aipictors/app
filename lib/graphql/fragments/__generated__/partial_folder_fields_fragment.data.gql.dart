// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_folder_fields_fragment.data.gql.g.dart';

abstract class GPartialFolderFields {
  String get G__typename;
  String get id;
  String get title;
  _i1.GRating? get rating;
  String get description;
  String? get thumbnailImageURL;
  Map<String, dynamic> toJson();
}

abstract class GPartialFolderFieldsData
    implements
        Built<GPartialFolderFieldsData, GPartialFolderFieldsDataBuilder>,
        GPartialFolderFields {
  GPartialFolderFieldsData._();

  factory GPartialFolderFieldsData(
          [Function(GPartialFolderFieldsDataBuilder b) updates]) =
      _$GPartialFolderFieldsData;

  static void _initializeBuilder(GPartialFolderFieldsDataBuilder b) =>
      b..G__typename = 'FolderNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  _i1.GRating? get rating;
  @override
  String get description;
  @override
  String? get thumbnailImageURL;
  static Serializer<GPartialFolderFieldsData> get serializer =>
      _$gPartialFolderFieldsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPartialFolderFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialFolderFieldsData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPartialFolderFieldsData.serializer,
        json,
      );
}
