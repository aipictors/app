// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_work.data.gql.g.dart';

abstract class GCreateWorkData
    implements Built<GCreateWorkData, GCreateWorkDataBuilder> {
  GCreateWorkData._();

  factory GCreateWorkData([Function(GCreateWorkDataBuilder b) updates]) =
      _$GCreateWorkData;

  static void _initializeBuilder(GCreateWorkDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateWorkData_createWork get createWork;
  static Serializer<GCreateWorkData> get serializer =>
      _$gCreateWorkDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWorkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWorkData.serializer,
        json,
      );
}

abstract class GCreateWorkData_createWork
    implements
        Built<GCreateWorkData_createWork, GCreateWorkData_createWorkBuilder> {
  GCreateWorkData_createWork._();

  factory GCreateWorkData_createWork(
          [Function(GCreateWorkData_createWorkBuilder b) updates]) =
      _$GCreateWorkData_createWork;

  static void _initializeBuilder(GCreateWorkData_createWorkBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get title;
  static Serializer<GCreateWorkData_createWork> get serializer =>
      _$gCreateWorkDataCreateWorkSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkData_createWork.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWorkData_createWork? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWorkData_createWork.serializer,
        json,
      );
}
