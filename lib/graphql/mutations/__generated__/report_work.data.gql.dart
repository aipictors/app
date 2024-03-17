// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_work.data.gql.g.dart';

abstract class GReportWorkData
    implements Built<GReportWorkData, GReportWorkDataBuilder> {
  GReportWorkData._();

  factory GReportWorkData([void Function(GReportWorkDataBuilder b) updates]) =
      _$GReportWorkData;

  static void _initializeBuilder(GReportWorkDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get reportWork;
  static Serializer<GReportWorkData> get serializer =>
      _$gReportWorkDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportWorkData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportWorkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportWorkData.serializer,
        json,
      );
}
