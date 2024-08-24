// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_album_work.data.gql.g.dart';

abstract class GCreateAlbumWorkData
    implements Built<GCreateAlbumWorkData, GCreateAlbumWorkDataBuilder> {
  GCreateAlbumWorkData._();

  factory GCreateAlbumWorkData(
          [void Function(GCreateAlbumWorkDataBuilder b) updates]) =
      _$GCreateAlbumWorkData;

  static void _initializeBuilder(GCreateAlbumWorkDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateAlbumWorkData_createAlbumWork get createAlbumWork;
  static Serializer<GCreateAlbumWorkData> get serializer =>
      _$gCreateAlbumWorkDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAlbumWorkData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAlbumWorkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAlbumWorkData.serializer,
        json,
      );
}

abstract class GCreateAlbumWorkData_createAlbumWork
    implements
        Built<GCreateAlbumWorkData_createAlbumWork,
            GCreateAlbumWorkData_createAlbumWorkBuilder> {
  GCreateAlbumWorkData_createAlbumWork._();

  factory GCreateAlbumWorkData_createAlbumWork(
      [void Function(GCreateAlbumWorkData_createAlbumWorkBuilder b)
          updates]) = _$GCreateAlbumWorkData_createAlbumWork;

  static void _initializeBuilder(
          GCreateAlbumWorkData_createAlbumWorkBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GCreateAlbumWorkData_createAlbumWork> get serializer =>
      _$gCreateAlbumWorkDataCreateAlbumWorkSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAlbumWorkData_createAlbumWork.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAlbumWorkData_createAlbumWork? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAlbumWorkData_createAlbumWork.serializer,
        json,
      );
}
