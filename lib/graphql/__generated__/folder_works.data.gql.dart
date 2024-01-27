// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'folder_works.data.gql.g.dart';

abstract class GFolderWorksData
    implements Built<GFolderWorksData, GFolderWorksDataBuilder> {
  GFolderWorksData._();

  factory GFolderWorksData([Function(GFolderWorksDataBuilder b) updates]) =
      _$GFolderWorksData;

  static void _initializeBuilder(GFolderWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFolderWorksData_folder? get folder;
  static Serializer<GFolderWorksData> get serializer =>
      _$gFolderWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFolderWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderWorksData.serializer,
        json,
      );
}

abstract class GFolderWorksData_folder
    implements Built<GFolderWorksData_folder, GFolderWorksData_folderBuilder> {
  GFolderWorksData_folder._();

  factory GFolderWorksData_folder(
          [Function(GFolderWorksData_folderBuilder b) updates]) =
      _$GFolderWorksData_folder;

  static void _initializeBuilder(GFolderWorksData_folderBuilder b) =>
      b..G__typename = 'FolderNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GFolderWorksData_folder_works> get works;
  static Serializer<GFolderWorksData_folder> get serializer =>
      _$gFolderWorksDataFolderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderWorksData_folder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFolderWorksData_folder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderWorksData_folder.serializer,
        json,
      );
}

abstract class GFolderWorksData_folder_works
    implements
        Built<GFolderWorksData_folder_works,
            GFolderWorksData_folder_worksBuilder>,
        _i2.GPartialWorkFields {
  GFolderWorksData_folder_works._();

  factory GFolderWorksData_folder_works(
          [Function(GFolderWorksData_folder_worksBuilder b) updates]) =
      _$GFolderWorksData_folder_works;

  static void _initializeBuilder(GFolderWorksData_folder_worksBuilder b) =>
      b..G__typename = 'WorkNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  int get createdAt;
  @override
  GFolderWorksData_folder_works_thumbnailImage? get thumbnailImage;
  static Serializer<GFolderWorksData_folder_works> get serializer =>
      _$gFolderWorksDataFolderWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderWorksData_folder_works.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFolderWorksData_folder_works? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderWorksData_folder_works.serializer,
        json,
      );
}

abstract class GFolderWorksData_folder_works_thumbnailImage
    implements
        Built<GFolderWorksData_folder_works_thumbnailImage,
            GFolderWorksData_folder_works_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GFolderWorksData_folder_works_thumbnailImage._();

  factory GFolderWorksData_folder_works_thumbnailImage(
      [Function(GFolderWorksData_folder_works_thumbnailImageBuilder b)
          updates]) = _$GFolderWorksData_folder_works_thumbnailImage;

  static void _initializeBuilder(
          GFolderWorksData_folder_works_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFolderWorksData_folder_works_thumbnailImage>
      get serializer => _$gFolderWorksDataFolderWorksThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderWorksData_folder_works_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFolderWorksData_folder_works_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderWorksData_folder_works_thumbnailImage.serializer,
        json,
      );
}
