// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_folders.data.gql.g.dart';

abstract class GViewerFoldersData
    implements Built<GViewerFoldersData, GViewerFoldersDataBuilder> {
  GViewerFoldersData._();

  factory GViewerFoldersData([Function(GViewerFoldersDataBuilder b) updates]) =
      _$GViewerFoldersData;

  static void _initializeBuilder(GViewerFoldersDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerFoldersData_viewer? get viewer;
  static Serializer<GViewerFoldersData> get serializer =>
      _$gViewerFoldersDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFoldersData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerFoldersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFoldersData.serializer,
        json,
      );
}

abstract class GViewerFoldersData_viewer
    implements
        Built<GViewerFoldersData_viewer, GViewerFoldersData_viewerBuilder> {
  GViewerFoldersData_viewer._();

  factory GViewerFoldersData_viewer(
          [Function(GViewerFoldersData_viewerBuilder b) updates]) =
      _$GViewerFoldersData_viewer;

  static void _initializeBuilder(GViewerFoldersData_viewerBuilder b) =>
      b..G__typename = 'Viewer';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GViewerFoldersData_viewer_folders> get folders;
  static Serializer<GViewerFoldersData_viewer> get serializer =>
      _$gViewerFoldersDataViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFoldersData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerFoldersData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFoldersData_viewer.serializer,
        json,
      );
}

abstract class GViewerFoldersData_viewer_folders
    implements
        Built<GViewerFoldersData_viewer_folders,
            GViewerFoldersData_viewer_foldersBuilder>,
        _i2.GPartialFolderFields {
  GViewerFoldersData_viewer_folders._();

  factory GViewerFoldersData_viewer_folders(
          [Function(GViewerFoldersData_viewer_foldersBuilder b) updates]) =
      _$GViewerFoldersData_viewer_folders;

  static void _initializeBuilder(GViewerFoldersData_viewer_foldersBuilder b) =>
      b..G__typename = 'FolderNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  _i3.GRating? get rating;
  @override
  String get description;
  @override
  String? get thumbnailImageURL;
  static Serializer<GViewerFoldersData_viewer_folders> get serializer =>
      _$gViewerFoldersDataViewerFoldersSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFoldersData_viewer_folders.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerFoldersData_viewer_folders? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFoldersData_viewer_folders.serializer,
        json,
      );
}
