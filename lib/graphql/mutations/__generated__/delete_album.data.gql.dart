// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_album.data.gql.g.dart';

abstract class GDeleteAlbumData
    implements Built<GDeleteAlbumData, GDeleteAlbumDataBuilder> {
  GDeleteAlbumData._();

  factory GDeleteAlbumData([Function(GDeleteAlbumDataBuilder b) updates]) =
      _$GDeleteAlbumData;

  static void _initializeBuilder(GDeleteAlbumDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeleteAlbumData_deleteAlbum get deleteAlbum;
  static Serializer<GDeleteAlbumData> get serializer =>
      _$gDeleteAlbumDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteAlbumData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteAlbumData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteAlbumData.serializer,
        json,
      );
}

abstract class GDeleteAlbumData_deleteAlbum
    implements
        Built<GDeleteAlbumData_deleteAlbum,
            GDeleteAlbumData_deleteAlbumBuilder> {
  GDeleteAlbumData_deleteAlbum._();

  factory GDeleteAlbumData_deleteAlbum(
          [Function(GDeleteAlbumData_deleteAlbumBuilder b) updates]) =
      _$GDeleteAlbumData_deleteAlbum;

  static void _initializeBuilder(GDeleteAlbumData_deleteAlbumBuilder b) =>
      b..G__typename = 'AlbumNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GDeleteAlbumData_deleteAlbum> get serializer =>
      _$gDeleteAlbumDataDeleteAlbumSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteAlbumData_deleteAlbum.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteAlbumData_deleteAlbum? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteAlbumData_deleteAlbum.serializer,
        json,
      );
}
