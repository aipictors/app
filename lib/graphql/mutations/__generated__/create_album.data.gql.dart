// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_album.data.gql.g.dart';

abstract class GCreateAlbumData
    implements Built<GCreateAlbumData, GCreateAlbumDataBuilder> {
  GCreateAlbumData._();

  factory GCreateAlbumData([void Function(GCreateAlbumDataBuilder b) updates]) =
      _$GCreateAlbumData;

  static void _initializeBuilder(GCreateAlbumDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateAlbumData_createFolder get createFolder;
  static Serializer<GCreateAlbumData> get serializer =>
      _$gCreateAlbumDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAlbumData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAlbumData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAlbumData.serializer,
        json,
      );
}

abstract class GCreateAlbumData_createFolder
    implements
        Built<GCreateAlbumData_createFolder,
            GCreateAlbumData_createFolderBuilder> {
  GCreateAlbumData_createFolder._();

  factory GCreateAlbumData_createFolder(
          [void Function(GCreateAlbumData_createFolderBuilder b) updates]) =
      _$GCreateAlbumData_createFolder;

  static void _initializeBuilder(GCreateAlbumData_createFolderBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GCreateAlbumData_createFolder> get serializer =>
      _$gCreateAlbumDataCreateFolderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAlbumData_createFolder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAlbumData_createFolder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAlbumData_createFolder.serializer,
        json,
      );
}
