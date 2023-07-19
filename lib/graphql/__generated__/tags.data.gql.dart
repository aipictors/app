// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_tag_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tags.data.gql.g.dart';

abstract class GTagsData implements Built<GTagsData, GTagsDataBuilder> {
  GTagsData._();

  factory GTagsData([Function(GTagsDataBuilder b) updates]) = _$GTagsData;

  static void _initializeBuilder(GTagsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GTagsData_tags> get tags;
  static Serializer<GTagsData> get serializer => _$gTagsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTagsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagsData.serializer,
        json,
      );
}

abstract class GTagsData_tags
    implements
        Built<GTagsData_tags, GTagsData_tagsBuilder>,
        _i2.GPartialTagFields {
  GTagsData_tags._();

  factory GTagsData_tags([Function(GTagsData_tagsBuilder b) updates]) =
      _$GTagsData_tags;

  static void _initializeBuilder(GTagsData_tagsBuilder b) =>
      b..G__typename = 'TagNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  GTagsData_tags_viewer? get viewer;
  static Serializer<GTagsData_tags> get serializer => _$gTagsDataTagsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagsData_tags.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTagsData_tags? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagsData_tags.serializer,
        json,
      );
}

abstract class GTagsData_tags_viewer
    implements Built<GTagsData_tags_viewer, GTagsData_tags_viewerBuilder> {
  GTagsData_tags_viewer._();

  factory GTagsData_tags_viewer(
          [Function(GTagsData_tags_viewerBuilder b) updates]) =
      _$GTagsData_tags_viewer;

  static void _initializeBuilder(GTagsData_tags_viewerBuilder b) =>
      b..G__typename = 'TagViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get isLiked;
  bool get isWatched;
  bool get isMuted;
  static Serializer<GTagsData_tags_viewer> get serializer =>
      _$gTagsDataTagsViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagsData_tags_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTagsData_tags_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagsData_tags_viewer.serializer,
        json,
      );
}
