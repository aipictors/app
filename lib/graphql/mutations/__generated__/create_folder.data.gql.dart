// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_folder.data.gql.g.dart';

abstract class GCreateFolderData
    implements Built<GCreateFolderData, GCreateFolderDataBuilder> {
  GCreateFolderData._();

  factory GCreateFolderData([Function(GCreateFolderDataBuilder b) updates]) =
      _$GCreateFolderData;

  static void _initializeBuilder(GCreateFolderDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateFolderData_createFolder get createFolder;
  static Serializer<GCreateFolderData> get serializer =>
      _$gCreateFolderDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateFolderData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateFolderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateFolderData.serializer,
        json,
      );
}

abstract class GCreateFolderData_createFolder
    implements
        Built<GCreateFolderData_createFolder,
            GCreateFolderData_createFolderBuilder> {
  GCreateFolderData_createFolder._();

  factory GCreateFolderData_createFolder(
          [Function(GCreateFolderData_createFolderBuilder b) updates]) =
      _$GCreateFolderData_createFolder;

  static void _initializeBuilder(GCreateFolderData_createFolderBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GCreateFolderData_createFolder> get serializer =>
      _$gCreateFolderDataCreateFolderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateFolderData_createFolder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateFolderData_createFolder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateFolderData_createFolder.serializer,
        json,
      );
}
