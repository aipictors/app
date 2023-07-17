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

abstract class GUserFolderData
    implements Built<GUserFolderData, GUserFolderDataBuilder> {
  GUserFolderData._();

  factory GUserFolderData([Function(GUserFolderDataBuilder b) updates]) =
      _$GUserFolderData;

  static void _initializeBuilder(GUserFolderDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserFolderData_user? get user;
  static Serializer<GUserFolderData> get serializer =>
      _$gUserFolderDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolderData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFolderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolderData.serializer,
        json,
      );
}

abstract class GUserFolderData_user
    implements Built<GUserFolderData_user, GUserFolderData_userBuilder> {
  GUserFolderData_user._();

  factory GUserFolderData_user(
          [Function(GUserFolderData_userBuilder b) updates]) =
      _$GUserFolderData_user;

  static void _initializeBuilder(GUserFolderData_userBuilder b) =>
      b..G__typename = 'UserNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GUserFolderData_user_folders> get folders;
  static Serializer<GUserFolderData_user> get serializer =>
      _$gUserFolderDataUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolderData_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFolderData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolderData_user.serializer,
        json,
      );
}

abstract class GUserFolderData_user_folders
    implements
        Built<GUserFolderData_user_folders,
            GUserFolderData_user_foldersBuilder>,
        _i2.GPartialFolderFields {
  GUserFolderData_user_folders._();

  factory GUserFolderData_user_folders(
          [Function(GUserFolderData_user_foldersBuilder b) updates]) =
      _$GUserFolderData_user_folders;

  static void _initializeBuilder(GUserFolderData_user_foldersBuilder b) =>
      b..G__typename = 'FolderNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  _i3.GRating get rating;
  @override
  int get likesCount;
  @override
  int get viewsCount;
  @override
  GUserFolderData_user_folders_thumbnailImage? get thumbnailImage;
  static Serializer<GUserFolderData_user_folders> get serializer =>
      _$gUserFolderDataUserFoldersSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolderData_user_folders.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFolderData_user_folders? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolderData_user_folders.serializer,
        json,
      );
}

abstract class GUserFolderData_user_folders_thumbnailImage
    implements
        Built<GUserFolderData_user_folders_thumbnailImage,
            GUserFolderData_user_folders_thumbnailImageBuilder>,
        _i2.GPartialFolderFields_thumbnailImage {
  GUserFolderData_user_folders_thumbnailImage._();

  factory GUserFolderData_user_folders_thumbnailImage(
      [Function(GUserFolderData_user_folders_thumbnailImageBuilder b)
          updates]) = _$GUserFolderData_user_folders_thumbnailImage;

  static void _initializeBuilder(
          GUserFolderData_user_folders_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserFolderData_user_folders_thumbnailImage>
      get serializer => _$gUserFolderDataUserFoldersThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolderData_user_folders_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFolderData_user_folders_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolderData_user_folders_thumbnailImage.serializer,
        json,
      );
}
