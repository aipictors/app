// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_works.data.gql.g.dart';

abstract class GUserWorksData
    implements Built<GUserWorksData, GUserWorksDataBuilder> {
  GUserWorksData._();

  factory GUserWorksData([Function(GUserWorksDataBuilder b) updates]) =
      _$GUserWorksData;

  static void _initializeBuilder(GUserWorksDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserWorksData_user? get user;
  static Serializer<GUserWorksData> get serializer =>
      _$gUserWorksDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserWorksData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserWorksData.serializer,
        json,
      );
}

abstract class GUserWorksData_user
    implements Built<GUserWorksData_user, GUserWorksData_userBuilder> {
  GUserWorksData_user._();

  factory GUserWorksData_user(
      [Function(GUserWorksData_userBuilder b) updates]) = _$GUserWorksData_user;

  static void _initializeBuilder(GUserWorksData_userBuilder b) =>
      b..G__typename = 'UserNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GUserWorksData_user_works> get works;
  static Serializer<GUserWorksData_user> get serializer =>
      _$gUserWorksDataUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserWorksData_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserWorksData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserWorksData_user.serializer,
        json,
      );
}

abstract class GUserWorksData_user_works
    implements
        Built<GUserWorksData_user_works, GUserWorksData_user_worksBuilder> {
  GUserWorksData_user_works._();

  factory GUserWorksData_user_works(
          [Function(GUserWorksData_user_worksBuilder b) updates]) =
      _$GUserWorksData_user_works;

  static void _initializeBuilder(GUserWorksData_user_worksBuilder b) =>
      b..G__typename = 'WorkNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  GUserWorksData_user_works_image? get image;
  static Serializer<GUserWorksData_user_works> get serializer =>
      _$gUserWorksDataUserWorksSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserWorksData_user_works.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserWorksData_user_works? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserWorksData_user_works.serializer,
        json,
      );
}

abstract class GUserWorksData_user_works_image
    implements
        Built<GUserWorksData_user_works_image,
            GUserWorksData_user_works_imageBuilder> {
  GUserWorksData_user_works_image._();

  factory GUserWorksData_user_works_image(
          [Function(GUserWorksData_user_works_imageBuilder b) updates]) =
      _$GUserWorksData_user_works_image;

  static void _initializeBuilder(GUserWorksData_user_works_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get downloadURL;
  static Serializer<GUserWorksData_user_works_image> get serializer =>
      _$gUserWorksDataUserWorksImageSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserWorksData_user_works_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserWorksData_user_works_image? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserWorksData_user_works_image.serializer,
        json,
      );
}
