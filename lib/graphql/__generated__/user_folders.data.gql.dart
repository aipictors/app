// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_folders.data.gql.g.dart';

abstract class GUserFoldersData
    implements Built<GUserFoldersData, GUserFoldersDataBuilder> {
  GUserFoldersData._();

  factory GUserFoldersData([Function(GUserFoldersDataBuilder b) updates]) =
      _$GUserFoldersData;

  static void _initializeBuilder(GUserFoldersDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserFoldersData_user? get user;
  static Serializer<GUserFoldersData> get serializer =>
      _$gUserFoldersDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFoldersData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFoldersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFoldersData.serializer,
        json,
      );
}

abstract class GUserFoldersData_user
    implements Built<GUserFoldersData_user, GUserFoldersData_userBuilder> {
  GUserFoldersData_user._();

  factory GUserFoldersData_user(
          [Function(GUserFoldersData_userBuilder b) updates]) =
      _$GUserFoldersData_user;

  static void _initializeBuilder(GUserFoldersData_userBuilder b) =>
      b..G__typename = 'UserNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GUserFoldersData_user_folders> get folders;
  static Serializer<GUserFoldersData_user> get serializer =>
      _$gUserFoldersDataUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFoldersData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFoldersData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFoldersData_user.serializer,
        json,
      );
}

abstract class GUserFoldersData_user_folders
    implements
        Built<GUserFoldersData_user_folders,
            GUserFoldersData_user_foldersBuilder>,
        _i2.GPartialFolderFields {
  GUserFoldersData_user_folders._();

  factory GUserFoldersData_user_folders(
          [Function(GUserFoldersData_user_foldersBuilder b) updates]) =
      _$GUserFoldersData_user_folders;

  static void _initializeBuilder(GUserFoldersData_user_foldersBuilder b) =>
      b..G__typename = 'FolderNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  _i3.GRating? get rating;
  @override
  String get description;
  @override
  String? get thumbnailImageURL;
  static Serializer<GUserFoldersData_user_folders> get serializer =>
      _$gUserFoldersDataUserFoldersSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFoldersData_user_folders.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFoldersData_user_folders? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFoldersData_user_folders.serializer,
        json,
      );
}
