// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_folder_fields_fragment.data.gql.g.dart';

abstract class GPartialFolderFields {
  String get G__typename;
  String get id;
  String get title;
  int get rating;
  int get likesCount;
  int get viewsCount;
  GPartialFolderFields_user get user;
  Map<String, dynamic> toJson();
}

abstract class GPartialFolderFields_user {
  String get G__typename;
  String get id;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GPartialFolderFieldsData
    implements
        Built<GPartialFolderFieldsData, GPartialFolderFieldsDataBuilder>,
        GPartialFolderFields {
  GPartialFolderFieldsData._();

  factory GPartialFolderFieldsData(
          [Function(GPartialFolderFieldsDataBuilder b) updates]) =
      _$GPartialFolderFieldsData;

  static void _initializeBuilder(GPartialFolderFieldsDataBuilder b) =>
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
  GPartialFolderFieldsData_user get user;
  static Serializer<GPartialFolderFieldsData> get serializer =>
      _$gPartialFolderFieldsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialFolderFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialFolderFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialFolderFieldsData.serializer,
        json,
      );
}

abstract class GPartialFolderFieldsData_user
    implements
        Built<GPartialFolderFieldsData_user,
            GPartialFolderFieldsData_userBuilder>,
        GPartialFolderFields_user {
  GPartialFolderFieldsData_user._();

  factory GPartialFolderFieldsData_user(
          [Function(GPartialFolderFieldsData_userBuilder b) updates]) =
      _$GPartialFolderFieldsData_user;

  static void _initializeBuilder(GPartialFolderFieldsData_userBuilder b) =>
      b..G__typename = 'UserNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GPartialFolderFieldsData_user> get serializer =>
      _$gPartialFolderFieldsDataUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialFolderFieldsData_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialFolderFieldsData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialFolderFieldsData_user.serializer,
        json,
      );
}
