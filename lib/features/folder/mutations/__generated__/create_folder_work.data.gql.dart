// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_folder_work.data.gql.g.dart';

abstract class GCreateFolderWorkData
    implements Built<GCreateFolderWorkData, GCreateFolderWorkDataBuilder> {
  GCreateFolderWorkData._();

  factory GCreateFolderWorkData(
          [void Function(GCreateFolderWorkDataBuilder b) updates]) =
      _$GCreateFolderWorkData;

  static void _initializeBuilder(GCreateFolderWorkDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateFolderWorkData_createFolderWork get createFolderWork;
  static Serializer<GCreateFolderWorkData> get serializer =>
      _$gCreateFolderWorkDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateFolderWorkData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateFolderWorkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateFolderWorkData.serializer,
        json,
      );
}

abstract class GCreateFolderWorkData_createFolderWork
    implements
        Built<GCreateFolderWorkData_createFolderWork,
            GCreateFolderWorkData_createFolderWorkBuilder> {
  GCreateFolderWorkData_createFolderWork._();

  factory GCreateFolderWorkData_createFolderWork(
      [void Function(GCreateFolderWorkData_createFolderWorkBuilder b)
          updates]) = _$GCreateFolderWorkData_createFolderWork;

  static void _initializeBuilder(
          GCreateFolderWorkData_createFolderWorkBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GCreateFolderWorkData_createFolderWork> get serializer =>
      _$gCreateFolderWorkDataCreateFolderWorkSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateFolderWorkData_createFolderWork.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateFolderWorkData_createFolderWork? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateFolderWorkData_createFolderWork.serializer,
        json,
      );
}
