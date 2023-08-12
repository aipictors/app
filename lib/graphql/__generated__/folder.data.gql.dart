// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'folder.data.gql.g.dart';

abstract class GFolderData implements Built<GFolderData, GFolderDataBuilder> {
  GFolderData._();

  factory GFolderData([Function(GFolderDataBuilder b) updates]) = _$GFolderData;

  static void _initializeBuilder(GFolderDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFolderData_folder? get folder;
  static Serializer<GFolderData> get serializer => _$gFolderDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFolderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderData.serializer,
        json,
      );
}

abstract class GFolderData_folder
    implements Built<GFolderData_folder, GFolderData_folderBuilder> {
  GFolderData_folder._();

  factory GFolderData_folder([Function(GFolderData_folderBuilder b) updates]) =
      _$GFolderData_folder;

  static void _initializeBuilder(GFolderData_folderBuilder b) =>
      b..G__typename = 'FolderNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get nanoid;
  String get title;
  bool get isPrivate;
  String get description;
  GFolderData_folder_user? get user;
  int get createdAt;
  _i2.GRating? get rating;
  String? get thumbnailImageURL;
  static Serializer<GFolderData_folder> get serializer =>
      _$gFolderDataFolderSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderData_folder.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFolderData_folder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderData_folder.serializer,
        json,
      );
}

abstract class GFolderData_folder_user
    implements
        Built<GFolderData_folder_user, GFolderData_folder_userBuilder>,
        _i3.GWorkUserFields {
  GFolderData_folder_user._();

  factory GFolderData_folder_user(
          [Function(GFolderData_folder_userBuilder b) updates]) =
      _$GFolderData_folder_user;

  static void _initializeBuilder(GFolderData_folder_userBuilder b) =>
      b..G__typename = 'UserNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  String get login;
  @override
  GFolderData_folder_user_iconImage? get iconImage;
  GFolderData_folder_user_viewer? get viewer;
  static Serializer<GFolderData_folder_user> get serializer =>
      _$gFolderDataFolderUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderData_folder_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFolderData_folder_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderData_folder_user.serializer,
        json,
      );
}

abstract class GFolderData_folder_user_iconImage
    implements
        Built<GFolderData_folder_user_iconImage,
            GFolderData_folder_user_iconImageBuilder>,
        _i3.GWorkUserFields_iconImage {
  GFolderData_folder_user_iconImage._();

  factory GFolderData_folder_user_iconImage(
          [Function(GFolderData_folder_user_iconImageBuilder b) updates]) =
      _$GFolderData_folder_user_iconImage;

  static void _initializeBuilder(GFolderData_folder_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GFolderData_folder_user_iconImage> get serializer =>
      _$gFolderDataFolderUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderData_folder_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFolderData_folder_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderData_folder_user_iconImage.serializer,
        json,
      );
}

abstract class GFolderData_folder_user_viewer
    implements
        Built<GFolderData_folder_user_viewer,
            GFolderData_folder_user_viewerBuilder> {
  GFolderData_folder_user_viewer._();

  factory GFolderData_folder_user_viewer(
          [Function(GFolderData_folder_user_viewerBuilder b) updates]) =
      _$GFolderData_folder_user_viewer;

  static void _initializeBuilder(GFolderData_folder_user_viewerBuilder b) =>
      b..G__typename = 'UserViewerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get isFollowee;
  bool get isMuted;
  static Serializer<GFolderData_folder_user_viewer> get serializer =>
      _$gFolderDataFolderUserViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderData_folder_user_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFolderData_folder_user_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderData_folder_user_viewer.serializer,
        json,
      );
}
