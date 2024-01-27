// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tag.data.gql.g.dart';

abstract class GTagData implements Built<GTagData, GTagDataBuilder> {
  GTagData._();

  factory GTagData([Function(GTagDataBuilder b) updates]) = _$GTagData;

  static void _initializeBuilder(GTagDataBuilder b) => b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GTagData_tag? get tag;
  static Serializer<GTagData> get serializer => _$gTagDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTagData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagData.serializer,
        json,
      );
}

abstract class GTagData_tag
    implements Built<GTagData_tag, GTagData_tagBuilder> {
  GTagData_tag._();

  factory GTagData_tag([Function(GTagData_tagBuilder b) updates]) =
      _$GTagData_tag;

  static void _initializeBuilder(GTagData_tagBuilder b) =>
      b..G__typename = 'TagNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  GTagData_tag_viewer? get viewer;
  static Serializer<GTagData_tag> get serializer => _$gTagDataTagSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagData_tag.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTagData_tag? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagData_tag.serializer,
        json,
      );
}

abstract class GTagData_tag_viewer
    implements Built<GTagData_tag_viewer, GTagData_tag_viewerBuilder> {
  GTagData_tag_viewer._();

  factory GTagData_tag_viewer(
      [Function(GTagData_tag_viewerBuilder b) updates]) = _$GTagData_tag_viewer;

  static void _initializeBuilder(GTagData_tag_viewerBuilder b) =>
      b..G__typename = 'TagViewerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get isLiked;
  bool get isWatched;
  bool get isMuted;
  static Serializer<GTagData_tag_viewer> get serializer =>
      _$gTagDataTagViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagData_tag_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTagData_tag_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagData_tag_viewer.serializer,
        json,
      );
}
