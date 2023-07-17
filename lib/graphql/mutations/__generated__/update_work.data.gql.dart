// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_work.data.gql.g.dart';

abstract class GUpdateWorkData
    implements Built<GUpdateWorkData, GUpdateWorkDataBuilder> {
  GUpdateWorkData._();

  factory GUpdateWorkData([Function(GUpdateWorkDataBuilder b) updates]) =
      _$GUpdateWorkData;

  static void _initializeBuilder(GUpdateWorkDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateWorkData_updateWork get updateWork;
  static Serializer<GUpdateWorkData> get serializer =>
      _$gUpdateWorkDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateWorkData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateWorkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateWorkData.serializer,
        json,
      );
}

abstract class GUpdateWorkData_updateWork
    implements
        Built<GUpdateWorkData_updateWork, GUpdateWorkData_updateWorkBuilder> {
  GUpdateWorkData_updateWork._();

  factory GUpdateWorkData_updateWork(
          [Function(GUpdateWorkData_updateWorkBuilder b) updates]) =
      _$GUpdateWorkData_updateWork;

  static void _initializeBuilder(GUpdateWorkData_updateWorkBuilder b) =>
      b..G__typename = 'WorkNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  String? get description;
  static Serializer<GUpdateWorkData_updateWork> get serializer =>
      _$gUpdateWorkDataUpdateWorkSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateWorkData_updateWork.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateWorkData_updateWork? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateWorkData_updateWork.serializer,
        json,
      );
}
