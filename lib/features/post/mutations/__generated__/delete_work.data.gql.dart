// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_work.data.gql.g.dart';

abstract class GDeleteWorkData
    implements Built<GDeleteWorkData, GDeleteWorkDataBuilder> {
  GDeleteWorkData._();

  factory GDeleteWorkData([void Function(GDeleteWorkDataBuilder b) updates]) =
      _$GDeleteWorkData;

  static void _initializeBuilder(GDeleteWorkDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeleteWorkData_deleteWork get deleteWork;
  static Serializer<GDeleteWorkData> get serializer =>
      _$gDeleteWorkDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteWorkData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteWorkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteWorkData.serializer,
        json,
      );
}

abstract class GDeleteWorkData_deleteWork
    implements
        Built<GDeleteWorkData_deleteWork, GDeleteWorkData_deleteWorkBuilder> {
  GDeleteWorkData_deleteWork._();

  factory GDeleteWorkData_deleteWork(
          [void Function(GDeleteWorkData_deleteWorkBuilder b) updates]) =
      _$GDeleteWorkData_deleteWork;

  static void _initializeBuilder(GDeleteWorkData_deleteWorkBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GDeleteWorkData_deleteWork> get serializer =>
      _$gDeleteWorkDataDeleteWorkSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteWorkData_deleteWork.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteWorkData_deleteWork? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteWorkData_deleteWork.serializer,
        json,
      );
}
