// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_folder.data.gql.g.dart';

abstract class GUpdateFolderData
    implements Built<GUpdateFolderData, GUpdateFolderDataBuilder> {
  GUpdateFolderData._();

  factory GUpdateFolderData(
          [void Function(GUpdateFolderDataBuilder b) updates]) =
      _$GUpdateFolderData;

  static void _initializeBuilder(GUpdateFolderDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateFolderData_updateFolder get updateFolder;
  static Serializer<GUpdateFolderData> get serializer =>
      _$gUpdateFolderDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateFolderData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateFolderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateFolderData.serializer,
        json,
      );
}

abstract class GUpdateFolderData_updateFolder
    implements
        Built<GUpdateFolderData_updateFolder,
            GUpdateFolderData_updateFolderBuilder> {
  GUpdateFolderData_updateFolder._();

  factory GUpdateFolderData_updateFolder(
          [void Function(GUpdateFolderData_updateFolderBuilder b) updates]) =
      _$GUpdateFolderData_updateFolder;

  static void _initializeBuilder(GUpdateFolderData_updateFolderBuilder b) =>
      b..G__typename = 'FolderNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  String get description;
  static Serializer<GUpdateFolderData_updateFolder> get serializer =>
      _$gUpdateFolderDataUpdateFolderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateFolderData_updateFolder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateFolderData_updateFolder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateFolderData_updateFolder.serializer,
        json,
      );
}
