// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_folder_work.data.gql.g.dart';

abstract class GDeleteFolderWorkData
    implements Built<GDeleteFolderWorkData, GDeleteFolderWorkDataBuilder> {
  GDeleteFolderWorkData._();

  factory GDeleteFolderWorkData(
          [void Function(GDeleteFolderWorkDataBuilder b) updates]) =
      _$GDeleteFolderWorkData;

  static void _initializeBuilder(GDeleteFolderWorkDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeleteFolderWorkData_deleteFolderWork get deleteFolderWork;
  static Serializer<GDeleteFolderWorkData> get serializer =>
      _$gDeleteFolderWorkDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteFolderWorkData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteFolderWorkData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteFolderWorkData.serializer,
        json,
      );
}

abstract class GDeleteFolderWorkData_deleteFolderWork
    implements
        Built<GDeleteFolderWorkData_deleteFolderWork,
            GDeleteFolderWorkData_deleteFolderWorkBuilder> {
  GDeleteFolderWorkData_deleteFolderWork._();

  factory GDeleteFolderWorkData_deleteFolderWork(
      [void Function(GDeleteFolderWorkData_deleteFolderWorkBuilder b)
          updates]) = _$GDeleteFolderWorkData_deleteFolderWork;

  static void _initializeBuilder(
          GDeleteFolderWorkData_deleteFolderWorkBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GDeleteFolderWorkData_deleteFolderWork> get serializer =>
      _$gDeleteFolderWorkDataDeleteFolderWorkSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteFolderWorkData_deleteFolderWork.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteFolderWorkData_deleteFolderWork? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteFolderWorkData_deleteFolderWork.serializer,
        json,
      );
}
