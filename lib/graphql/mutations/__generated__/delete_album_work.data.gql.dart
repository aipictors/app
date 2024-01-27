// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_album_work.data.gql.g.dart';

abstract class GDeleteAlbumWorkData
    implements Built<GDeleteAlbumWorkData, GDeleteAlbumWorkDataBuilder> {
  GDeleteAlbumWorkData._();

  factory GDeleteAlbumWorkData(
          [Function(GDeleteAlbumWorkDataBuilder b) updates]) =
      _$GDeleteAlbumWorkData;

  static void _initializeBuilder(GDeleteAlbumWorkDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeleteAlbumWorkData_deleteAlbumWork get deleteAlbumWork;
  static Serializer<GDeleteAlbumWorkData> get serializer =>
      _$gDeleteAlbumWorkDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteAlbumWorkData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteAlbumWorkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteAlbumWorkData.serializer,
        json,
      );
}

abstract class GDeleteAlbumWorkData_deleteAlbumWork
    implements
        Built<GDeleteAlbumWorkData_deleteAlbumWork,
            GDeleteAlbumWorkData_deleteAlbumWorkBuilder> {
  GDeleteAlbumWorkData_deleteAlbumWork._();

  factory GDeleteAlbumWorkData_deleteAlbumWork(
          [Function(GDeleteAlbumWorkData_deleteAlbumWorkBuilder b) updates]) =
      _$GDeleteAlbumWorkData_deleteAlbumWork;

  static void _initializeBuilder(
          GDeleteAlbumWorkData_deleteAlbumWorkBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GDeleteAlbumWorkData_deleteAlbumWork> get serializer =>
      _$gDeleteAlbumWorkDataDeleteAlbumWorkSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteAlbumWorkData_deleteAlbumWork.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteAlbumWorkData_deleteAlbumWork? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteAlbumWorkData_deleteAlbumWork.serializer,
        json,
      );
}
