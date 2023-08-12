// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_album.data.gql.g.dart';

abstract class GReportAlbumData
    implements Built<GReportAlbumData, GReportAlbumDataBuilder> {
  GReportAlbumData._();

  factory GReportAlbumData([Function(GReportAlbumDataBuilder b) updates]) =
      _$GReportAlbumData;

  static void _initializeBuilder(GReportAlbumDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get reportAlbum;
  static Serializer<GReportAlbumData> get serializer =>
      _$gReportAlbumDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportAlbumData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReportAlbumData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportAlbumData.serializer,
        json,
      );
}
