// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_folder.data.gql.g.dart';

abstract class GReportFolderData
    implements Built<GReportFolderData, GReportFolderDataBuilder> {
  GReportFolderData._();

  factory GReportFolderData([Function(GReportFolderDataBuilder b) updates]) =
      _$GReportFolderData;

  static void _initializeBuilder(GReportFolderDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get reportFolder;
  static Serializer<GReportFolderData> get serializer =>
      _$gReportFolderDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportFolderData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReportFolderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportFolderData.serializer,
        json,
      );
}
