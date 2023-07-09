// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'folders.data.gql.g.dart';

abstract class GFoldersData
    implements Built<GFoldersData, GFoldersDataBuilder> {
  GFoldersData._();

  factory GFoldersData([Function(GFoldersDataBuilder b) updates]) =
      _$GFoldersData;

  static void _initializeBuilder(GFoldersDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GFoldersData_folders>? get folders;
  static Serializer<GFoldersData> get serializer => _$gFoldersDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFoldersData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFoldersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFoldersData.serializer,
        json,
      );
}

abstract class GFoldersData_folders
    implements
        Built<GFoldersData_folders, GFoldersData_foldersBuilder>,
        _i2.GPartialFolderFields {
  GFoldersData_folders._();

  factory GFoldersData_folders(
          [Function(GFoldersData_foldersBuilder b) updates]) =
      _$GFoldersData_folders;

  static void _initializeBuilder(GFoldersData_foldersBuilder b) =>
      b..G__typename = 'FolderNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  int get rating;
  @override
  int get likesCount;
  @override
  int get viewsCount;
  @override
  GFoldersData_folders_user get user;
  static Serializer<GFoldersData_folders> get serializer =>
      _$gFoldersDataFoldersSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFoldersData_folders.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFoldersData_folders? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFoldersData_folders.serializer,
        json,
      );
}

abstract class GFoldersData_folders_user
    implements
        Built<GFoldersData_folders_user, GFoldersData_folders_userBuilder>,
        _i2.GPartialFolderFields_user {
  GFoldersData_folders_user._();

  factory GFoldersData_folders_user(
          [Function(GFoldersData_folders_userBuilder b) updates]) =
      _$GFoldersData_folders_user;

  static void _initializeBuilder(GFoldersData_folders_userBuilder b) =>
      b..G__typename = 'UserNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GFoldersData_folders_user> get serializer =>
      _$gFoldersDataFoldersUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFoldersData_folders_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFoldersData_folders_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFoldersData_folders_user.serializer,
        json,
      );
}
