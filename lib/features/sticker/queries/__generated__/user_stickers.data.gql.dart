// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/fragments/__generated__/partial_sticker_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_stickers.data.gql.g.dart';

abstract class GUserStickersData
    implements Built<GUserStickersData, GUserStickersDataBuilder> {
  GUserStickersData._();

  factory GUserStickersData(
          [void Function(GUserStickersDataBuilder b) updates]) =
      _$GUserStickersData;

  static void _initializeBuilder(GUserStickersDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserStickersData_viewer? get viewer;
  static Serializer<GUserStickersData> get serializer =>
      _$gUserStickersDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStickersData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserStickersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStickersData.serializer,
        json,
      );
}

abstract class GUserStickersData_viewer
    implements
        Built<GUserStickersData_viewer, GUserStickersData_viewerBuilder> {
  GUserStickersData_viewer._();

  factory GUserStickersData_viewer(
          [void Function(GUserStickersData_viewerBuilder b) updates]) =
      _$GUserStickersData_viewer;

  static void _initializeBuilder(GUserStickersData_viewerBuilder b) =>
      b..G__typename = 'Viewer';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GUserStickersData_viewer_userStickers> get userStickers;
  static Serializer<GUserStickersData_viewer> get serializer =>
      _$gUserStickersDataViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStickersData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserStickersData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStickersData_viewer.serializer,
        json,
      );
}

abstract class GUserStickersData_viewer_userStickers
    implements
        Built<GUserStickersData_viewer_userStickers,
            GUserStickersData_viewer_userStickersBuilder>,
        _i2.GPartialStickerFields {
  GUserStickersData_viewer_userStickers._();

  factory GUserStickersData_viewer_userStickers(
      [void Function(GUserStickersData_viewer_userStickersBuilder b)
          updates]) = _$GUserStickersData_viewer_userStickers;

  static void _initializeBuilder(
          GUserStickersData_viewer_userStickersBuilder b) =>
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
  static Serializer<GUserStickersData_viewer_userStickers> get serializer =>
      _$gUserStickersDataViewerUserStickersSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStickersData_viewer_userStickers.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserStickersData_viewer_userStickers? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStickersData_viewer_userStickers.serializer,
        json,
      );
}
