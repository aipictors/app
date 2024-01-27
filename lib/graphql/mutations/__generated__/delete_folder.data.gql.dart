// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_folder.data.gql.g.dart';

abstract class GDeleteFolderData
    implements Built<GDeleteFolderData, GDeleteFolderDataBuilder> {
  GDeleteFolderData._();

  factory GDeleteFolderData([Function(GDeleteFolderDataBuilder b) updates]) =
      _$GDeleteFolderData;

  static void _initializeBuilder(GDeleteFolderDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeleteFolderData_deleteFolder get deleteFolder;
  static Serializer<GDeleteFolderData> get serializer =>
      _$gDeleteFolderDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteFolderData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteFolderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteFolderData.serializer,
        json,
      );
}

abstract class GDeleteFolderData_deleteFolder
    implements
        Built<GDeleteFolderData_deleteFolder,
            GDeleteFolderData_deleteFolderBuilder> {
  GDeleteFolderData_deleteFolder._();

  factory GDeleteFolderData_deleteFolder(
          [Function(GDeleteFolderData_deleteFolderBuilder b) updates]) =
      _$GDeleteFolderData_deleteFolder;

  static void _initializeBuilder(GDeleteFolderData_deleteFolderBuilder b) =>
      b..G__typename = 'FolderNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GDeleteFolderData_deleteFolder> get serializer =>
      _$gDeleteFolderDataDeleteFolderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteFolderData_deleteFolder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteFolderData_deleteFolder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteFolderData_deleteFolder.serializer,
        json,
      );
}
