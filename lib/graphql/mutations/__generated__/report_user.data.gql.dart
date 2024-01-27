// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_user.data.gql.g.dart';

abstract class GReportUserData
    implements Built<GReportUserData, GReportUserDataBuilder> {
  GReportUserData._();

  factory GReportUserData([Function(GReportUserDataBuilder b) updates]) =
      _$GReportUserData;

  static void _initializeBuilder(GReportUserDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get reportUser;
  static Serializer<GReportUserData> get serializer =>
      _$gReportUserDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportUserData.serializer,
        json,
      );
}
