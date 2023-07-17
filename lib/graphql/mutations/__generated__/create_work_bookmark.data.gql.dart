// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_work_bookmark.data.gql.g.dart';

abstract class GCreateWorkBookmarkData
    implements Built<GCreateWorkBookmarkData, GCreateWorkBookmarkDataBuilder> {
  GCreateWorkBookmarkData._();

  factory GCreateWorkBookmarkData(
          [Function(GCreateWorkBookmarkDataBuilder b) updates]) =
      _$GCreateWorkBookmarkData;

  static void _initializeBuilder(GCreateWorkBookmarkDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateWorkBookmarkData_createWorkBookmark get createWorkBookmark;
  static Serializer<GCreateWorkBookmarkData> get serializer =>
      _$gCreateWorkBookmarkDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkBookmarkData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkBookmarkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWorkBookmarkData.serializer,
        json,
      );
}

abstract class GCreateWorkBookmarkData_createWorkBookmark
    implements
        Built<GCreateWorkBookmarkData_createWorkBookmark,
            GCreateWorkBookmarkData_createWorkBookmarkBuilder> {
  GCreateWorkBookmarkData_createWorkBookmark._();

  factory GCreateWorkBookmarkData_createWorkBookmark(
      [Function(GCreateWorkBookmarkData_createWorkBookmarkBuilder b)
          updates]) = _$GCreateWorkBookmarkData_createWorkBookmark;

  static void _initializeBuilder(
          GCreateWorkBookmarkData_createWorkBookmarkBuilder b) =>
      b..G__typename = 'WorkNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  GCreateWorkBookmarkData_createWorkBookmark_viewer get viewer;
  static Serializer<GCreateWorkBookmarkData_createWorkBookmark>
      get serializer => _$gCreateWorkBookmarkDataCreateWorkBookmarkSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkBookmarkData_createWorkBookmark.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkBookmarkData_createWorkBookmark? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWorkBookmarkData_createWorkBookmark.serializer,
        json,
      );
}

abstract class GCreateWorkBookmarkData_createWorkBookmark_viewer
    implements
        Built<GCreateWorkBookmarkData_createWorkBookmark_viewer,
            GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder> {
  GCreateWorkBookmarkData_createWorkBookmark_viewer._();

  factory GCreateWorkBookmarkData_createWorkBookmark_viewer(
      [Function(GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder b)
          updates]) = _$GCreateWorkBookmarkData_createWorkBookmark_viewer;

  static void _initializeBuilder(
          GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder b) =>
      b..G__typename = 'WorkViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool get isBookmarked;
  static Serializer<GCreateWorkBookmarkData_createWorkBookmark_viewer>
      get serializer =>
          _$gCreateWorkBookmarkDataCreateWorkBookmarkViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkBookmarkData_createWorkBookmark_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkBookmarkData_createWorkBookmark_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWorkBookmarkData_createWorkBookmark_viewer.serializer,
        json,
      );
}
